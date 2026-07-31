CREATE TABLE IF NOT EXISTS channels (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  code TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS artists (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  normalized_name TEXT NOT NULL UNIQUE,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  normalized_title TEXT NOT NULL,
  artist_id INTEGER REFERENCES artists(id) ON DELETE SET NULL,
  song_key TEXT NOT NULL UNIQUE,
  display_key TEXT NOT NULL DEFAULT '',
  genre TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS streams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  channel_id INTEGER NOT NULL REFERENCES channels(id) ON DELETE CASCADE,
  source_index INTEGER,
  streamed_on TEXT NOT NULL,
  title TEXT,
  url TEXT,
  url_key TEXT NOT NULL DEFAULT '',
  song_count INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(channel_id, streamed_on, url_key)
);

CREATE TABLE IF NOT EXISTS stream_songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stream_id INTEGER NOT NULL REFERENCES streams(id) ON DELETE CASCADE,
  song_id INTEGER REFERENCES songs(id) ON DELETE SET NULL,
  position INTEGER NOT NULL,
  raw_text TEXT,
  title_snapshot TEXT NOT NULL,
  artist_snapshot TEXT,
  song_key_snapshot TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(stream_id, position)
);

CREATE TABLE IF NOT EXISTS song_channel_stats (
  song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  channel_id INTEGER NOT NULL REFERENCES channels(id) ON DELETE CASCADE,
  sing_count INTEGER NOT NULL DEFAULT 0,
  source_index INTEGER,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (song_id, channel_id)
);

CREATE TABLE IF NOT EXISTS live_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  source_index INTEGER,
  performed_on TEXT NOT NULL,
  title TEXT NOT NULL,
  song_count INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(performed_on, title)
);

CREATE TABLE IF NOT EXISTS live_event_songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  live_event_id INTEGER NOT NULL REFERENCES live_events(id) ON DELETE CASCADE,
  song_id INTEGER REFERENCES songs(id) ON DELETE SET NULL,
  position INTEGER NOT NULL,
  raw_text TEXT,
  title_snapshot TEXT NOT NULL,
  artist_snapshot TEXT,
  song_key_snapshot TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(live_event_id, position)
);

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
);

CREATE INDEX IF NOT EXISTS idx_songs_artist_id ON songs(artist_id);
CREATE INDEX IF NOT EXISTS idx_songs_display_key ON songs(display_key);
CREATE INDEX IF NOT EXISTS idx_songs_genre ON songs(genre);
CREATE INDEX IF NOT EXISTS idx_streams_channel_date ON streams(channel_id, streamed_on DESC);
CREATE INDEX IF NOT EXISTS idx_stream_songs_stream_id ON stream_songs(stream_id);
CREATE INDEX IF NOT EXISTS idx_stream_songs_song_id ON stream_songs(song_id);
CREATE INDEX IF NOT EXISTS idx_song_channel_stats_channel_id ON song_channel_stats(channel_id);
CREATE INDEX IF NOT EXISTS idx_live_events_date ON live_events(performed_on DESC);
CREATE INDEX IF NOT EXISTS idx_live_event_songs_event_id ON live_event_songs(live_event_id);
CREATE INDEX IF NOT EXISTS idx_live_event_songs_song_id ON live_event_songs(song_id);
CREATE INDEX IF NOT EXISTS idx_song_requests_votes ON song_requests(vote_count DESC, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_song_requests_created ON song_requests(created_at DESC);

INSERT INTO channels (code, name, sort_order)
VALUES
  ('new', '歌った曲リスト', 1)
ON CONFLICT(code) DO UPDATE SET
  name = excluded.name,
  sort_order = excluded.sort_order;
