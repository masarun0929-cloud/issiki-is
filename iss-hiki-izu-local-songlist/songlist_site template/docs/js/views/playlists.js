/**
 * プレイリスト管理ビュー
 *
 * Sub-tabs:
 *   「歌枠一覧」  — 全配信枠をサムネグリッド表示
 *   「歌みた・オリ曲」— music.json の動画ライブラリ（グリッド/リスト/カテゴリ切替）
 *   「マイリスト」 — localStorage 保存のユーザー作成プレイリスト
 *
 * localStorage データ形式:
 *   ${SITE.storagePrefix}-playlists = [{ id, name, createdAt, streams: [streamKey|"mv:<id>",...] }]
 */

import { state } from '../state.js';
import { $, escapeHtml, fmtDate, streamKey, youtubeThumb, youtubeThumbFallback, youtubeVideoId } from '../utils.js';
import { icon } from '../icons.js';
import { SITE } from '../config.js';

const STORAGE_KEY = `${SITE.storagePrefix}-playlists`;
const MUSIC_CACHE_KEY = `${SITE.storagePrefix}-music-videos-cache-v2`;
const PER_PAGE    = 24; // 4列 × 6行

/* ── モジュールレベルの状態（サブタブ / ページ） ─────────────────────────── */

let _activeSubTab = 'all-streams';
let _streamPage   = 1;
let _streamSort   = 'newest';
let _musicView    = 'grid';     // 'grid' | 'list' | 'category'
let _musicVideos  = null;       // キャッシュ済み music.json の videos 配列
let _musicLoadPromise = null;
let _musicLoading = false;
let _musicQuery   = '';
let _musicSearchDebounce = null;
let _musicSelectMode = false;        // 歌みた・オリ曲: まとめて追加の選択モード
const _musicSelection = new Set();   // 選択中の動画 id

/* ── データ操作（localStorage） ─────────────────────────────────────────── */

export function getPlaylists() {
  try { return JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]'); }
  catch (_) { return []; }
}

function savePlaylists(lists) {
  try { localStorage.setItem(STORAGE_KEY, JSON.stringify(lists)); } catch (_) {}
}

export function createPlaylist(name) {
  const lists = getPlaylists();
  const pl = {
    id: String(Date.now()),
    name: name.trim(),
    createdAt: new Date().toISOString(),
    streams: [],
  };
  lists.unshift(pl);
  savePlaylists(lists);
  return pl;
}

export function deletePlaylist(id) {
  savePlaylists(getPlaylists().filter(p => p.id !== id));
}

export function addStreamToPlaylist(playlistId, skey) {
  const lists = getPlaylists();
  const pl = lists.find(p => p.id === playlistId);
  if (!pl) return false;
  if (pl.streams.includes(skey)) return false;
  pl.streams.push(skey);
  savePlaylists(lists);
  return true;
}

export function removeStreamFromPlaylist(playlistId, skey) {
  const lists = getPlaylists();
  const pl = lists.find(p => p.id === playlistId);
  if (!pl) return;
  pl.streams = pl.streams.filter(s => s !== skey);
  savePlaylists(lists);
}

export function isStreamInAnyPlaylist(skey) {
  return getPlaylists().some(p => p.streams.includes(skey));
}

/* ── メイン描画 ────────────────────────────────────────────────────────── */

