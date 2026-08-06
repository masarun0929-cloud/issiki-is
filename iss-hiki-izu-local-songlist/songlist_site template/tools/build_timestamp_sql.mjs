/**
 * 歌枠の固定コメント（utawaku-scanner の出力）から、セトリ各曲の開始秒を割り当て、
 * community_timestamps への INSERT 文を生成する。
 *
 * 使い方:
 *   node tools/build_timestamp_sql.mjs <scan-result.json> [出力先.sql]
 *
 * 照合の優先順（変えると精度が落ちる）:
 *   1. 曲名完全一致 かつ アーティスト一致
 *   2. 曲名完全一致
 *   3. 曲名部分一致（3文字以上かつ長さ比50%以上）
 *   4. 残りを並び順で補完
 * 最後に tools/timestamp-overrides.json の手動補正を被せる。
 */
import { readFileSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

const here = dirname(fileURLToPath(import.meta.url));
const STREAMS = resolve(here, '../docs/data/streams.json');
const OVERRIDES = resolve(here, 'timestamp-overrides.json');

const scanPath = process.argv[2];
const outPath = process.argv[3] || resolve(here, '../d1/import_song_timestamps.sql');
if (!scanPath) {
  console.error('使い方: node tools/build_timestamp_sql.mjs <scan-result.json> [出力先.sql]');
  process.exit(1);
}

const TS_RE = /(\d{1,3}:\d{2}(?::\d{2})?)/g;

/** NFKC → 小文字 → 括弧内除去 → 記号/空白除去。半角カナも NFKC で吸収される */
function norm(s) {
  return String(s || '')
    .normalize('NFKC')
    .toLowerCase()
    .replace(/[（(\[【].*?[)）\]】]/g, '')
    .replace(/[\s　]/g, '')
    .replace(/[!-/:-@[-`{-~、。・！？「」『』…～－ー―‐]/g, '');
}

/** 行頭の曲番号（1. / 12) / ①）を落とす。issiki のコメントは約半数が番号付き */
function stripTrackNo(s) {
  return String(s || '').replace(/^\s*\d{1,3}\s*[.．、)）:：]\s*/, '');
}

/** "1:02:03" / "12:34" → 秒。分・秒が60以上の打ち間違いは無効として弾く */
function toSec(t) {
  const p = t.split(':').map(Number);
  if (p.length === 3) {
    if (p[1] >= 60 || p[2] >= 60) return null;
    return p[0] * 3600 + p[1] * 60 + p[2];
  }
  if (p[1] >= 60) return null;
  return p[0] * 60 + p[1];
}

/** コメントから { seconds, segments[] } の候補列を作る */
function parseCandidates(comment) {
  const out = [];
  for (const line of String(comment || '').split(/\r?\n/)) {
    const matches = [...line.matchAll(TS_RE)];
    if (!matches.length) continue;
    const seconds = toSec(matches[0][1]);
    if (seconds == null) continue;                     // 4:60:04 のような打ち間違い
    const text = line.replace(TS_RE, ' ');             // 時刻を抜いた残り全部
    const segments = [text, ...text.split(/[\/／◇|｜]+/)]
      .map((x) => norm(stripTrackNo(x.trim())))
      .filter(Boolean);
    if (!segments.length) continue;                    // [雑談] などは空になる
    out.push({ seconds, segments });
  }
  return out.sort((a, b) => a.seconds - b.seconds);
}

const scan = JSON.parse(readFileSync(scanPath, 'utf8'));
const streams = JSON.parse(readFileSync(STREAMS, 'utf8'));
let overrides = { overrides: {} };
try { overrides = JSON.parse(readFileSync(OVERRIDES, 'utf8')); } catch { /* 無ければ補正なし */ }

const byVideoId = new Map();
for (const [ch, arr] of Object.entries(streams.channels)) {
  for (const s of arr) {
    const m = String(s.url || '').match(/(?:live\/|v=|youtu\.be\/)([\w-]{11})/);
    if (m) byVideoId.set(m[1], { ch, stream: s });
  }
}

const rows = [];
const stats = { 曲名一致: 0, 部分一致: 0, 並び順: 0, 手動補正: 0 };

for (const v of scan) {
  if (v.status !== 'found') continue;
  const hit = byVideoId.get(v.videoId);
  if (!hit) continue;
  const { ch, stream } = hit;
  const songs = stream.songs || [];
  if (!songs.length) continue;

  const ov = overrides.overrides?.[v.videoId];
  const cands = ov?.mode === 'replace' ? [] : parseCandidates(v.comment);
  const assigned = new Array(songs.length).fill(null);
  const how = new Array(songs.length).fill(null);
  const used = new Set();
  const nTitle = songs.map((s) => norm(s.title));
  const nArtist = songs.map((s) => norm(s.artist));

  const take = (i, c, label) => { assigned[i] = cands[c].seconds; how[i] = label; used.add(c); };

  // 1) 曲名完全一致 かつ アーティスト一致
  for (let i = 0; i < songs.length; i++) {
    if (!nTitle[i]) continue;
    for (let c = 0; c < cands.length; c++) {
      if (used.has(c)) continue;
      const segs = cands[c].segments;
      if (segs.includes(nTitle[i]) && nArtist[i] && segs.includes(nArtist[i])) { take(i, c, '曲名一致'); break; }
    }
  }
  // 2) 曲名完全一致
  for (let i = 0; i < songs.length; i++) {
    if (assigned[i] != null || !nTitle[i]) continue;
    for (let c = 0; c < cands.length; c++) {
      if (used.has(c)) continue;
      if (cands[c].segments.includes(nTitle[i])) { take(i, c, '曲名一致'); break; }
    }
  }
  // 3) 部分一致（3文字以上かつ長さ比50%以上）
  for (let i = 0; i < songs.length; i++) {
    if (assigned[i] != null || !nTitle[i] || nTitle[i].length < 3) continue;
    for (let c = 0; c < cands.length; c++) {
      if (used.has(c)) continue;
      const ok = cands[c].segments.some((s) => {
        if (s.length < 3) return false;
        const [a, b] = s.length >= nTitle[i].length ? [s, nTitle[i]] : [nTitle[i], s];
        return a.includes(b) && b.length / a.length >= 0.5;
      });
      if (ok) { take(i, c, '部分一致'); break; }
    }
  }
  // 4) 残りを並び順で補完（前後に確定済みがある区間のみ）
  const idxOf = (sec) => cands.findIndex((c) => c.seconds === sec);
  for (let i = 0; i < songs.length; i++) {
    if (assigned[i] != null) continue;
    let lo = -1, hi = cands.length;
    for (let k = i - 1; k >= 0; k--) if (assigned[k] != null) { lo = idxOf(assigned[k]); break; }
    for (let k = i + 1; k < songs.length; k++) if (assigned[k] != null) { hi = idxOf(assigned[k]); break; }
    for (let c = lo + 1; c < hi; c++) {
      if (used.has(c)) continue;
      take(i, c, '並び順'); break;
    }
  }

  // 5) 手動補正を最後に被せる
  for (const s of ov?.songs || []) {
    const sec = toSec(String(s.at));
    if (sec == null) { console.warn(`  補正の時刻が不正: ${v.videoId} ${s.at}`); continue; }
    let i = s.songIndex;
    if (i == null) i = songs.findIndex((g, k) => g.key === s.key && assigned[k] == null);
    if (i == null || i < 0 || !songs[i]) { console.warn(`  補正先が見つからない: ${v.videoId} ${s.key}`); continue; }
    if (s.key && songs[i].key !== s.key) { console.warn(`  補正の key 不一致: ${v.videoId} #${i} ${songs[i].key} != ${s.key}`); continue; }
    assigned[i] = sec; how[i] = '手動補正';
  }

  for (let i = 0; i < songs.length; i++) {
    if (assigned[i] == null) continue;
    stats[how[i]] = (stats[how[i]] || 0) + 1;
    rows.push({ ch, streamIndex: stream.index, songIndex: i, seconds: assigned[i], how: how[i] });
  }
}

// ── 検算: セトリ順に時刻が単調増加しているか ──
const byStream = new Map();
for (const r of rows) {
  const k = `${r.ch}#${r.streamIndex}`;
  if (!byStream.has(k)) byStream.set(k, []);
  byStream.get(k).push(r);
}
let inversions = 0;
for (const arr of byStream.values()) {
  arr.sort((a, b) => a.songIndex - b.songIndex);
  for (let i = 1; i < arr.length; i++) if (arr[i].seconds < arr[i - 1].seconds) inversions++;
}

// ── SQL 生成（1文が長すぎると D1 が受け付けないので400行ずつ）──
const esc = (s) => String(s).replace(/'/g, "''");
const reviewedAt = new Date().toISOString();
const chunks = [];
for (let i = 0; i < rows.length; i += 400) chunks.push(rows.slice(i, i + 400));

const sql = [
  '-- 曲ごとの開始時刻。tools/build_timestamp_sql.mjs で生成',
  `-- 生成日時: ${reviewedAt}`,
  `-- 件数: ${rows.length}`,
  '',
  "-- ユーザー投稿の pending / rejected は消さない",
  "DELETE FROM community_timestamps WHERE status = 'approved';",
  '',
  ...chunks.map((chunk) =>
    'INSERT INTO community_timestamps\n' +
    '  (channel_code, stream_index, song_index, time_seconds, status, reviewed_at, reviewer_note)\nVALUES\n' +
    chunk.map((r) => `  ('${esc(r.ch)}', ${r.streamIndex}, ${r.songIndex}, ${r.seconds}, 'approved', '${reviewedAt}', '${esc(r.how)}')`).join(',\n') +
    ';\n',
  ),
].join('\n');

writeFileSync(outPath, sql, 'utf8');

const totalSongs = Object.values(streams.channels).flat().reduce((a, s) => a + (s.songs || []).length, 0);
console.log('=== 照合結果 ===');
console.log('総曲数    :', totalSongs);
console.log('割当済み  :', rows.length, `(${(rows.length / totalSongs * 100).toFixed(1)}%)`);
console.log('内訳      :', JSON.stringify(stats));
console.log('時刻の逆転:', inversions, inversions ? '← 要確認' : '(なし)');
console.log('SQL 出力  :', outPath, `(${chunks.length}ブロック)`);
