// プレイリスト永続化の唯一の所有者(localStorage キー: `${SITE.storagePrefix}-playlists`)。
// 読み書きは必ずこのモジュールを経由する(views/playlists.js も委譲)。
import { SITE } from '../config.js';

const PLAYLISTS_KEY = `${SITE.storagePrefix}-playlists`;

// ─── Below-Player: Playlist helpers ──────────────────────────────────────────

export function getPlaylists() {
  try { return JSON.parse(localStorage.getItem(PLAYLISTS_KEY) || 'null') || []; }
  catch (_) { return []; }
}

export function savePlaylists(pls) {
  try { localStorage.setItem(PLAYLISTS_KEY, JSON.stringify(pls)); } catch (_) {}
}

/** streamKey（または 'mv:<id>'）がいずれかのプレイリストに含まれるか */
export function isStreamInAnyPlaylist(skey) {
  return getPlaylists().some(p => p.streams.includes(skey));
}