export function renderPlaylists() {
  const panel = $('#panel-playlists');
  if (!panel) return;

  const allStreams = state.data?.streams || [];

  // マイリストに mv: 項目があるとき music.json 未ロードだと「動画データなし」に
  // なるため、マイリスト表示時はキャッシュ即時反映 + 未取得なら fetch して再描画
  if (_activeSubTab === 'my-playlists' && _musicVideos === null) {
    const cached = _readMusicVideoCache();
    if (cached.length) {
      _musicVideos = cached;
    } else {
      _fetchMusicVideos().then(v => {
        if (_musicVideos === null) _musicVideos = Array.isArray(v) ? v : [];
        if (_activeSubTab === 'my-playlists') renderPlaylists();
      });
    }
  }

  // データ更新などによる全再描画で検索欄のフォーカスが失われないよう退避
  const searchHadFocus = document.activeElement?.id === 'pl-music-search';
  let searchSel = null;
  if (searchHadFocus) {
    try { searchSel = document.activeElement.selectionStart; } catch (_) {}
    _musicQuery = document.activeElement.value || '';
  }

  panel.innerHTML = `
    <div class="pl-wrap">
      <nav class="pl-subtabs" role="tablist" aria-label="プレイリストサブタブ">
        <button class="pl-subtab${_activeSubTab === 'all-streams'  ? ' active' : ''}"
          data-pl-subtab="all-streams"  role="tab"
          aria-selected="${_activeSubTab === 'all-streams'}">歌枠一覧</button>
        <button class="pl-subtab${_activeSubTab === 'music' ? ' active' : ''}"
          data-pl-subtab="music" role="tab"
          aria-selected="${_activeSubTab === 'music'}">歌みた・オリ曲</button>
        <button class="pl-subtab${_activeSubTab === 'my-playlists' ? ' active' : ''}"
          data-pl-subtab="my-playlists" role="tab"
          aria-selected="${_activeSubTab === 'my-playlists'}">
          マイリスト
          <span class="pl-subtab-count">${getPlaylists().length}</span>
        </button>
      </nav>
      <div class="pl-subtab-body" id="pl-subtab-body">
        ${_activeSubTab === 'all-streams'
          ? _renderAllStreams(allStreams, _streamPage)
          : _activeSubTab === 'music'
            ? _renderMusicSubtab()
            : _renderMyPlaylists(allStreams)}
      </div>
    </div>
  `;

  // music サブタブ表示中は常にローダーを起動（未取得なら fetch、取得済みなら結果同期）
  if (_activeSubTab === 'music') _loadAndRenderMusic();

  // 検索欄のフォーカス・カーソル位置を復元
  if (searchHadFocus) {
    const inp = $('#pl-music-search');
    if (inp) {
      inp.focus();
      if (searchSel !== null) { try { inp.setSelectionRange(searchSel, searchSel); } catch (_) {} }
    }
  }

  // サブタブ切り替え（panel.onclick で毎回上書き → リスナー重複なし）
  panel.onclick = (e) => {
    // ── サブタブ ──
    const subtabBtn = e.target.closest('[data-pl-subtab]');
    if (subtabBtn) {
      _activeSubTab = subtabBtn.dataset.plSubtab;
      if (_activeSubTab === 'all-streams') _streamPage = 1;
      renderPlaylists();
      return;
    }

    // ── ソート ──
    const sortBtn = e.target.closest('[data-pl-sort]');
    if (sortBtn) {
      _streamSort = sortBtn.dataset.plSort;
      _streamPage = 1;
      _renderPageInPlace(allStreams);
      return;
    }

    // ── ページネーション ──
    const pageBtn = e.target.closest('[data-pl-page]');
    if (pageBtn && !pageBtn.disabled) {
      _streamPage = Number(pageBtn.dataset.plPage);
      _renderPageInPlace(allStreams);
      return;
    }

    // ── 音楽ビュー切替 ──
    const viewBtn = e.target.closest('[data-music-view]:not([data-music-select-toggle])');
    if (viewBtn) {
      _musicView = viewBtn.dataset.musicView;
      _refreshMusicResults();
      return;
    }

    // ── 選択モード: ON/OFF トグル ──
    if (e.target.closest('[data-music-select-toggle]')) {
      _musicSelectMode = !_musicSelectMode;
      if (!_musicSelectMode) _musicSelection.clear();
      _rerenderMusicBody();
      return;
    }

    // ── 選択モード: 個別トグル（全再描画せず対象カードだけ更新＝スクロール維持）──
    const selEl = e.target.closest('[data-mv-select]');
    if (selEl) {
      const id = selEl.dataset.mvSelect;
      const nowSel = !_musicSelection.has(id);
      if (nowSel) _musicSelection.add(id); else _musicSelection.delete(id);
      const container = selEl.classList.contains('mv-list-row') ? selEl : selEl.closest('.mv-card');
      if (container) container.classList.toggle('is-selected', nowSel);
      const cb = container?.querySelector('.mv-card-checkbox, .mv-list-checkbox');
      if (cb) cb.innerHTML = nowSel ? icon('check') : '';
      selEl.setAttribute('aria-pressed', String(nowSel));
      _updateMusicSelBar();
      return;
    }

    // ── 選択モード: 表示中をすべて選択 ──
    if (e.target.closest('[data-music-select-all]')) {
      _filterMusicVideos(_musicVideos || []).forEach(({ v }) => _musicSelection.add(v.id));
      _rerenderMusicBody();
      return;
    }

    // ── 選択モード: 選択解除 ──
    if (e.target.closest('[data-music-select-clear]')) {
      _musicSelection.clear();
      _rerenderMusicBody();
      return;
    }

    // ── 選択モード: まとめて追加 ──
    if (e.target.closest('[data-music-select-add]')) {
      if (!_musicSelection.size) return;
      const keys = [...(_musicVideos || [])]
        .filter(v => _musicSelection.has(v.id))
        .map(v => 'mv:' + v.id);
      showAddToPlaylistModal(keys);
      return;
    }

    // ── 音楽動画をプレイリストに追加 ──
    const addMvBtn = e.target.closest('[data-playlist-add-mv]');
    if (addMvBtn) {
      const mvId    = addMvBtn.dataset.playlistAddMv;
      const title   = addMvBtn.dataset.streamTitle || '';
      showAddToPlaylistModal('mv:' + mvId, title);
      return;
    }

    // ── サムネクリック → 動画ビューワーで再生 ──
    const watchThumb = e.target.closest('[data-mv-watch]');
    if (watchThumb && _musicVideos?.length) {
      if (e.metaKey || e.ctrlKey || e.shiftKey || e.button === 1) return;
      e.preventDefault();
      const v = _musicVideos[Number(watchThumb.dataset.mvWatch)];
      if (v?.url) window.__openStreamViewer?.({ url: v.url, title: v.title, isMv: true });
      return;
    }

    if (_activeSubTab === 'my-playlists') {
      _handleMyPlaylistsClick(e, allStreams);
    }
  };

  // 検索
  panel.oninput = (e) => {
    const input = e.target.closest('#pl-music-search');
    if (!input) return;
    _musicQuery = input.value || '';
    clearTimeout(_musicSearchDebounce);
    _musicSearchDebounce = setTimeout(_refreshMusicResults, 100);
  };
  // IME 確定直後にも即時反映
  panel.oncompositionend = (e) => {
    const input = e.target.closest('#pl-music-search');
    if (!input) return;
    _musicQuery = input.value || '';
    clearTimeout(_musicSearchDebounce);
    _refreshMusicResults();
  };

  // サムネ 404 フォールバック
  panel.addEventListener('error', (e) => {
    const img = e.target;
    if (!img.classList.contains('pl-sg-thumb')) return;
    const fb = img.dataset.fallback;
    if (fb && img.src !== fb) { img.src = fb; delete img.dataset.fallback; }
  }, true);

  // マイリストのドラッグ並び替えを初期化
  _initDragSort();
}


/* ── 歌枠一覧グリッド ──────────────────────────────────────────────────── */

const SORT_OPTIONS = [
  { key: 'newest',      label: '新しい順' },
  { key: 'oldest',      label: '古い順'   },
  { key: 'most-songs',  label: '曲数↓'    },
  { key: 'fewest-songs',label: '曲数↑'    },
];

function _sortStreams(streams, sort) {
  const s = streams.slice();
  if (sort === 'oldest')       return s.reverse();
  if (sort === 'most-songs')   return s.sort((a, b) => (b.songs?.length ?? 0) - (a.songs?.length ?? 0));
  if (sort === 'fewest-songs') return s.sort((a, b) => (a.songs?.length ?? 0) - (b.songs?.length ?? 0));
  return s; // newest (default — already sorted newest-first)
}

function _renderAllStreams(streams, page) {
  if (!streams.length) {
    return `
      <div class="pl-empty-state">
        <p>配信データを読み込んでいます…</p>
        <p class="pl-empty-hint">先にタイムラインタブを開くとすぐに表示されます</p>
      </div>`;
  }

  const sorted     = _sortStreams(streams, _streamSort);
  const total      = sorted.length;
  const totalPages = Math.max(1, Math.ceil(total / PER_PAGE));
  const safePage   = Math.min(Math.max(1, page), totalPages);
  const start      = (safePage - 1) * PER_PAGE;
  const slice      = sorted.slice(start, start + PER_PAGE);

  const cards = slice.map(s => {
    const skey = streamKey(s);
    const thumb = youtubeThumb(s.url);
    const thumbFb = youtubeThumbFallback(s.url);
    const songCount = s.songs?.length ?? 0;
    return `
      <button class="pl-sg-card" type="button" data-stream-play="${escapeHtml(skey)}"
        title="${escapeHtml(s.title || '配信')}">
        <div class="pl-sg-thumb-wrap">
          ${thumb
            ? `<img class="pl-sg-thumb" src="${escapeHtml(thumb)}"
                data-fallback="${escapeHtml(thumbFb)}"
                alt="" loading="lazy" referrerpolicy="no-referrer">`
            : '<div class="pl-sg-thumb-placeholder"></div>'}
          <span class="pl-sg-song-badge">${songCount}<span class="pl-sg-badge-unit">曲</span></span>
          <span class="pl-sg-add${isStreamInAnyPlaylist(skey) ? ' is-saved' : ''}" role="button" tabindex="0"
            aria-label="プレイリストに追加"
            data-playlist-add="${escapeHtml(skey)}" data-stream-title="${escapeHtml(s.title || '配信')}"
            title="プレイリストに追加">${PL_BOOKMARK_SVG}</span>
        </div>
        <div class="pl-sg-info">
          <span class="pl-sg-title">${escapeHtml(s.title || '配信')}</span>
          <span class="pl-sg-date">${escapeHtml(fmtDate(s.date) || '')}</span>
        </div>
      </button>`;
  }).join('');

  const pagination = totalPages > 1 ? `
    <div class="pl-pagination">
      <button class="pl-page-btn" data-pl-page="${safePage - 1}"
        ${safePage <= 1 ? 'disabled' : ''} type="button" aria-label="前のページ">前へ</button>
      <span class="pl-page-info">${safePage} / ${totalPages}</span>
      <button class="pl-page-btn" data-pl-page="${safePage + 1}"
        ${safePage >= totalPages ? 'disabled' : ''} type="button" aria-label="次のページ">次へ</button>
    </div>` : '';

  const sortBar = `
    <div class="pl-sort-bar">
      ${SORT_OPTIONS.map(o => `
        <button class="pl-sort-opt${_streamSort === o.key ? ' active' : ''}"
          data-pl-sort="${o.key}" type="button">${o.label}</button>`).join('')}
    </div>`;

  return `${sortBar}<div class="pl-stream-grid" id="pl-stream-grid">${cards}</div>${pagination}`;
}

