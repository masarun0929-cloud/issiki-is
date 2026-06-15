import { state } from '../store.js';
import { TIMELINE_INITIAL, TIMELINE_STEP } from '../config.js';
import { $, $$, escapeHtml, fmtDate, streamKey } from '../utils.js';
import { isStreamInAnyPlaylist } from './playlists.js';
import { icon } from '../icons.js';

const TIMELINE_COPY_ICON = '<svg viewBox="0 0 24 24" width="13" height="13" aria-hidden="true"><rect x="9" y="2" width="6" height="4" rx="1"/><path d="M9 4H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-2"/></svg>';
const TIMELINE_PLAY_ICON = '<svg viewBox="0 0 24 24" width="13" height="13" aria-hidden="true"><polygon points="6 4 19 12 6 20 6 4"/></svg>';
const TIMELINE_YT_ICON = '<svg viewBox="0 0 24 24" width="13" height="13" aria-hidden="true"><path d="M10 8.5v7l6-3.5-6-3.5z"/><rect x="3" y="6" width="18" height="12" rx="4"/></svg>';

export function renderTimeline() {
  const { streams } = state.data;
  const filter = state.timelineFilter;
  const filtered = filter
    ? streams.filter(s => s.songs.some(sg => sg.key === filter.key))
    : streams;
  const visible = sortTimelineStreams(filtered, state.timelineSort);

  const panel = $('#panel-timeline');
  panel.innerHTML = `
    <div class="section-header">
      <h2>${icon('calendar')} 配信タイムライン</h2>
      <span class="count-pill">${visible.length}枠</span>
    </div>
    <div class="timeline-tools">
      <label class="timeline-sort-field" for="timeline-sort">
        <span>並び替え</span>
        <select id="timeline-sort" class="select-input">
          <option value="date-desc"${state.timelineSort === 'date-desc' ? ' selected' : ''}>配信日（新しい順）</option>
          <option value="date-asc"${state.timelineSort === 'date-asc' ? ' selected' : ''}>配信日（古い順）</option>
          <option value="songs-desc"${state.timelineSort === 'songs-desc' ? ' selected' : ''}>曲数（多い順）</option>
          <option value="songs-asc"${state.timelineSort === 'songs-asc' ? ' selected' : ''}>曲数（少ない順）</option>
          <option value="index-desc"${state.timelineSort === 'index-desc' ? ' selected' : ''}>枠番号（大きい順）</option>
          <option value="index-asc"${state.timelineSort === 'index-asc' ? ' selected' : ''}>枠番号（小さい順）</option>
          <option value="title"${state.timelineSort === 'title' ? ' selected' : ''}>タイトル順</option>
        </select>
      </label>
    </div>
    <div id="timeline-filter-banner"></div>
    <div id="timeline" class="timeline"></div>
    <div class="timeline-controls" id="timeline-controls"></div>
  `;

  $('#timeline-sort')?.addEventListener('change', (event) => {
    state.timelineSort = event.target.value || 'date-desc';
    state.timelineLimit = TIMELINE_INITIAL;
    renderTimeline();
  });

  const banner = $('#timeline-filter-banner');
  if (filter) {
    const totalCount = visible.reduce(
      (n, s) => n + s.songs.filter(sg => sg.key === filter.key).length, 0);
    banner.innerHTML = `
      <div class="filter-banner">
        <span class="filter-icon">${icon('search')}</span>
        <div class="filter-text">
          <strong>${escapeHtml(filter.title)}</strong>
          <span style="color:var(--ink-mute);"> / ${escapeHtml(filter.artist)}</span>
          <span class="meta">この曲を歌った配信のみ表示中（${visible.length}枠 / ${totalCount}回歌唱）</span>
        </div>
        <button class="clear-btn" id="clear-filter">${icon('close')} 絞り込みを解除</button>
      </div>
    `;
    $('#clear-filter').addEventListener('click', () => {
      state.timelineFilter = null;
      state.timelineLimit = TIMELINE_INITIAL;
      renderTimeline();
    });
  }

  if (!visible.length) {
    $('#timeline').innerHTML = `<div class="empty-state">該当する配信がありません 🐠</div>`;
    return;
  }

  const limited = visible.slice(0, state.timelineLimit);
  $('#timeline').innerHTML = limited.map((s, idx) => renderItem(s, idx, filter)).join('');
  if (state.timelineFocus) {
    const focus = document.querySelector(`[data-streamkey="${CSS.escape(state.timelineFocus)}"]`);
    const item = focus?.closest('.timeline-item');
    item?.classList.add('focus');
    item?.scrollIntoView({ behavior: 'smooth', block: 'center' });
    state.timelineFocus = null;
  }
  $('#timeline').onclick = async (event) => {
    const btn = event.target.closest('[data-copy-stream]');
    if (!btn) return;
    event.preventDefault();
    event.stopPropagation();
    const stream = limited[Number(btn.dataset.copyStream)];
    if (!stream) return;
    try {
      await navigator.clipboard.writeText(formatStreamSetlist(stream));
      btn.classList.add('is-copied');
      btn.setAttribute('aria-label', 'コピー済み');
      btn.title = 'コピー済み';
      setTimeout(() => {
        btn.classList.remove('is-copied');
        btn.setAttribute('aria-label', 'セトリをコピー');
        btn.title = 'セトリをコピー';
      }, 1200);
    } catch (_) {
      btn.classList.add('is-error');
      btn.setAttribute('aria-label', 'コピーに失敗');
      btn.title = 'コピーに失敗';
      setTimeout(() => {
        btn.classList.remove('is-error');
        btn.setAttribute('aria-label', 'セトリをコピー');
        btn.title = 'セトリをコピー';
      }, 1200);
    }
  };

  const ctrl = $('#timeline-controls');
  if (state.timelineLimit < visible.length) {
    ctrl.innerHTML = `<button class="load-more-btn" id="load-more">▼ もっと見る (残り${visible.length - state.timelineLimit}枠)</button>`;
    $('#load-more').addEventListener('click', () => {
      state.timelineLimit += TIMELINE_STEP;
      renderTimeline();
    });
  }
}

