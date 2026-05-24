// Start here when adapting this site for another Vtuber.
// Most public-facing names, links, Spreadsheet tabs, and labels live in this file.
export const SITE = {
  creatorName: '一色イズ',
  databaseName: '歌唱データベース',
  heroIcon: '☆',
  tagline: '~ Izu Song Archive ~',
  editionLabel: 'Local Preview',
  baseUrl: './',
  description: '一色イズさんの歌った曲リスト、ランキング、検索をまとめたローカル試作版の歌唱データベース。',
  fanLabel: '一色イズ ファン',
  contactUrl: '#',
  storagePrefix: 'isshiki-izu-songlist',
  officialLinks: [
    { label: 'YouTube', url: 'https://www.youtube.com/@%E4%B8%80%E8%89%B2%E3%82%A4%E3%82%BA', className: 'youtube' },
    { label: 'X', url: 'https://x.com/isshiki_is', className: 'x-link' },
  ],
};

export const SHEET_ID = 'replace_with_google_spreadsheet_id';

export const CHANNELS = {
  new: {
    id: 'new',
    label: '歌った曲リスト',
    listGid: '0',
    setlistGid: 'replace_with_main_setlist_gid',
  },
};

export const DEFAULT_CHANNEL = 'new';
export const COMBINED_CHANNEL = {
  id: 'all',
  label: '全期間',
};
export const SHOW_COMBINED_CHANNEL = false;
export const SHOW_AUDIENCE_SWITCH = true;
export const SHOW_SONG_KEYS = false;

// Used only when the app has to infer a genre because songs.genre is empty.
// Add the Vtuber's own name, unit name, and original project names here.
export const ORIGINAL_GENRE_KEYWORDS = ['一色イズ', 'イズ'];

// Legacy aliases (kept for backwards compatibility)
export const LIST_GID = CHANNELS.new.listGid;
export const SETLIST_GID = CHANNELS.new.setlistGid;

export const TIMELINE_INITIAL = 12;
export const TIMELINE_STEP = 12;
export const RANKING_LIST_LIMIT = 50;
export const TOP_ARTISTS_LIMIT = 20;
export const ACTIVITY_RECENT_LIMIT = 5;

export const DAYS_FRESH = 30;
export const DAYS_STALE = 180;

export const SOURCE_URL = './songlist.csv';

export const gvizUrl = (gid) =>
  `https://docs.google.com/spreadsheets/d/${SHEET_ID}/gviz/tq?tqx=out:csv&gid=${gid}&_t=${Date.now()}`;