/** ページ切替時はグリッド部分だけ差し替えてスクロールを戻す */
function _renderPageInPlace(allStreams) {
  const body = $('#pl-subtab-body');
  if (!body) { renderPlaylists(); return; }
  body.innerHTML = _renderAllStreams(allStreams, _streamPage);
  const panel = $('#panel-playlists');
  if (panel) {
    panel.addEventListener('error', (e) => {
      const img = e.target;
      if (!img.classList.contains('pl-sg-thumb')) return;
      const fb = img.dataset.fallback;
      if (fb && img.src !== fb) { img.src = fb; delete img.dataset.fallback; }
    }, { once: true, capture: true });
  }
  body.scrollIntoView({ behavior: 'smooth', block: 'start' });
}

/* ── 歌みた・オリ曲ライブラリ ──────────────────────────────────────────── */

/** music サブタブの初期 HTML */
function _renderMusicSubtab() {
  if (_musicVideos === null) {
    const cached = _readMusicVideoCache();
    if (cached.length) _musicVideos = cached;
  }
  return _renderMusicLibrary(_musicVideos || []);
}

/** music.json を取得して結果を反映する。 */
async function _loadAndRenderMusic() {
  if (_musicVideos !== null) {
    _renderOrRefreshMusic();
    return;
  }
  _musicVideos = _readMusicVideoCache(); // キャッシュなしなら []
  _musicLoading = true;
  _renderOrRefreshMusic();
  const fetched = await _fetchMusicVideos();
  _musicLoading = false;
  _musicVideos = Array.isArray(fetched) ? fetched : [];
  _renderOrRefreshMusic();
}

function _renderOrRefreshMusic() {
  if (_activeSubTab !== 'music') return;
  const body = $('#pl-subtab-body');
  if (!body) return;
  if ($('#pl-music-search')) {
    _refreshMusicResults();
  } else {
    body.innerHTML = _renderMusicLibrary(_musicVideos || []);
  }
}

function _renderMusicLibrary(videos) {
  return _renderMusicViewBar(videos) + `<div id="pl-music-results">${_renderMusicResults(videos)}</div>`;
}

function _renderMusicViewBar(videos) {
  const query = _currentMusicQuery();
  const items = _filterMusicVideos(videos);
  const shown = items.length;
  return `
    <div class="pl-music-viewbar">
      <label class="pl-music-search-wrap">
        <span class="pl-music-search-icon" aria-hidden="true">${icon('search')}</span>
        <input id="pl-music-search" class="pl-music-search" type="search"
          value="${escapeHtml(query)}"
          placeholder="曲名 / アーティストで検索"
          aria-label="歌みた・オリ曲を検索">
      </label>
      <span class="pl-music-count">${shown}${shown === videos.length ? '' : ` / ${videos.length}`}件</span>
      <div class="pl-music-views">
        <button class="pl-music-view-btn${_musicView === 'grid'     ? ' active' : ''}" data-music-view="grid"     type="button">グリッド</button>
        <button class="pl-music-view-btn${_musicView === 'list'     ? ' active' : ''}" data-music-view="list"     type="button">リスト</button>
        <button class="pl-music-view-btn${_musicView === 'category' ? ' active' : ''}" data-music-view="category" type="button">カテゴリ</button>
        <button class="pl-music-view-btn pl-music-select-toggle${_musicSelectMode ? ' active' : ''}" data-music-select-toggle="1" type="button" ${shown ? '' : 'disabled'} title="複数選択してまとめて追加">${icon('check')} 選択</button>
      </div>
    </div>
    ${_musicSelectMode ? _renderMusicSelectBar() : ''}`;
}

/** 選択モードのアクションバー */
function _renderMusicSelectBar() {
  const n = _musicSelection.size;
  return `
    <div class="pl-music-selbar">
      <span class="pl-music-selcount" id="pl-music-selcount">${n}曲を選択中</span>
      <div class="pl-music-selactions">
        <button class="pl-sel-btn" data-music-select-all="1" type="button">表示中をすべて選択</button>
        <button class="pl-sel-btn" data-music-select-clear="1" type="button" ${n ? '' : 'disabled'}>選択解除</button>
        <button class="pl-sel-btn primary" data-music-select-add="1" type="button" ${n ? '' : 'disabled'}>${icon('plus')} ${n}曲をまとめて追加</button>
        <button class="pl-sel-btn" data-music-select-toggle="1" type="button">完了</button>
      </div>
    </div>`;
}

function _renderMusicResults(videos) {
  const items = _filterMusicVideos(videos);

  if (_musicLoading && !videos.length) {
    return `<div class="pl-empty-state"><p>読み込み中…</p><p class="pl-empty-hint">検索欄はこのまま入力できます</p></div>`;
  }
  if (!videos.length) {
    return `<div class="pl-empty-state"><p>動画が登録されていません</p><p class="pl-empty-hint">music.json に動画データを追加してください</p></div>`;
  }
  if (!items.length) {
    if (_musicLoading) {
      return `<div class="pl-empty-state"><p>最新データを確認中…</p><p class="pl-empty-hint">「${escapeHtml(_currentMusicQuery())}」の候補を読み込んでいます</p></div>`;
    }
    return `<div class="pl-empty-state"><p>一致する動画がありません</p><p class="pl-empty-hint">「曲名 / アーティスト」のように区切って検索できます</p></div>`;
  }

  if (_musicView === 'grid')     return _renderMusicGrid(items);
  if (_musicView === 'list')     return _renderMusicList(items);
  if (_musicView === 'category') return _renderMusicCategory(items);
  return _renderMusicGrid(items);
}