function renderItem(s, idx, filter) {
  const recentClass = !filter && state.timelineSort === 'date-desc' && idx < 3 ? 'recent' : '';
  const setlistHtml = s.songs.map((song, i) => {
    const hit = filter && song.key === filter.key ? ' hit' : '';
    return `
      <li class="setlist-item${hit}">
        <span class="setlist-num">${i + 1}.</span>
        <button class="setlist-title" type="button"
          data-songkey="${escapeHtml(song.key)}"
          data-songtitle="${escapeHtml(song.title)}"
          data-songartist="${escapeHtml(song.artist)}"
          title="曲詳細を表示">${escapeHtml(song.title)}</button>
        <span class="setlist-separator">/</span>
        <button class="setlist-artist" type="button"
          data-artist-search="${escapeHtml(song.artist)}"
          title="全曲リストで絞り込み">${escapeHtml(song.artist)}</button>
      </li>`;
  }).join('');
  const titleHtml = s.url
    ? `<a href="${escapeHtml(s.url)}" target="_blank" rel="noopener">${escapeHtml(s.title || '配信')}</a>`
    : escapeHtml(s.title || '配信');
  const skey = streamKey(s);
  const watchHtml = s.url
    ? `<span class="watch-actions">
        <button class="watch-open-link" type="button" data-stream-play="${escapeHtml(skey)}" aria-label="動画ビューワーで開く" title="動画ビューワーで開く">${TIMELINE_PLAY_ICON}</button>
        <a class="watch-youtube-link" href="${escapeHtml(s.url)}" target="_blank" rel="noopener" aria-label="YouTubeで開く" title="YouTubeで開く">${TIMELINE_YT_ICON}</a>
      </span>`
    : '';
  const saved = isStreamInAnyPlaylist(skey);
  const saveHtml = `<button class="timeline-save-btn${saved ? ' is-saved' : ''}" type="button" data-playlist-add="${escapeHtml(skey)}" data-stream-title="${escapeHtml(s.title || '配信')}" title="${saved ? 'プレイリストに保存済み' : 'プレイリストに保存'}">${icon('bookmark')}</button>`;
  const copyHtml = `<button class="timeline-copy-btn" type="button" data-copy-stream="${idx}" aria-label="セトリをコピー" title="セトリをコピー">${TIMELINE_COPY_ICON}</button>`;
  const open = filter ? ' open' : '';
  return `
    <details class="timeline-item ${recentClass}"${open}>
      <span class="stream-anchor" data-streamkey="${escapeHtml(streamKey(s))}"></span>
      <summary class="timeline-summary">
        <span class="timeline-date-badge">${fmtDate(s.date).replace(/^\d{4}\//, '')}</span>
        <span class="timeline-summary-main">
          <span class="timeline-head">
            <span class="timeline-stream-no">第${s.index}枠</span>
            <span class="timeline-songcount">${icon('check')} ${s.songs.length}曲</span>
          </span>
          <span class="timeline-title">${titleHtml}</span>
        </span>
        <span class="timeline-actions">
          ${saveHtml}
          ${copyHtml}
          ${watchHtml}
        </span>
      </summary>
      <div class="timeline-setlist"><ol class="setlist-list">${setlistHtml}</ol></div>
    </details>
  `;
}

function sortTimelineStreams(streams, sort) {
  const list = [...streams];
  const dateTime = (stream) => stream.date instanceof Date
    ? stream.date.getTime()
    : new Date(stream.date || 0).getTime();
  const streamIndex = (stream) => Number(stream.index) || 0;
  const songCount = (stream) => stream.songs?.length || 0;
  const byDateDesc = (a, b) => dateTime(b) - dateTime(a) || streamIndex(b) - streamIndex(a);

  switch (sort) {
    case 'date-asc':
      list.sort((a, b) => dateTime(a) - dateTime(b) || streamIndex(a) - streamIndex(b));
      break;
    case 'songs-desc':
      list.sort((a, b) => songCount(b) - songCount(a) || byDateDesc(a, b));
      break;
    case 'songs-asc':
      list.sort((a, b) => songCount(a) - songCount(b) || byDateDesc(a, b));
      break;
    case 'index-desc':
      list.sort((a, b) => streamIndex(b) - streamIndex(a) || byDateDesc(a, b));
      break;
    case 'index-asc':
      list.sort((a, b) => streamIndex(a) - streamIndex(b) || byDateDesc(a, b));
      break;
    case 'title':
      list.sort((a, b) => String(a.title || '').localeCompare(String(b.title || ''), 'ja') || byDateDesc(a, b));
      break;
    case 'date-desc':
    default:
      list.sort(byDateDesc);
      break;
  }
  return list;
}

function formatStreamSetlist(stream) {
  return (stream.songs || [])
    .map((song) => {
      const title = String(song?.title || '').trim();
      const artist = String(song?.artist || '').trim();
      return artist ? `${title} / ${artist}` : title;
    })
    .filter(Boolean)
    .join('\n');
}
