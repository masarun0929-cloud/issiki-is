function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      'content-type': 'application/json; charset=utf-8',
      'cache-control': 'no-store',
    },
  });
}

function normalize(value) {
  return String(value == null ? '' : value).trim().replace(/\s+/g, ' ').normalize('NFKC');
}

async function readJson(request) {
  const text = await request.text();
  return text ? JSON.parse(text) : {};
}

async function ensureSchema(env) {
  await env.DB.prepare(`
    CREATE TABLE IF NOT EXISTS song_requests (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      artist TEXT NOT NULL DEFAULT '',
      url TEXT NOT NULL DEFAULT '',
      requester_name TEXT NOT NULL DEFAULT '',
      status TEXT NOT NULL DEFAULT 'unregistered',
      vote_count INTEGER NOT NULL DEFAULT 0,
      owner_token_hash TEXT,
      created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
      updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  `).run();
  // 既存テーブルにも投稿者トークン列を足す。既にあれば ALTER が失敗するので無視する。
  try {
    await env.DB.prepare('ALTER TABLE song_requests ADD COLUMN owner_token_hash TEXT').run();
  } catch {
    // 追加済み
  }
  try {
    // 連続投稿の判定に使う投稿者ハッシュ（生IPは保存しない）
    await env.DB.prepare('ALTER TABLE song_requests ADD COLUMN submitter_hash TEXT').run();
  } catch {
    // 追加済み
  }
  await env.DB.prepare('CREATE INDEX IF NOT EXISTS idx_song_requests_votes ON song_requests(vote_count DESC, created_at DESC)').run();
  await env.DB.prepare('CREATE INDEX IF NOT EXISTS idx_song_requests_created ON song_requests(created_at DESC)').run();
}

/**
 * 投稿者本人だけが取り消せるようにするためのトークン。
 * 作成時に1度だけ返し、DBにはSHA-256ハッシュだけを保存する。
 */
function generateOwnerToken() {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(bytes);
  return [...bytes].map((b) => b.toString(16).padStart(2, '0')).join('');
}

async function hashOwnerToken(token) {
  const digest = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(token));
  return [...new Uint8Array(digest)].map((b) => b.toString(16).padStart(2, '0')).join('');
}

function toItem(row) {
  return {
    id: row.id,
    title: row.title,
    artist: row.artist || '',
    url: row.url || '',
    requesterName: row.requester_name || '',
    status: row.status || 'unregistered',
    voteCount: row.vote_count || 0,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
  };
}

function cleanPayload(payload) {
  const title = normalize(payload.title).slice(0, 120);
  const artist = normalize(payload.artist).slice(0, 120);
  const url = normalize(payload.url).slice(0, 2000);
  const requesterName = normalize(payload.requesterName).slice(0, 40);

  if (!title) {
    const error = new Error('曲名を入力してください');
    error.status = 400;
    throw error;
  }

  if (url) {
    try {
      const parsed = new URL(url);
      if (!['http:', 'https:'].includes(parsed.protocol)) throw new Error('invalid protocol');
    } catch {
      const error = new Error('URLの形式を確認してください');
      error.status = 400;
      throw error;
    }
  }

  return { title, artist, url, requesterName };
}

async function listRequests(env, request) {
  const url = new URL(request.url);
  const limit = Math.max(1, Math.min(200, Number(url.searchParams.get('limit')) || 100));
  const result = await env.DB.prepare(`
    SELECT id, title, artist, url, requester_name, status, vote_count, created_at, updated_at
    FROM song_requests
    ORDER BY vote_count DESC, created_at DESC, id DESC
    LIMIT ?
  `).bind(limit).all();
  return { items: (result.results || []).map(toItem) };
}

/**
 * 短時間の連続投稿を止める。誰でも投稿できるフォームなので、
 * 無制限だと一人で一覧を埋め尽くせてしまう。
 */
async function assertNotFlooding(env, request) {
  await ensureVoteSchema(env);
  const hash = await voterHash(request, env);
  const row = await env.DB.prepare(`
    SELECT COUNT(*) AS n FROM song_requests
    WHERE submitter_hash = ? AND created_at > datetime('now', '-10 minutes')
  `).bind(hash).first().catch(() => null);
  if (row && Number(row.n) >= 5) {
    const error = new Error('短時間に送りすぎです。しばらく待ってから試してください');
    error.status = 429;
    throw error;
  }
  return hash;
}

async function createRequest(env, request) {
  const payload = cleanPayload(await readJson(request));
  const submitterHash = await assertNotFlooding(env, request);
  const ownerToken = generateOwnerToken();
  const result = await env.DB.prepare(`
    INSERT INTO song_requests (title, artist, url, requester_name, owner_token_hash, submitter_hash)
    VALUES (?, ?, ?, ?, ?, ?)
  `).bind(
    payload.title,
    payload.artist,
    payload.url,
    payload.requesterName,
    await hashOwnerToken(ownerToken),
    submitterHash,
  ).run();
  const id = result.meta?.last_row_id;
  const row = await env.DB.prepare(`
    SELECT id, title, artist, url, requester_name, status, vote_count, created_at, updated_at
    FROM song_requests
    WHERE id = ?
  `).bind(id).first();
  // ownerToken はここでしか返さない。投稿者のブラウザだけが保持する。
  return json({ ok: true, item: toItem(row), ownerToken }, 201);
}

/**
 * 投稿者本人による取り消し。
 * 誰かが投票済み、または運営が対応を始めた後は取り消せない。
 */