function _currentMusicQuery() {
  const input = $('#pl-music-search');
  if (input) _musicQuery = input.value || '';
  return _musicQuery;
}

/** 音楽サブタブ本体を丸ごと再描画する。 */
function _rerenderMusicBody() {
  const body = $('#pl-subtab-body');
  if (body) body.innerHTML = _renderMusicLibrary(_musicVideos || []);
}

/** 選択バーの件数・ボタン状態だけ更新（全再描画なし） */
function _updateMusicSelBar() {
  const n = _musicSelection.size;
  const c = $('#pl-music-selcount');
  if (c) c.textContent = `${n}曲を選択中`;
  const addBtn = document.querySelector('[data-music-select-add]');
  if (addBtn) { addBtn.disabled = !n; addBtn.innerHTML = `${icon('plus')} ${n}曲をまとめて追加`; }
  const clearBtn = document.querySelector('[data-music-select-clear]');
  if (clearBtn) clearBtn.disabled = !n;
}

function _refreshMusicResults() {
  const videos = _musicVideos || [];
  const count = $('.pl-music-count');
  if (count) {
    const shown = _filterMusicVideos(videos).length;
    count.textContent = `${shown}${shown === videos.length ? '' : ` / ${videos.length}`}件`;
  }
  document.querySelectorAll('[data-music-view]').forEach(btn => {
    btn.classList.toggle('active', btn.dataset.musicView === _musicView);
  });
  const results = $('#pl-music-results');
  if (results) results.innerHTML = _renderMusicResults(videos);
}

function _readMusicVideoCache() {
  try {
    const json = JSON.parse(localStorage.getItem(MUSIC_CACHE_KEY) || 'null');
    return Array.isArray(json?.videos) ? json.videos : [];
  } catch (_) {
    return [];
  }
}

function _writeMusicVideoCache(videos) {
  try {
    localStorage.setItem(MUSIC_CACHE_KEY, JSON.stringify({ videos, cachedAt: Date.now() }));
  } catch (_) {}
}

async function _fetchMusicVideos() {
  if (_musicLoadPromise) return _musicLoadPromise;
  _musicLoadPromise = fetch('./data/music.json', { cache: 'no-store' })
    .then(res => res.ok ? res.json() : Promise.reject(new Error(`music.json ${res.status}`)))
    .then(json => {
      const videos = Array.isArray(json?.videos) ? json.videos : [];
      _writeMusicVideoCache(videos);
      return videos;
    })
    .catch(() => _musicVideos || _readMusicVideoCache());
  return _musicLoadPromise;
}

function _normMusicSearch(text) {
  return String(text || '')
    .normalize('NFKC')
    .toLowerCase()
    .replace(/[！-～]/g, ch => String.fromCharCode(ch.charCodeAt(0) - 0xFEE0))
    .replace(/[‐-‒–—―ー]/g, '-')
    .replace(/\s+/g, ' ')
    .trim();
}

function _musicSearchTokens(query) {
  return _normMusicSearch(query)
    .split(/[\/／|｜\s]+/)
    .map(s => s.trim())
    .filter(Boolean);
}

function _musicSearchText(video) {
  const title = video.title || '';
  const slashParts = title.split(/[\/／|｜]/).map(s => s.trim()).filter(Boolean);
  const typeLabel = _mvBadge(video).label;
  return _normMusicSearch([
    title,
    ...slashParts,
    video.originalArtist,
    video.type,
    typeLabel,
  ].filter(Boolean).join(' '));
}

function _filterMusicVideos(videos) {
  const tokens = _musicSearchTokens(_currentMusicQuery());
  const indexed = videos.map((v, i) => ({ v, i }));
  if (!tokens.length) return indexed;
  return indexed.filter(({ v }) => {
    const haystack = _musicSearchText(v);
    return tokens.every(token => haystack.includes(token));
  });
}

/**
 * 動画バッジを返す。
 * - type === 'original' → オリ曲
 * - それ以外（'cover' を含む）→ カバー曲（2分類のみ）
 */
function _mvBadge(video) {
  if (video.type === 'original') {
    return { label: 'オリ曲', cls: 'mv-badge-original', sub: 'オリジナル' };
  }
  return { label: 'カバー曲', cls: 'mv-badge-cover', sub: video.originalArtist || 'カバー曲' };
}

function _musicDateText(video) {
  return video.publishedAt ? String(video.publishedAt).replaceAll('-', '/') : '公開日未登録';
}

function _musicCard(video, globalIdx) {
  const thumb = youtubeThumb(video.url);
  const thumbFb = youtubeThumbFallback(video.url);
  const { label: badge, cls: badgeClass } = _mvBadge(video);
  const saved = isStreamInAnyPlaylist('mv:' + video.id);
  // 選択モード: カードクリックで選択トグル（再生はしない）
  if (_musicSelectMode) {
    const sel = _musicSelection.has(video.id);
    return `
    <div class="mv-card mv-card--select${sel ? ' is-selected' : ''}">
      <button class="mv-card-thumb-btn" type="button" data-mv-select="${escapeHtml(video.id)}" aria-pressed="${sel}">
        ${thumb
          ? `<img class="mv-card-thumb" src="${escapeHtml(thumb)}" data-fallback="${escapeHtml(thumbFb)}" alt="" loading="lazy" referrerpolicy="no-referrer">`
          : '<div class="mv-card-thumb mv-card-thumb-placeholder"></div>'}
        <span class="mv-card-checkbox">${sel ? icon('check') : ''}</span>
        <span class="mv-type-badge ${badgeClass}">${badge}</span>
      </button>
      <div class="mv-card-info">
        <span class="mv-card-title">${escapeHtml(video.title || '—')}</span>
        <span class="mv-card-sub">${escapeHtml(_musicDateText(video))}</span>
      </div>
    </div>`;
  }
  return `
    <div class="mv-card">
      <a class="mv-card-thumb-btn" href="${escapeHtml(video.url || '#')}" target="_blank" rel="noopener"
        data-mv-watch="${globalIdx}" aria-label="動画ビューワーで見る">
        ${thumb
          ? `<img class="mv-card-thumb" src="${escapeHtml(thumb)}" data-fallback="${escapeHtml(thumbFb)}" alt="" loading="lazy" referrerpolicy="no-referrer">`
          : '<div class="mv-card-thumb mv-card-thumb-placeholder"></div>'}
        <span class="mv-card-play-icon">${icon('play')}</span>
        <span class="mv-type-badge ${badgeClass}">${badge}</span>
      </a>
      <button class="pl-sg-add mv-add-btn mv-add-btn--overlay${saved ? ' is-saved' : ''}" type="button"
        data-playlist-add-mv="${escapeHtml(video.id)}"
        data-stream-title="${escapeHtml(video.title || '')}"
        aria-label="${saved ? 'プレイリストに保存済み' : 'プレイリストに追加'}"
        title="${saved ? 'プレイリストに保存済み' : 'プレイリストに追加'}">${PL_BOOKMARK_SVG}</button>
      <div class="mv-card-info">
        <span class="mv-card-title">${escapeHtml(video.title || '—')}</span>
        <span class="mv-card-sub">${escapeHtml(_musicDateText(video))}</span>
      </div>
    </div>`;
}

