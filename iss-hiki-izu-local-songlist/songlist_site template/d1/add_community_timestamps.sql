-- 曲ごとの開始時刻（コミュニティ提供のタイムスタンプ）
-- stream_index は streams.source_index（= docs/data/streams.json の index）。
-- streams.id ではないので注意（間違えると投入しても画面に出ない）。

CREATE TABLE IF NOT EXISTS community_timestamps (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  channel_code    TEXT    NOT NULL,          -- 'new' | 'old' など channels.code
  stream_index    INTEGER NOT NULL,          -- streams.source_index（= streams.json の index）
  song_index      INTEGER NOT NULL,          -- セットリスト内インデックス (0-based)
  time_seconds    INTEGER NOT NULL,
  status          TEXT    NOT NULL DEFAULT 'pending',  -- 'pending' | 'approved' | 'rejected'
  submitter_note  TEXT,
  created_at      TEXT    NOT NULL DEFAULT (datetime('now')),
  reviewed_at     TEXT,
  reviewer_note   TEXT
);

CREATE INDEX IF NOT EXISTS idx_ct_lookup
  ON community_timestamps (channel_code, stream_index, status);
CREATE INDEX IF NOT EXISTS idx_ct_status_created
  ON community_timestamps (status, created_at DESC);
