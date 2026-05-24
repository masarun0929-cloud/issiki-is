import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const inputPath = process.argv[2]
  ? path.resolve(process.argv[2])
  : path.resolve(root, '..', 'songlist.csv');
const outputPath = process.argv[3]
  ? path.resolve(process.argv[3])
  : path.resolve(root, 'd1', 'generated', 'songlist_seed.sql');

function parseCsv(text) {
  const rows = [];
  let row = [];
  let cell = '';
  let quoted = false;

  for (let i = 0; i < text.length; i += 1) {
    const ch = text[i];
    const next = text[i + 1];
    if (quoted) {
      if (ch === '"' && next === '"') {
        cell += '"';
        i += 1;
      } else if (ch === '"') {
        quoted = false;
      } else {
        cell += ch;
      }
    } else if (ch === '"') {
      quoted = true;
    } else if (ch === ',') {
      row.push(cell);
      cell = '';
    } else if (ch === '\n') {
      row.push(cell.replace(/\r$/, ''));
      rows.push(row);
      row = [];
      cell = '';
    } else {
      cell += ch;
    }
  }

  if (cell.length || row.length) {
    row.push(cell.replace(/\r$/, ''));
    rows.push(row);
  }
  return rows;
}

function normalize(value) {
  return String(value == null ? '' : value).trim().replace(/\s+/g, ' ').normalize('NFKC');
}

function normalizedKey(value) {
  return normalize(value).toLowerCase();
}

function toNumber(value) {
  const num = Number(normalize(value).replace(/,/g, '').replace(/[^\d.-]/g, ''));
  return Number.isFinite(num) ? num : 0;
}

function sqlString(value) {
  return `'${String(value == null ? '' : value).replace(/'/g, "''")}'`;
}

function songKey(title, artist) {
  return `${normalizedKey(title)}__${normalizedKey(artist)}`;
}

function loadSongs() {
  const rows = parseCsv(fs.readFileSync(inputPath, 'utf8'));
  const songsByKey = new Map();

  for (const row of rows.slice(2)) {
    const sourceIndex = toNumber(row[0]);
    const title = normalize(row[1]);
    const artist = normalize(row[3]) || '(不明)';
    const count = toNumber(row[4]);
    if (!title) continue;

    const key = songKey(title, artist);
    const current = songsByKey.get(key);
    if (current) {
      current.singCount += count;
      if (!current.sourceIndex && sourceIndex) current.sourceIndex = sourceIndex;
      continue;
    }

    songsByKey.set(key, {
      sourceIndex,
      title,
      artist,
      normalizedTitle: normalizedKey(title),
      normalizedArtist: normalizedKey(artist),
      songKey: key,
      singCount: count,
    });
  }

  return [...songsByKey.values()];
}

const songs = loadSongs();
const artists = [...new Map(songs.map((song) => [song.normalizedArtist, song.artist])).entries()]
  .map(([normalizedName, name]) => ({ normalizedName, name }))
  .sort((a, b) => a.name.localeCompare(b.name, 'ja'));

const lines = [
  '-- Generated from songlist CSV.',
  '-- Source columns: B=title, D=artist, E=sing_count.',
  '-- Run d1/schema.sql first, then this seed SQL.',
  'BEGIN TRANSACTION;',
  '',
  "INSERT INTO channels (code, name, sort_order) VALUES ('new', '歌った曲リスト', 1)",
  'ON CONFLICT(code) DO UPDATE SET name = excluded.name, sort_order = excluded.sort_order;',
  '',
];

for (const artist of artists) {
  lines.push(
    `INSERT INTO artists (name, normalized_name) VALUES (${sqlString(artist.name)}, ${sqlString(artist.normalizedName)})`,
    'ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;'
  );
}

lines.push('');

for (const song of songs) {
  lines.push(
    `INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES (${sqlString(song.title)}, ${sqlString(song.normalizedTitle)}, (SELECT id FROM artists WHERE normalized_name = ${sqlString(song.normalizedArtist)}), ${sqlString(song.songKey)})`,
    'ON CONFLICT(song_key) DO UPDATE SET',
    '  title = excluded.title,',
    '  normalized_title = excluded.normalized_title,',
    '  artist_id = excluded.artist_id;'
  );
}

lines.push('');

for (const song of songs) {
  lines.push(
    `INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = ${sqlString(song.songKey)}), (SELECT id FROM channels WHERE code = 'new'), ${song.singCount}, ${song.sourceIndex || 'NULL'}, CURRENT_TIMESTAMP)`,
    'ON CONFLICT(song_id, channel_id) DO UPDATE SET',
    '  sing_count = excluded.sing_count,',
    '  source_index = excluded.source_index,',
    '  updated_at = CURRENT_TIMESTAMP;'
  );
}

lines.push('', 'COMMIT;', '');

fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, lines.join('\n'), 'utf8');

console.log(`Generated ${outputPath}`);
console.log(`Songs: ${songs.length}`);
console.log(`Artists: ${artists.length}`);