function _musicListRow(video, globalIdx) {
  const thumb = youtubeThumb(video.url);
  const thumbFb = youtubeThumbFallback(video.url);
  const { label: badge, cls: badgeClass, sub } = _mvBadge(video);
  const saved = isStreamInAnyPlaylist('mv:' + video.id);
  if (_musicSelectMode) {
    const sel = _musicSelection.has(video.id);
    return `
    <div class="mv-list-row mv-list-row--select${sel ? ' is-selected' : ''}" data-mv-select="${escapeHtml(video.id)}" role="button" aria-pressed="${sel}">
      <span class="mv-list-checkbox">${sel ? icon('check') : ''}</span>
      <span class="mv-list-thumb">
        ${thumb
          ? `<img src="${escapeHtml(thumb)}" data-fallback="${escapeHtml(thumbFb)}" alt="" loading="lazy" referrerpolicy="no-referrer">`
          : ''}
      </span>
      <div class="mv-list-info">
        <span class="mv-list-title">${escapeHtml(video.title || '—')}</span>
        <span class="mv-list-sub">${escapeHtml(_musicDateText(video))}</span>
      </div>
      <span class="mv-type-badge ${badgeClass}">${badge}</span>
    </div>`;
  }
  return `
    <div class="mv-list-row">
      <a class="mv-list-thumb" href="${escapeHtml(video.url || '#')}" target="_blank" rel="noopener" aria-label="YouTubeで開く">
        ${thumb
          ? `<img src="${escapeHtml(thumb)}" data-fallback="${escapeHtml(thumbFb)}" alt="" loading="lazy" referrerpolicy="no-referrer">`
          : ''}
      </a>
      <div class="mv-list-info">
        <span class="mv-list-title">${escapeHtml(video.title || '—')}</span>
        <span class="mv-list-sub">${escapeHtml(_musicDateText(video))}</span>
      </div>
      <span class="mv-type-badge ${badgeClass}">${badge}</span>
      <button class="mv-add-btn${saved ? ' is-saved' : ''}" type="button"
        data-playlist-add-mv="${escapeHtml(video.id)}"
        data-stream-title="${escapeHtml(video.title || '')}"
        title="${saved ? 'プレイリストに保存済み' : 'プレイリストに追加'}">${icon('bookmark')}</button>
    </div>`;
}

function _renderMusicGrid(items) {
  return `<div class="mv-grid">${items.map(({ v, i }) => _musicCard(v, i)).join('')}</div>`;
}

function _renderMusicList(items) {
  return `<div class="mv-list">${items.map(({ v, i }) => _musicListRow(v, i)).join('')}</div>`;
}

/**
 * カテゴリビュー — オリ曲 / カバー曲 の2分類のみ
 */
function _renderMusicCategory(items) {
  const sections = [
    { key: 'original', label: 'オリジナル曲' },
    { key: 'cover',    label: 'カバー曲（歌みた）' },
  ].map(({ key, label }) => ({
    label,
    items: items.filter(({ v }) => {
      if (key === 'original') return v.type === 'original';
      return v.type !== 'original';
    }),
  })).filter(({ items }) => items.length > 0);

  return `
    <div class="mv-category">
      ${sections.map(({ label, items }) => `
      <div class="mv-cat-section">
        <h3 class="mv-cat-heading">${label} <span class="mv-cat-count">${items.length}</span></h3>
        <div class="mv-grid">${items.map(({ v, i }) => _musicCard(v, i)).join('')}</div>
      </div>`).join('')}
    </div>`;
}

/** 外部から music.json キャッシュにアクセス */
export function getMusicVideos() { return _musicVideos || []; }

/** 音楽 playlist item ("mv:<id>") から動画オブジェクトを解決 */
export function resolveMusicVideoId(mvKey) {
  if (!mvKey?.startsWith('mv:')) return null;
  const id = mvKey.slice(3);
  return (_musicVideos || []).find(v => v.id === id) || null;
}

/**
 * プレイリストの YouTube 動画 ID を収集する共有ヘルパー。
 */
function _playlistVideoIds(pl, allStreams) {
  return (pl.streams || [])
    .map(skey => {
      if (skey.startsWith('mv:')) {
        const mv = resolveMusicVideoId(skey);
        return mv?.url ? youtubeVideoId(mv.url) : '';
      }
      const s = allStreams.find(st => streamKey(st) === skey);
      return s?.url ? youtubeVideoId(s.url) : '';
    })
    .filter(Boolean);
}

/**
 * 動画 ID 配列から YouTube 再生 URL を開く。
 */
function _openYouTubePlaylist(videoIds) {
  if (!videoIds.length) {
    alert('YouTubeで再生できる動画がありません');
    return;
  }
  let url;
  if (videoIds.length === 1) {
    url = `https://www.youtube.com/watch?v=${videoIds[0]}`;
  } else {
    const ids = videoIds.slice(0, 50);
    if (videoIds.length > 50) {
      alert(`動画が${videoIds.length}本あります。先頭50本で連続再生します。`);
    }
    url = `https://www.youtube.com/watch_videos?video_ids=${ids.join(',')}`;
  }
  window.open(url, '_blank', 'noopener noreferrer');
}

/* ── マイリスト ────────────────────────────────────────────────────────── */

function _renderMyPlaylists(allStreams) {
  const lists = getPlaylists();
  if (!lists.length) {
    return `
      <div class="pl-empty-state">
        <p>まだプレイリストがありません</p>
        <p class="pl-empty-hint">タイムラインの配信枠から <strong>栞ボタン</strong> を押して追加できます</p>
      </div>
      <div class="pl-my-actions">
        <button class="pl-new-btn" id="pl-new-btn" type="button">${icon('plus')} 新規作成</button>
      </div>`;
  }

  return `
    <div class="pl-my-actions">
      <span class="pl-my-count">${lists.length}件のプレイリスト</span>
      <button class="pl-new-btn" id="pl-new-btn" type="button">${icon('plus')} 新規作成</button>
    </div>
    <div class="pl-grid">
      ${lists.map(pl => _renderPlaylistCard(pl, allStreams)).join('')}
    </div>`;
}

