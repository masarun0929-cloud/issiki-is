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

CREATE INDEX IF NOT EXISTS idx_song_requests_votes ON song_requests(vote_count DESC, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_song_requests_created ON song_requests(created_at DESC);
