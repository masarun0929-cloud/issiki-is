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
import { fileURLToPath, pathToFileURL } from 'node:url';
import { dirname, resolve } from 'node:path';

const here = dirname(fileURLToPath(import.meta.url));
// 照合ロジックは管理画面と共有する（実装を二重に持たない）
const { matchSetlist, toSeconds } = await import(
  pathToFileURL(resolve(here, '../docs/js/admin/timestamp-matcher.js')).href
);
const STREAMS = resolve(here, '../docs/data/streams.json');
const OVERRIDES = resolve(here, 'timestamp-overrides.json');

const scanPath = process.argv[2];
const outPath = process.argv[3] || resolve(here, '../d1/import_song_timestamps.sql');
if (!scanPath) {
  console.error('使い方: node tools/build_timestamp_sql.mjs <scan-result.json> [出力先.sql]');
  process.exit(1);
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
  // 照合は管理画面と共有のロジック（docs/js/admin/timestamp-matcher.js）を使う
  const matched = ov?.mode === 'replace' ? songs.map(() => ({ seconds: null, how: null })) : matchSetlist(songs, v.comment);
  const assigned = matched.map((m) => m.seconds);
  const how = matched.map((m) => m.how);

  // 手動補正を最後に被せる
  for (const s of ov?.songs || []) {
    const sec = toSeconds(String(s.at));
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