function _renderPlaylistCard(pl, allStreams) {
  const entries = pl.streams.map(skey => {
    const isMv = skey.startsWith('mv:');
    const mv   = isMv ? resolveMusicVideoId(skey) : null;
    return { skey, isMv, mv, stream: isMv ? null : allStreams.find(s => streamKey(s) === skey) };
  });

  const firstUrl = entries.find(({ stream, mv }) => stream?.url || mv?.url)?.stream?.url
    || entries.find(({ mv }) => mv?.url)?.mv?.url;
  const coverThumbs = firstUrl
    ? `<img class="pl-card-cover" src="${escapeHtml(youtubeThumb(firstUrl))}" alt="" loading="lazy" referrerpolicy="no-referrer">`
    : '';

  const items = entries.map(({ skey, isMv, mv, stream }) => {
    const moveKey = escapeHtml(pl.id + '|:|' + skey);
    const dragHandle = `<span class="pl-drag-handle" aria-hidden="true" title="ドラッグして並び替え">⠿</span>`;
    const rmBtn = `<button class="pl-rm-btn" data-pl-rm-stream="${moveKey}" type="button" title="削除">${icon('close')}</button>`;

    if (isMv) {
      if (!mv) return `
        <div class="pl-stream-row pl-stream-missing" data-pl-skey="${escapeHtml(skey)}" data-pl-id="${escapeHtml(pl.id)}">${dragHandle}
          <div class="pl-stream-info"><span class="pl-stream-title">（動画データなし）</span></div>
          <div class="pl-stream-actions">${rmBtn}</div>
        </div>`;
      const { label: badge, sub } = _mvBadge(mv);
      const mvTypeKey = mv.type === 'original' ? 'original' : 'cover';
      const mvIdx = (_musicVideos || []).indexOf(mv);
      return `
        <div class="pl-stream-row" data-pl-skey="${escapeHtml(skey)}" data-pl-id="${escapeHtml(pl.id)}">
          ${dragHandle}
          <div class="pl-stream-info">
            <span class="pl-stream-date"><span class="mv-badge-inline mv-type-${mvTypeKey}">${badge}</span></span>
            <span class="pl-stream-title">${escapeHtml(mv.title || '—')}</span>
            <span class="pl-stream-meta">${escapeHtml(sub)}</span>
          </div>
          <div class="pl-stream-actions">
            ${mvIdx >= 0
              ? `<button class="pl-play-stream-btn" data-play-music-pl="${mvIdx}" type="button" title="再生">${icon('play')}</button>`
              : ''}
            ${rmBtn}
          </div>
        </div>`;
    }

    if (!stream) return `
      <div class="pl-stream-row pl-stream-missing" data-pl-skey="${escapeHtml(skey)}" data-pl-id="${escapeHtml(pl.id)}">${dragHandle}
        <div class="pl-stream-info"><span class="pl-stream-title">（配信データなし）</span></div>
        <div class="pl-stream-actions">${rmBtn}</div>
      </div>`;
    return `
      <div class="pl-stream-row" data-pl-skey="${escapeHtml(skey)}" data-pl-id="${escapeHtml(pl.id)}">
        ${dragHandle}
        <div class="pl-stream-info">
          <span class="pl-stream-date">${fmtDate(stream.date)}</span>
          <span class="pl-stream-title">${escapeHtml(stream.title || '配信')}</span>
          <span class="pl-stream-meta">第${stream.index}枠 · ${stream.songs?.length ?? 0}曲</span>
        </div>
        <div class="pl-stream-actions">
          ${stream.url
            ? `<button class="pl-play-stream-btn" data-pl-play-stream="${escapeHtml(skey)}"
                type="button" title="再生">${icon('play')}</button>`
            : ''}
          ${rmBtn}
        </div>
      </div>`;
  }).join('');

  const videoIds = _playlistVideoIds(pl, allStreams);

  return `
    <div class="pl-card">
      <div class="pl-card-head">
        ${coverThumbs ? `<div class="pl-card-cover-wrap">${coverThumbs}</div>` : ''}
        <div class="pl-card-head-info">
          <button class="pl-card-name" data-pl-rename="${escapeHtml(pl.id)}"
            type="button" title="クリックで名前変更">${escapeHtml(pl.name)}</button>
          <span class="pl-card-count">${pl.streams.length}件</span>
        </div>
        <button class="pl-del-btn" data-pl-del="${escapeHtml(pl.id)}"
          type="button" title="プレイリストを削除">${icon('trash')}</button>
      </div>
      <div class="pl-stream-list">
        ${items || '<div class="pl-stream-empty">配信が追加されていません</div>'}
      </div>
      ${(videoIds.length || pl.streams.length) ? `
      <div class="pl-card-footer">
        ${videoIds.length ? `
        <button class="pl-yt-share-btn" data-pl-yt-share="${escapeHtml(pl.id)}"
          type="button" title="YouTubeで連続再生（一時的なプレイリストとして開きます）">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M23.5 6.2a3 3 0 0 0-2.1-2.1C19.5 3.6 12 3.6 12 3.6s-7.5 0-9.4.5A3 3 0 0 0 .5 6.2C0 8.1 0 12 0 12s0 3.9.5 5.8a3 3 0 0 0 2.1 2.1c1.9.5 9.4.5 9.4.5s7.5 0 9.4-.5a3 3 0 0 0 2.1-2.1C24 15.9 24 12 24 12s0-3.9-.5-5.8ZM9.6 15.6V8.4l6.3 3.6-6.3 3.6Z"/></svg>
          YouTubeで連続再生 (${videoIds.length}本)
        </button>` : ''}
        ${pl.streams.length ? `
        <button class="pl-yt-share-btn" data-pl-share="${escapeHtml(pl.id)}"
          type="button" title="このプレイリストの共有リンクをコピー">${icon('link')} リンクを共有</button>` : ''}
      </div>` : ''}
    </div>`;
}

