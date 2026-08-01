import { state } from '../store.js';
import { $, escapeHtml, fmtDate, formatNumber } from '../utils.js';
import { icon } from '../icons.js';

export function renderLives() {
  const lives = state.lives || [];
  const stats = state.liveStats || {};
  const panel = $('#panel-lives');

  panel.innerHTML = `
    <div class="section-header">
      <h2>${icon('sparkle')} リアルライブ情報</h2>
      <span class="count-pill">${formatNumber(lives.length)}公演</span>
    </div>
    <div class="live-summary-grid">
      <div class="live-summary-card">
        <span>登録ライブ</span>
        <strong>${formatNumber(stats.totalLives ?? lives.length)}</strong>
        <small>公演</small>
      </div>
      <div class="live-summary-card">
        <span>ライブ歌唱曲</span>
        <strong>${formatNumber(stats.totalSongs ?? lives.reduce((sum, live) => sum + live.songs.length, 0))}</strong>
        <small>曲</small>
      </div>
      <div class="live-summary-card">
        <span>最新ライブ</span>
        <strong>${latestDateText(stats.latestDate, lives)}</strong>
        <small>開催日</small>
      </div>
    </div>
    <div class="live-list" id="live-list"></div>
  `;

  if (!lives.length) {
    $('#live-list').innerHTML = '<div class="empty-state">ライブ情報はまだ登録されていません</div>';
    return;
  }

  $('#live-list').innerHTML = lives.map(renderLive).join('');
}

function latestDateText(value, lives) {
  if (value) return String(value).replaceAll('-', '/');
  const latest = lives[0]?.date;
  return latest ? fmtDate(latest) : '—';
}

function renderLive(live) {
  // 歌枠データにある曲だけ詳細を開けるようにする（ライブ限定曲は無反応にしない）
  const knownKeys = new Set((state.data?.songs || []).map((s) => s.key));

  const songs = (live.songs || []).map((song, index) => {
    const label = escapeHtml(song.title || song.raw || '');
    const titleHtml = song.key && knownKeys.has(song.key)
      ? `<button class="live-song-title live-song-link" type="button" data-songkey="${escapeHtml(song.key)}" title="曲詳細を表示">${label}</button>`
      : `<span class="live-song-title">${label}</span>`;
    const artistHtml = song.artist && song.artist !== '(不明)'
      ? `<button class="live-song-artist artist-search-btn" type="button" data-artist-search="${escapeHtml(song.artist)}" title="このアーティストの曲を絞り込む">${escapeHtml(song.artist)}</button>`
      : '';
    return `
    <li>
      <span class="live-song-number">${song.position || index + 1}</span>
      ${titleHtml}
      ${artistHtml}
    </li>`;
  }).join('');

  return `
    <article class="live-card">
      <header class="live-card-head">
        <div>
          <div class="live-date">${fmtDate(live.date) || escapeHtml(live.dateRaw || '')}</div>
          <h3>${escapeHtml(live.title || `ライブ #${live.index || ''}`)}</h3>
        </div>
        <span class="live-song-count">${formatNumber(live.songCount || live.songs?.length || 0)}曲</span>
      </header>
      <ol class="live-setlist">${songs}</ol>
    </article>
  `;
}
