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
      created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
      updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  `).run();
  await env.DB.prepare('CREATE INDEX IF NOT EXISTS idx_song_requests_votes ON song_requests(vote_count DESC, created_at DESC)').run();
  await env.DB.prepare('CREATE INDEX IF NOT EXISTS idx_song_requests_created ON song_requests(created_at DESC)').run();
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

async function createRequest(env, request) {
  const payload = cleanPayload(await readJson(request));
  const result = await env.DB.prepare(`
    INSERT INTO song_requests (title, artist, url, requester_name)
    VALUES (?, ?, ?, ?)
  `).bind(payload.title, payload.artist, payload.url, payload.requesterName).run();
  const id = result.meta?.last_row_id;
  const row = await env.DB.prepare(`
    SELECT id, title, artist, url, requester_name, status, vote_count, created_at, updated_at
    FROM song_requests
    WHERE id = ?
  `).bind(id).first();
  return json({ ok: true, item: toItem(row) }, 201);
}

async function voteRequest(env, id) {
  if (!Number.isInteger(id) || id <= 0) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }

  await env.DB.prepare(`
    UPDATE song_requests
    SET vote_count = vote_count + 1, updated_at = CURRENT_TIMESTAMP
    WHERE id = ?
  `).bind(id).run();
  const row = await env.DB.prepare(`
    SELECT id, title, artist, url, requester_name, status, vote_count, created_at, updated_at
    FROM song_requests
    WHERE id = ?
  `).bind(id).first();
  if (!row) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }
  return { ok: true, item: toItem(row) };
}

async function unvoteRequest(env, id) {
  if (!Number.isInteger(id) || id <= 0) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }

  await env.DB.prepare(`
    UPDATE song_requests
    SET vote_count = CASE WHEN vote_count > 0 THEN vote_count - 1 ELSE 0 END,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = ?
  `).bind(id).run();
  const row = await env.DB.prepare(`
    SELECT id, title, artist, url, requester_name, status, vote_count, created_at, updated_at
    FROM song_requests
    WHERE id = ?
  `).bind(id).first();
  if (!row) {
    const error = new Error('リクエストが見つかりません');
    error.status = 404;
    throw error;
  }
  return { ok: true, item: toItem(row) };
}

async function route({ request, env, params }) {
  if (!env.DB) return json({ error: 'D1 binding DB is missing' }, 500);
  await ensureSchema(env);

  const path = Array.isArray(params.path) ? params.path.join('/') : (params.path || '');
  if (request.method === 'GET' && !path) return json(await listRequests(env, request));
  if (request.method === 'POST' && !path) return createRequest(env, request);

  const voteMatch = path.match(/^(\d+)\/vote$/);
  if (request.method === 'POST' && voteMatch) {
    return json(await voteRequest(env, Number(voteMatch[1])));
  }

  const unvoteMatch = path.match(/^(\d+)\/unvote$/);
  if (request.method === 'POST' && unvoteMatch) {
    return json(await unvoteRequest(env, Number(unvoteMatch[1])));
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