function _handleMyPlaylistsClick(e, allStreams) {
  // 新規作成
  if (e.target.closest('#pl-new-btn')) {
    _promptCreate();
    return;
  }
  // プレイリスト共有リンクをコピー
  const shareBtn = e.target.closest('[data-pl-share]');
  if (shareBtn) {
    const pl = getPlaylists().find(p => p.id === shareBtn.dataset.plShare);
    if (!pl) return;
    const payload = JSON.stringify({ n: pl.name, s: pl.streams });
    const b64 = btoa(String.fromCharCode(...new TextEncoder().encode(payload)))
      .replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
    const url = `${location.origin}${location.pathname}?pl=${b64}`;
    const done = (ok) => {
      shareBtn.innerHTML = ok ? `${icon('check')} コピーしました` : 'コピーできません';
      setTimeout(() => { shareBtn.innerHTML = `${icon('link')} リンクを共有`; }, 1600);
    };
    navigator.clipboard?.writeText(url).then(() => done(true)).catch(() => {
      try {
        const ta = document.createElement('textarea');
        ta.value = url;
        ta.style.cssText = 'position:fixed;opacity:0;';
        document.body.appendChild(ta);
        ta.select();
        const ok = document.execCommand('copy');
        ta.remove();
        done(ok);
      } catch (_) { done(false); }
    });
    return;
  }
  // プレイリスト削除
  const delBtn = e.target.closest('[data-pl-del]');
  if (delBtn) {
    const id = delBtn.dataset.plDel;
    const pl = getPlaylists().find(p => p.id === id);
    if (pl && confirm(`「${pl.name}」を削除しますか？`)) {
      deletePlaylist(id);
      renderPlaylists();
    }
    return;
  }
  // 配信削除
  const rmBtn = e.target.closest('[data-pl-rm-stream]');
  if (rmBtn) {
    const [plId, skey] = rmBtn.dataset.plRmStream.split('|:|');
    removeStreamFromPlaylist(plId, skey);
    renderPlaylists();
    return;
  }
  // 再生（プレイリスト内の配信）
  const playBtn = e.target.closest('[data-pl-play-stream]');
  if (playBtn) {
    const row = playBtn.closest('.pl-stream-row');
    if (row && _playMyListFromRow(row, allStreams)) return;
    const skey = playBtn.dataset.plPlayStream;
    const found = allStreams.find(s => streamKey(s) === skey);
    if (found?.url) window.__openStreamViewer?.(found);
    return;
  }
  // 再生（プレイリスト内の音楽動画）
  const playMvBtn = e.target.closest('[data-play-music-pl]');
  if (playMvBtn) {
    const row = playMvBtn.closest('.pl-stream-row');
    if (row && _playMyListFromRow(row, allStreams)) return;
    if (_musicVideos?.length) {
      const idx = Number(playMvBtn.dataset.playMusicPl);
      import('../music-player.js').then(m => m.playMusicQueue(_musicVideos, idx));
    }
    return;
  }
  // プレイリスト名変更
  const nameEl = e.target.closest('[data-pl-rename]');
  if (nameEl) {
    const id = nameEl.dataset.plRename;
    const pl = getPlaylists().find(p => p.id === id);
    if (!pl) return;
    const newName = prompt('プレイリスト名', pl.name)?.trim();
    if (newName) {
      const lists = getPlaylists();
      const target = lists.find(p => p.id === id);
      if (target) { target.name = newName; savePlaylists(lists); renderPlaylists(); }
    }
    return;
  }

  // YouTubeで連続再生
  const ytShareBtn = e.target.closest('[data-pl-yt-share]');
  if (ytShareBtn) {
    const plId = ytShareBtn.dataset.plYtShare;
    const pl = getPlaylists().find(p => p.id === plId);
    if (!pl) return;
    _openYouTubePlaylist(_playlistVideoIds(pl, allStreams));
    return;
  }
}

function _promptCreate() {
  const name = prompt('プレイリスト名を入力してください')?.trim();
  if (!name) return;
  createPlaylist(name);
  renderPlaylists();
}

/* ── プレイリスト追加モーダル ──────────────────────────────────────────── */

const PL_BOOKMARK_SVG = '<svg viewBox="0 0 24 24" width="20" height="20" aria-hidden="true"><path d="M6 4h12a1 1 0 0 1 1 1v15l-7-4-7 4V5a1 1 0 0 1 1-1z"/></svg>';

/** プレイリストの先頭動画のサムネ URL（カバー用）。なければ空文字 */
function _playlistCoverUrl(pl) {
  const allStreams = state.data?.streams || [];
  for (const k of (pl.streams || [])) {
    if (k.startsWith('mv:')) { const mv = resolveMusicVideoId(k); if (mv?.url) return mv.url; }
    else { const s = allStreams.find(st => streamKey(st) === k); if (s?.url) return s.url; }
  }
  return '';
}

/** プレイリスト追加モーダル */
export function showAddToPlaylistModal(skeyOrArray, streamTitle, opts = {}) {
  const keys = Array.isArray(skeyOrArray) ? skeyOrArray.filter(Boolean) : [skeyOrArray].filter(Boolean);
  if (!keys.length) return;
  const isBulk = keys.length > 1;
  const notifyChange = () => {
    try { opts.onChange?.(keys.some(k => isStreamInAnyPlaylist(k))); } catch (_) {}
  };

  let modal = $('#pl-add-modal');
  if (!modal) {
    modal = document.createElement('div');
    modal.id = 'pl-add-modal';
    modal.setAttribute('role', 'dialog');
    modal.setAttribute('aria-modal', 'true');
    document.body.appendChild(modal);
  }

  const isSaved = (pl) => keys.every(k => (pl.streams || []).includes(k));

  const itemHtml = (pl) => {
    const saved = isSaved(pl);
    const coverUrl = _playlistCoverUrl(pl);
    const thumb = coverUrl ? youtubeThumb(coverUrl) : '';
    return `
      <button class="pl-modal-item${saved ? ' is-saved' : ''}" data-pl-add="${escapeHtml(pl.id)}"
        type="button" role="checkbox" aria-checked="${saved}">
        <span class="pl-modal-item-cover">
          ${thumb
            ? `<img src="${escapeHtml(thumb)}" alt="" loading="lazy" referrerpolicy="no-referrer">`
            : `<span class="pl-modal-item-cover--empty">${icon('music')}</span>`}
        </span>
        <span class="pl-modal-item-info">
          <span class="pl-modal-item-name">${escapeHtml(pl.name)}</span>
          <span class="pl-modal-item-count">${pl.streams.length}曲</span>
        </span>
        <span class="pl-modal-bookmark${saved ? ' is-saved' : ''}" aria-hidden="true">${PL_BOOKMARK_SVG}</span>
      </button>`;
  };

  const listHtmlAll = () => {
    const currentLists = getPlaylists();
    if (!currentLists.length) {
      return '<p class="pl-modal-empty">プレイリストがありません<br><span style="font-size:11px">下の「新しいプレイリストを作成」から追加できます</span></p>';
    }
    return currentLists.map(itemHtml).join('');
  };

  const subText = isBulk ? `${keys.length}曲をまとめて保存` : (streamTitle || '配信');

  const _build = () => {
    modal.innerHTML = `
      <div class="pl-modal-backdrop" id="pl-modal-backdrop"></div>
      <div class="pl-modal-box" role="dialog" aria-modal="true" aria-label="プレイリストに保存">
        <div class="pl-modal-head">
          <span class="pl-modal-head-title">保存先</span>
          <button class="pl-modal-close" id="pl-modal-close" type="button" aria-label="閉じる">${icon('close')}</button>
        </div>
        <div class="pl-modal-sub">${escapeHtml(subText)}</div>
        <div class="pl-modal-list" id="pl-modal-list">${listHtmlAll()}</div>
        <button class="pl-modal-new" id="pl-modal-new" type="button">
          <span class="pl-modal-new-icon">${icon('plus')}</span> 新しいプレイリストを作成
        </button>
      </div>`;
    modal.hidden = false;

    modal.querySelector('#pl-modal-close').addEventListener('click', close);
    modal.querySelector('#pl-modal-backdrop').addEventListener('click', close);

    modal.querySelector('#pl-modal-new').addEventListener('click', () => {
      const name = prompt('プレイリスト名')?.trim();
      if (!name) return;
      const pl = createPlaylist(name);
      keys.forEach(k => addStreamToPlaylist(pl.id, k));
      _showToast(isBulk ? `「${name}」に${keys.length}曲保存しました` : `「${name}」に保存しました`);
      const listEl = modal.querySelector('#pl-modal-list');
      const empty = listEl?.querySelector('.pl-modal-empty');
      if (empty) listEl.innerHTML = '';
      if (listEl) listEl.insertAdjacentHTML('afterbegin', itemHtml(getPlaylists().find(p => p.id === pl.id)));
      notifyChange();
    });

    modal.querySelector('#pl-modal-list').addEventListener('click', (e) => {
      const btn = e.target.closest('[data-pl-add]');
      if (!btn) return;
      const plId = btn.dataset.plAdd;
      const lists = getPlaylists();
      const pl = lists.find(p => p.id === plId);
      if (!pl) return;
      if (!Array.isArray(pl.streams)) pl.streams = [];
      if (isSaved(pl)) {
        keys.forEach(k => { pl.streams = pl.streams.filter(s => s !== k); });
        savePlaylists(lists);
        _showToast(isBulk ? `${keys.length}曲を削除しました` : '削除しました');
      } else {
        keys.forEach(k => { if (!pl.streams.includes(k)) pl.streams.push(k); });
        savePlaylists(lists);
        _showToast(isBulk ? `「${pl.name}」に${keys.length}曲保存しました` : `「${pl.name}」に保存しました`);
      }
      btn.outerHTML = itemHtml(getPlaylists().find(p => p.id === plId));
      notifyChange();
    });
  };

  const close = () => { modal.hidden = true; };
  _build();

  document.addEventListener('keydown', function onEsc(e) {
    if (e.key === 'Escape') { close(); document.removeEventListener('keydown', onEsc); }
  });
}

