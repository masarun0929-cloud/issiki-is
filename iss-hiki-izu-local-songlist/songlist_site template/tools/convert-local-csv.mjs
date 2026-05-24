import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const csvPath = path.resolve(root, '..', 'songlist.csv');
const setlistCsvPath = path.resolve(root, '..', 'setlist.csv');
const liveSetlistCsvPath = path.resolve(root, '..', 'live-setlist.csv');
const dataDir = path.resolve(root, 'docs', 'data');

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

function clean(value) {
  return String(value || '').trim();
}

function toNumber(value) {
  const num = Number(clean(value).replace(/,/g, '').replace(/[^\d.-]/g, ''));
  return Number.isFinite(num) ? num : 0;
}

function makeKey(title, artist) {
  return `${title}__${artist}`.toLowerCase();
}

function normalizeLookupText(value) {
  return clean(value)
    .toLowerCase()
    .replace(/[！-～]/g, (ch) => String.fromCharCode(ch.charCodeAt(0) - 0xfee0))
    .replace(/　/g, ' ')
    .replace(/\s+/g, '')
    .replace(/[()（）［］\[\]「」『』"“”']/g, '');
}

function normalizeDate(raw) {
  const value = clean(raw);
  const match = value.match(/^(\d{4})\/(\d{1,3})\/(\d{1,2})$/);
  if (!match) return { dateRaw: value, date: value.replaceAll('/', '-') };
  const year = match[1];
  let month = match[2];
  const day = match[3];
  if (Number(month) > 12 && month.length === 3) {
    month = month.slice(0, 2);
  }
  return {
    dateRaw: `${year}/${month.padStart(2, '0')}/${day.padStart(2, '0')}`,
    date: `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`,
  };
}

function splitSongRaw(raw) {
  const value = clean(raw);
  const index = value.lastIndexOf('/');
  if (index < 0) {
    return { title: value, artist: '(不明)' };
  }
  return {
    title: clean(value.slice(0, index)),
    artist: clean(value.slice(index + 1)) || '(不明)',
  };
}

function songToGenre(title, artist) {
  const text = `${title} ${artist}`.toLowerCase();
  if (/初音ミク|鏡音|巡音|flower|vocaloid|deco\*27|kanaria|ナユタン|wowaka|ピノキオピー|ハチ/.test(text)) return 'ボカロ';
  if (/yoasobi|ado|米津|ヨルシカ|ずっと真夜中|official髭男|mrs\.?|king gnu|vaundy|back number|西野カナ/.test(text)) return 'J-POP';
  if (/アニメ|残酷な天使|god knows|butter-fly|unravel|only my railgun|アイドル/.test(text)) return 'アニソン';
  return '未分類';
}

function summaryNumber(summaryRow, preferredIndex, fallbackStart = 4) {
  const preferred = toNumber(summaryRow[preferredIndex]);
  if (preferred) return preferred;
  for (let index = fallbackStart; index < summaryRow.length; index += 1) {
    const value = toNumber(summaryRow[index]);
    if (value) return value;
  }
  return 0;
}

const rows = parseCsv(fs.readFileSync(csvPath, 'utf8')).filter((row) => row.some((cell) => clean(cell)));
const summary = rows[0] || [];
const updateRaw = clean(summary[3]) || '2026/05/17';
const updateDate = updateRaw.replaceAll('/', '-');
const total = toNumber(summary[4]);
const repertoire = toNumber(summary[7]) || summaryNumber(summary, 5);
const streamCount = toNumber(summary[8]) || summaryNumber(summary, 6);
const avgPerStream = toNumber(summary[9]) || toNumber(summary[7]);

const songs = rows.slice(2)
  .map((row) => {
    const sourceIndex = toNumber(row[0]);
    const title = clean(row[1]);
    const reading = clean(row[2]);
    const artist = clean(row[3]) || '(不明)';
    const count = toNumber(row[4]);
    if (!title) return null;
    const genre = songToGenre(title, artist);
    return {
      sourceIndex,
      title,
      reading,
      artist,
      count,
      key: makeKey(title, artist),
      displayKey: '',
      keyText: '',
      genre,
      genreText: genre,
      channels: ['new'],
    };
  })
  .filter(Boolean);

const songByKey = new Map(songs.map((song) => [song.key, song]));
const songByTitleArtist = new Map(songs.map((song) => [
  `${normalizeLookupText(song.title)}__${normalizeLookupText(song.artist)}`,
  song,
]));
const songByTitle = new Map();
for (const song of songs) {
  const titleKey = normalizeLookupText(song.title);
  if (!songByTitle.has(titleKey)) songByTitle.set(titleKey, []);
  songByTitle.get(titleKey).push(song);
}

function resolveSong(raw) {
  const parsed = splitSongRaw(raw);
  const directKey = makeKey(parsed.title, parsed.artist);
  if (songByKey.has(directKey)) return { song: songByKey.get(directKey), parsed };
  const lookupKey = `${normalizeLookupText(parsed.title)}__${normalizeLookupText(parsed.artist)}`;
  if (songByTitleArtist.has(lookupKey)) return { song: songByTitleArtist.get(lookupKey), parsed };
  const titleMatches = songByTitle.get(normalizeLookupText(parsed.title)) || [];
  if (titleMatches.length === 1) return { song: titleMatches[0], parsed };
  return { song: null, parsed };
}

function loadStreams() {
  if (!fs.existsSync(setlistCsvPath)) return [];
  const setlistRows = parseCsv(fs.readFileSync(setlistCsvPath, 'utf8'));
  const dates = setlistRows[1] || [];
  const titles = setlistRows[2] || [];
  const urls = setlistRows[3] || [];
  const counts = setlistRows[4] || [];
  const streams = [];

  for (let col = 1; col < dates.length; col += 1) {
    const dateCell = clean(dates[col]);
    const title = clean(titles[col]);
    const url = clean(urls[col]);
    if (!dateCell && !title && !url) continue;

    const { dateRaw, date } = normalizeDate(dateCell);
    const streamSongs = [];
    for (let row = 5; row < setlistRows.length; row += 1) {
      const raw = clean(setlistRows[row]?.[col]);
      if (!raw) continue;
      const { song, parsed } = resolveSong(raw);
      streamSongs.push({
        key: song?.key || makeKey(parsed.title, parsed.artist),
        title: song?.title || parsed.title,
        artist: song?.artist || parsed.artist,
        raw,
      });
    }

    streams.push({
      index: col,
      channel: 'new',
      dateRaw,
      date,
      title,
      url,
      songCount: toNumber(counts[col]) || streamSongs.length,
      songs: streamSongs,
    });
  }

  return streams;
}

function loadLives() {
  if (!fs.existsSync(liveSetlistCsvPath)) return [];
  const liveRows = parseCsv(fs.readFileSync(liveSetlistCsvPath, 'utf8'));
  const dates = liveRows[1] || [];
  const titles = liveRows[2] || [];
  const lives = [];

  for (let col = 1; col < dates.length; col += 1) {
    const dateCell = clean(dates[col]);
    const title = clean(titles[col]);
    if (!dateCell && !title) continue;
    const { dateRaw, date } = normalizeDate(dateCell);
    const liveSongs = [];

    for (let row = 3; row < liveRows.length; row += 1) {
      const raw = clean(liveRows[row]?.[col]);
      if (!raw) continue;
      const { song, parsed } = resolveSong(raw);
      liveSongs.push({
        position: liveSongs.length + 1,
        key: song?.key || makeKey(parsed.title, parsed.artist),
        title: song?.title || parsed.title,
        artist: song?.artist || parsed.artist,
        raw,
      });
    }

    lives.push({
      index: col,
      dateRaw,
      date,
      title,
      songCount: liveSongs.length,
      songs: liveSongs,
    });
  }

  return lives.sort((a, b) => String(b.date).localeCompare(String(a.date)));
}

const streamItems = loadStreams();
const liveItems = loadLives();

const stats = {
  title: '一色イズ　歌唱データベース',
  updateText: `更新日：${updateRaw}`,
  updateDate,
  total: total || songs.reduce((sum, song) => sum + song.count, 0),
  repertoire: repertoire || songs.length,
  streams: streamItems.length || streamCount,
  avgPerStream,
  channelId: 'new',
  channelLabel: '歌った曲リスト',
  keyPublished: false,
};

fs.mkdirSync(dataDir, { recursive: true });
fs.writeFileSync(path.join(dataDir, 'songs.json'), `${JSON.stringify({
  generatedAt: new Date().toISOString(),
  channels: { new: songs },
}, null, 2)}\n`);
fs.writeFileSync(path.join(dataDir, 'streams.json'), `${JSON.stringify({
  generatedAt: new Date().toISOString(),
  channels: { new: streamItems },
}, null, 2)}\n`);
fs.writeFileSync(path.join(dataDir, 'lives.json'), `${JSON.stringify({
  generatedAt: new Date().toISOString(),
  stats: {
    totalLives: liveItems.length,
    totalSongs: liveItems.reduce((sum, live) => sum + live.songs.length, 0),
    latestDate: liveItems[0]?.date || '',
  },
  lives: liveItems,
}, null, 2)}\n`);
fs.writeFileSync(path.join(dataDir, 'meta.json'), `${JSON.stringify({
  generatedAt: new Date().toISOString(),
  channels: { new: stats },
  combined: stats,
}, null, 2)}\n`);

console.log(`Converted ${songs.length} songs, ${streamItems.length} streams, and ${liveItems.length} lives`);