async function deleteOwnRequest(env, id, payload) {
  if (!Number.isInteger(id) || id <= 0) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }

  const token = normalize(payload.ownerToken);
  if (!token) {
    const error = new Error('取り消しキーがありません');
    error.status = 400;
    throw error;
  }

  const row = await env.DB.prepare(`
    SELECT id, status, vote_count, owner_token_hash
    FROM song_requests
    WHERE id = ?
  `).bind(id).first();

  if (!row) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }

  if (!row.owner_token_hash || row.owner_token_hash !== await hashOwnerToken(token)) {
    const error = new Error('このリクエストは取り消せません');
    error.status = 403;
    throw error;
  }

  if ((row.vote_count || 0) > 1) {
    const error = new Error('他の人が投票しているため取り消せません');
    error.status = 409;
    throw error;
  }

  if ((row.status || 'unregistered') !== 'unregistered') {
    const error = new Error('すでに対応が始まっているため取り消せません');
    error.status = 409;
    throw error;
  }

  await env.DB.prepare('DELETE FROM song_requests WHERE id = ?').bind(id).run();
  return { ok: true, id };
}

/**
 * 投票者の識別子。生IPは保存せず、ソルト付きハッシュだけを持つ。
 * localStorage だけの管理では API を直接叩けば何度でも票を増やせるため、
 * サーバー側でも1人1票にするために使う。
 */
async function voterHash(request, env) {
  const ip = request.headers.get('CF-Connecting-IP')
    || request.headers.get('x-forwarded-for')
    || 'unknown';
  const salt = env.VOTE_SALT || 'song-request-vote';
  const digest = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(`${salt}:${ip}`));
  return [...new Uint8Array(digest)].map((b) => b.toString(16).padStart(2, '0')).join('');
}

async function ensureVoteSchema(env) {
  await env.DB.prepare(`
    CREATE TABLE IF NOT EXISTS song_request_votes (
      request_id  INTEGER NOT NULL,
      voter_hash  TEXT    NOT NULL,
      created_at  TEXT    NOT NULL DEFAULT (datetime('now')),
      PRIMARY KEY (request_id, voter_hash)
    )
  `).run();
  await env.DB.prepare('CREATE INDEX IF NOT EXISTS idx_srv_voter ON song_request_votes (voter_hash, created_at DESC)').run();
}

async function fetchRequestOr404(env, id) {
  const row = await env.DB.prepare(`
    SELECT id, title, artist, url, requester_name, status, vote_count, created_at, updated_at
    FROM song_requests WHERE id = ?
  `).bind(id).first();
  if (!row) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }
  return row;
}

async function voteRequest(env, id, request) {
  if (!Number.isInteger(id) || id <= 0) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }
  await ensureVoteSchema(env);
  await fetchRequestOr404(env, id);

  // 既に投票済みなら票は増やさない（PRIMARY KEY で弾く）
  const inserted = await env.DB.prepare(
    'INSERT OR IGNORE INTO song_request_votes (request_id, voter_hash) VALUES (?, ?)',
  ).bind(id, await voterHash(request, env)).run();

  if (inserted.meta?.changes > 0) {
    await env.DB.prepare(`
      UPDATE song_requests
      SET vote_count = vote_count + 1, updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(id).run();
  }
  return { ok: true, item: toItem(await fetchRequestOr404(env, id)) };
}

async function unvoteRequest(env, id, request) {
  if (!Number.isInteger(id) || id <= 0) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }
  await ensureVoteSchema(env);

  // 自分の票が無ければ何も減らさない
  const removed = await env.DB.prepare(
    'DELETE FROM song_request_votes WHERE request_id = ? AND voter_hash = ?',
  ).bind(id, await voterHash(request, env)).run();
  if (!(removed.meta?.changes > 0)) {
    return { ok: true, item: toItem(await fetchRequestOr404(env, id)) };
  }

  await env.DB.prepare(`
    UPDATE song_requests
    SET vote_count = CASE WHEN vote_count > 0 THEN vote_count - 1 ELSE 0 END,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = ?
  `).bind(id).run();
  return { ok: true, item: toItem(await fetchRequestOr404(env, id)) };
}

async function route({ request, env, params }) {
  if (!env.DB) return json({ error: 'D1 binding DB is missing' }, 500);
  await ensureSchema(env);

  const path = Array.isArray(params.path) ? params.path.join('/') : (params.path || '');
  if (request.method === 'GET' && !path) return json(await listRequests(env, request));
  if (request.method === 'POST' && !path) return createRequest(env, request);

  const voteMatch = path.match(/^(\d+)\/vote$/);
  if (request.method === 'POST' && voteMatch) {
    return json(await voteRequest(env, Number(voteMatch[1]), request));
  }

  const unvoteMatch = path.match(/^(\d+)\/unvote$/);
  if (request.method === 'POST' && unvoteMatch) {
    return json(await unvoteRequest(env, Number(unvoteMatch[1]), request));
  }

  const deleteMatch = path.match(/^(\d+)\/delete$/);
  if (request.method === 'POST' && deleteMatch) {
    return json(await deleteOwnRequest(env, Number(deleteMatch[1]), await readJson(request)));
  }

  return json({ error: 'Not found' }, 404);
}

export async function onRequest(context) {
  try {
    return await route(context);
  } catch (error) {
    return json({ error: error.message || String(error) }, error.status || 500);
  }
}