function _showToast(msg) {
  let toast = $('#pl-toast');
  if (!toast) {
    toast = document.createElement('div');
    toast.id = 'pl-toast';
    document.body.appendChild(toast);
  }
  toast.textContent = msg;
  toast.classList.add('pl-toast--show');
  clearTimeout(toast._timer);
  toast._timer = setTimeout(() => toast.classList.remove('pl-toast--show'), 2500);
}

/* ── ドラッグ並び替え ────────────────────────────────────────────────────── */

/** マイリストの行 ▶ から、リスト全体をビューワーのキューとして再生する。 */
function _playMyListFromRow(row, allStreams) {
  const pl = getPlaylists().find(p => p.id === row.dataset.plId);
  if (!pl || !window.__playMyListInViewer) return false;
  const items = [];
  for (const k of pl.streams) {
    if (k.startsWith('mv:')) {
      const mv = resolveMusicVideoId(k);
      if (mv?.url) items.push({ kind: 'mv', key: k, video: mv });
    } else {
      const s = allStreams.find(st => streamKey(st) === k);
      if (s?.url) items.push({ kind: 'stream', key: k, stream: s });
    }
  }
  if (!items.length) return false;
  let idx = items.findIndex(it => it.key === row.dataset.plSkey);
  if (idx < 0) idx = 0;
  window.__playMyListInViewer({ name: pl.name || 'マイリスト', items, idx });
  return true;
}

function _initDragSort() {
  if (_activeSubTab !== 'my-playlists') return;
  const panel = $('#panel-playlists');
  if (!panel) return;
  panel.querySelectorAll('.pl-stream-list').forEach(list => {
    list.addEventListener('pointerdown', _onDragStart, { passive: false });
  });
}

let _dragState = null;

function _onDragStart(e) {
  if (_dragState) return;
  const handle = e.target.closest('.pl-drag-handle');
  if (!handle) return;
  const row = handle.closest('.pl-stream-row');
  const list = handle.closest('.pl-stream-list');
  if (!row || !list) return;

  e.preventDefault();

  const rows = Array.from(list.querySelectorAll('.pl-stream-row'));
  const startIdx = rows.indexOf(row);
  if (startIdx < 0) return;

  const mids = rows.map(r => {
    const rc = r.getBoundingClientRect();
    return rc.top + rc.height / 2;
  });
  const rowRect = row.getBoundingClientRect();

  _dragState = {
    list, row, rows, mids, startIdx,
    targetIdx: startIdx,
    startY: e.clientY,
    rowH: rowRect.height + (parseFloat(getComputedStyle(list).rowGap || getComputedStyle(list).gap) || 0),
    plId: row.dataset.plId,
    moved: false,
  };

  row.classList.add('is-dragging');
  list.classList.add('is-drag-active');
  try { row.setPointerCapture(e.pointerId); } catch (_) {}

  row.addEventListener('pointermove', _onDragMove, { passive: false });
  row.addEventListener('pointerup', _onDragEnd);
  row.addEventListener('pointercancel', _onDragCancel);
}

function _onDragMove(e) {
  const st = _dragState;
  if (!st) return;
  e.preventDefault();

  const dy = e.clientY - st.startY;
  if (!st.moved && Math.abs(dy) < 3) return;
  st.moved = true;
  st.row.style.transform = `translateY(${dy}px)`;

  const centerY = st.mids[st.startIdx] + dy;
  let target = 0;
  for (let i = 0; i < st.mids.length; i++) {
    if (i === st.startIdx) continue;
    if (centerY > st.mids[i]) target++;
  }

  if (target !== st.targetIdx) {
    st.targetIdx = target;
    st.rows.forEach((r, i) => {
      if (i === st.startIdx) return;
      let shift = 0;
      if (st.startIdx < target && i > st.startIdx && i <= target) shift = -st.rowH;
      else if (st.startIdx > target && i >= target && i < st.startIdx) shift = st.rowH;
      r.style.transform = shift ? `translateY(${shift}px)` : '';
    });
  }
}

function _onDragEnd() {
  const st = _dragState;
  if (!st) return;
  const { plId, startIdx, targetIdx, moved } = st;
  _cleanupDrag();
  if (!moved || targetIdx === startIdx) return;

  const lists = getPlaylists();
  const pl = lists.find(p => p.id === plId);
  if (pl && startIdx < pl.streams.length) {
    const arr = pl.streams.slice();
    const [item] = arr.splice(startIdx, 1);
    arr.splice(targetIdx, 0, item);
    pl.streams = arr;
    savePlaylists(lists);
  }
  renderPlaylists();
}

function _onDragCancel() {
  _cleanupDrag();
}

function _cleanupDrag() {
  const st = _dragState;
  if (!st) return;
  st.rows.forEach(r => { r.style.transform = ''; });
  st.row.classList.remove('is-dragging');
  st.list.classList.remove('is-drag-active');
  st.row.removeEventListener('pointermove', _onDragMove);
  st.row.removeEventListener('pointerup', _onDragEnd);
  st.row.removeEventListener('pointercancel', _onDragCancel);
  _dragState = null;
}
