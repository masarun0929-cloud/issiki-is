import { initTheme } from './theme.js';
import { $, fmtDate, formatNumber } from './utils.js';
import { loadAll } from './data.js';
import { CHANNELS, DEFAULT_CHANNEL } from './config.js';
import { state } from './store.js';
import { collectDatasetIssues } from './domain-compat.js';

initTheme();

const adminToken = $('#admin-token');
if (adminToken) {
  adminToken.value = localStorage.getItem('adminToken') || '';
  adminToken.addEventListener('input', () => localStorage.setItem('adminToken', adminToken.value));
}

function parseDate(value) {
  if (!value) return null;
  const text = String(value).replaceAll('/', '-');
  const m = text.match(/^(\d{4})-(\d{1,2})-(\d{1,2})/);
  if (!m) return null;
  const date = new Date(+m[1], +m[2] - 1, +m[3]);
  date.setHours(0, 0, 0, 0);
  return date;
}

function setBadge(ok, text) {
  const badge = $('#api-badge');
  badge.textContent = text;
  badge.classList.toggle('accent', ok);
}

function stat(label, value, unit = '') {
  return `
    <div class="stat-card">
      <div class="stat-label">${label}</div>
      <div class="stat-value">${value}<span class="stat-unit">${unit}</span></div>
    </div>
  `;
}

function statusRow(label, value, tone = '') {
  return `<div class="admin-status-row ${tone}"><span>${label}</span><strong>${value}</strong></div>`;
}


function escapeHtml(value) {
  return String(value ?? '').replace(/[&<>"']/g, (ch) => ({
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
  }[ch]));
}

async function adminApi(path, body) {
  const res = await fetch(`/api/admin/${path}`, {
    method: body ? 'POST' : 'GET',
    headers: {
      'content-type': 'application/json',
      'x-admin-token': adminToken?.value || '',
    },
    body: body ? JSON.stringify(body) : undefined,
  });
  const data = await res.json();
  if (!res.ok) throw new Error(data.error || 'Request failed');
  return data;
}

function streamFormData() {
  return {
    channelCode: $('#channel').value,
    streamedOn: $('#streamed-on').value,
    sourceIndex: $('#source-index').value,
    title: $('#stream-title').value,
    url: $('#stream-url').value,
    songsText: $('#songs-text').value,
  };
}

function renderPreview(rows) {
  $('#preview-box').innerHTML = `
    <div class="admin-table-wrap">
      <table class="admin-table">
        <thead><tr><th>#</th><th>曲</th><th>歌手</th><th>キー</th><th>ジャンル</th><th>判定</th></tr></thead>
        <tbody>
          ${rows.map((row) => `
            <tr>
              <td>${row.position}</td>
              <td>${escapeHtml(row.title)}</td>
              <td>${escapeHtml(row.artist || '')}</td>
              <td>${escapeHtml(row.displayKey || '')}</td>
              <td>${escapeHtml(row.genre || '')}</td>
              <td>${escapeHtml(row.match)}</td>
            </tr>
          `).join('')}
        </tbody>
      </table>
    </div>
  `;
}

function renderSongMeta(rows) {
  $('#song-meta-box').innerHTML = `
    <div class="admin-table-wrap">
      <table class="admin-table">
        <thead><tr><th>曲</th><th>歌手</th><th>キー</th><th>ジャンル</th><th></th></tr></thead>
        <tbody>
          ${rows.map((row) => `
            <tr data-song-id="${row.id}">
              <td><input class="admin-compact-input" data-field="title" value="${escapeHtml(row.title || '')}"></td>
              <td><input class="admin-compact-input" data-field="artist" value="${escapeHtml(row.artist || '')}"></td>
              <td><input class="admin-compact-input" data-field="displayKey" value="${escapeHtml(row.display_key || '')}"></td>
              <td><input class="admin-compact-input" data-field="genre" value="${escapeHtml(row.genre || '')}"></td>
              <td><button class="btn ghost" type="button" data-save-meta>保存</button></td>
            </tr>
          `).join('')}
        </tbody>
      </table>
    </div>
  `;
}

function renderSync(data, elapsed) {
  const stats = data.combined?.stats || {};
  const update = parseDate(stats.updateDate);
  const now = new Date();
  const ageDays = update ? Math.floor((now - update) / 86400000) : null;
  const newestStream = parseDate(stats.newestStream || stats.updateDate);
  const rows = [
    statusRow('API応答', `${formatNumber(elapsed)}ms`, elapsed < 3000 ? 'ok' : 'warn'),
    statusRow('スプシ更新日', fmtDate(update), ageDays != null && ageDays <= 3 ? 'ok' : 'warn'),
    statusRow('更新から', ageDays == null ? '—' : `${ageDays}日`, ageDays != null && ageDays <= 3 ? 'ok' : 'warn'),
    statusRow('最新歌枠日', fmtDate(newestStream), 'ok'),
  ];
  $('#sync-status').innerHTML = rows.join('');
  const ok = elapsed < 3000 && (ageDays == null || ageDays <= 3);
  $('#sync-badge').textContent = ok ? '良好' : '要確認';
  $('#sync-badge').classList.toggle('accent', ok);
}

function renderQuality(data) {
  const issues = collectDatasetIssues(data);
  const severe = issues.filter(issue => ['履歴未確認', '曲数不一致'].includes(issue.type)).length;
  const summary = new Map();
  for (const issue of issues) summary.set(issue.type, (summary.get(issue.type) || 0) + 1);
  $('#quality-summary').innerHTML = [
    statusRow('履歴未確認', formatNumber(summary.get('履歴未確認') || 0), (summary.get('履歴未確認') || 0) ? 'warn' : 'ok'),
    statusRow('曲数不一致', formatNumber(summary.get('曲数不一致') || 0), (summary.get('曲数不一致') || 0) ? 'warn' : 'ok'),
    statusRow('ジャンル未分類', formatNumber(summary.get('ジャンル未分類') || 0), (summary.get('ジャンル未分類') || 0) ? 'warn' : 'ok'),
    statusRow('同一枠内重複', formatNumber(summary.get('同一枠内重複') || 0), 'ok'),
  ].join('');
  $('#quality-badge').textContent = severe ? '要確認' : '良好';
  $('#quality-badge').classList.toggle('accent', !severe);
  $('#issue-count').textContent = `${issues.length}件`;
  $('#quality-rows').innerHTML = issues.slice(0, 100).map(issue => `
    <tr>
      <td>${issue.type}</td>
      <td>${issue.place}</td>
      <td>${issue.detail}</td>
    </tr>
  `).join('') || '<tr><td colspan="3">大きな問題は見つかりませんでした</td></tr>';
}

function loadChannels() {
  const channelSelect = $('#channel');
  const channels = Object.values(CHANNELS);
  channelSelect.innerHTML = channels.map((channel) => (
    `<option value="${escapeHtml(channel.id)}">${escapeHtml(channel.label)}</option>`
  )).join('');
  channelSelect.value = CHANNELS[DEFAULT_CHANNEL] ? DEFAULT_CHANNEL : channels[0]?.id || '';
}

async function loadStatus() {
  setBadge(false, '確認中');
  $('#api-detail').textContent = '公開用の静的データを読み込んでいます。';
  $('#channel-rows').innerHTML = '<tr><td colspan="5">読み込み中</td></tr>';
  $('#sync-status').innerHTML = '<div class="admin-note">確認中</div>';
  $('#quality-summary').innerHTML = '<div class="admin-note">確認中</div>';
  $('#quality-rows').innerHTML = '<tr><td colspan="3">読み込み中</td></tr>';

  const started = performance.now();
  try {
    const data = await loadAll();
    const elapsed = Math.round(performance.now() - started);
    const combined = data.combined || {};
    const stats = combined.stats || {};

    setBadge(true, '正常');
    $('#api-stats').innerHTML = [
      stat('曲数', formatNumber(stats.repertoire), '曲'),
      stat('歌枠', formatNumber(stats.streams), '枠'),
      stat('応答', formatNumber(elapsed), 'ms'),
    ].join('');
    $('#api-detail').textContent = `最新データ: ${fmtDate(parseDate(stats.updateDate))} / 公開サイトと同じ静的JSONを確認しています。`;
    renderSync(data, elapsed);
    renderQuality(data);

    const channels = Object.values(data.channels || {});
    $('#channel-rows').innerHTML = channels.map((channel) => {
      const s = channel.stats || {};
      return `
        <tr>
          <td>${s.channelLabel || s.channelId || '-'}</td>
          <td>${formatNumber(s.repertoire)}</td>
          <td>${formatNumber(s.streams)}</td>
          <td>${formatNumber(s.total)}</td>
          <td>${fmtDate(parseDate(s.updateDate))}</td>
        </tr>
      `;
    }).join('') || '<tr><td colspan="5">チャンネルデータがありません</td></tr>';
  } catch (error) {
    setBadge(false, 'エラー');
    $('#api-stats').innerHTML = [
      stat('曲数', '-'),
      stat('歌枠', '-'),
      stat('応答', '-'),
    ].join('');
    $('#api-detail').textContent = `API確認に失敗しました: ${error.message || String(error)}`;
    $('#channel-rows').innerHTML = '<tr><td colspan="5">取得できませんでした</td></tr>';
    $('#sync-status').innerHTML = '<div class="admin-note">取得できませんでした</div>';
    $('#quality-summary').innerHTML = '<div class="admin-note">取得できませんでした</div>';
    $('#quality-rows').innerHTML = '<tr><td colspan="3">取得できませんでした</td></tr>';
  }
}

function initManagement() {
  const streamedOn = $('#streamed-on');
  if (streamedOn && !streamedOn.value) streamedOn.valueAsDate = new Date();
  loadChannels();

  $('#preview-stream')?.addEventListener('click', async () => {
    $('#stream-status').textContent = 'プレビュー中...';
    try {
      const data = await adminApi('preview-stream', streamFormData());
      renderPreview(data.songs);
      $('#stream-status').textContent = `${data.songs.length}曲を確認しました。`;
    } catch (error) {
      $('#stream-status').textContent = error.message || String(error);
    }
  });

  $('#submit-stream')?.addEventListener('click', async () => {
    if (!confirm('この歌枠をD1に登録します。よろしいですか？')) return;
    $('#stream-status').textContent = '登録中...';
    try {
      const data = await adminApi('streams', streamFormData());
      $('#stream-status').textContent = `登録しました: stream_id=${data.streamId}, ${data.songCount}曲。必要なら静的データ生成を開始してください。`;
      $('#preview-box').innerHTML = '';
      loadStatus();
    } catch (error) {
      $('#stream-status').textContent = error.message || String(error);
    }
  });

  $('#search-songs')?.addEventListener('click', async () => {
    $('#meta-status').textContent = '検索中...';
    try {
      const data = await adminApi(`songs/search?q=${encodeURIComponent($('#song-query').value)}`);
      renderSongMeta(data.songs);
      $('#meta-status').textContent = `${data.songs.length}件`;
    } catch (error) {
      $('#meta-status').textContent = error.message || String(error);
    }
  });

  $('#song-meta-box')?.addEventListener('click', async (event) => {
    const button = event.target.closest('[data-save-meta]');
    if (!button) return;
    const row = button.closest('[data-song-id]');
    $('#meta-status').textContent = '保存中...';
    try {
      await adminApi('songs/metadata', {
        songId: row.dataset.songId,
        title: row.querySelector('[data-field="title"]').value,
        artist: row.querySelector('[data-field="artist"]').value,
        displayKey: row.querySelector('[data-field="displayKey"]').value,
        genre: row.querySelector('[data-field="genre"]').value,
      });
      $('#meta-status').textContent = '保存しました。必要なら静的データ生成を開始してください。';
    } catch (error) {
      $('#meta-status').textContent = error.message || String(error);
    }
  });

  $('#sync-keys')?.addEventListener('click', async () => {
    if (!confirm('SpreadsheetからD1のキー/ジャンルを同期します。よろしいですか？')) return;
    $('#meta-status').textContent = '同期中...';
    try {
      const data = await adminApi('key-reference/sync-url', { url: $('#key-sheet-url').value });
      $('#meta-status').textContent = `同期しました: updated=${data.updated}, skipped=${data.skipped}\ncolumns=${JSON.stringify(data.detectedColumns)}`;
    } catch (error) {
      $('#meta-status').textContent = error.message || String(error);
    }
  });

  $('#sync-key-csv')?.addEventListener('click', async () => {
    const file = $('#key-csv-file').files[0];
    if (!file) {
      $('#meta-status').textContent = 'CSVファイルを選んでください';
      return;
    }
    if (!confirm('CSVからD1のキー/ジャンルを同期します。よろしいですか？')) return;
    $('#meta-status').textContent = 'CSV同期中...';
    try {
      const data = await adminApi('key-reference/import-csv', { csvText: await file.text() });
      $('#meta-status').textContent = `同期しました: updated=${data.updated}, skipped=${data.skipped}\ncolumns=${JSON.stringify(data.detectedColumns)}`;
    } catch (error) {
      $('#meta-status').textContent = error.message || String(error);
    }
  });

  $('#generate-static-data')?.addEventListener('click', async () => {
    if (!confirm('GitHub Actionsで静的データ生成を開始します。よろしいですか？')) return;
    $('#static-status').textContent = 'GitHub Actionsを起動中...';
    try {
      const data = await adminApi('static-data/generate', {});
      $('#static-status').textContent = `起動しました: ${data.owner}/${data.repo} / ${data.workflow}\nGitHub Actions完了後、Pagesへ自動反映されます。`;
    } catch (error) {
      $('#static-status').textContent = error.message || String(error);
    }
  });
}

/* ── コミュニティタイムスタンプ審査 ──────────────────────────────────────── */

let _tsFilter  = 'pending';
let _tsData    = null; // loadAll() の結果キャッシュ（配信・曲名参照用）
let _tsItems   = [];
let _tsBusy    = false;

function fmtSeconds(s) {
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  if (h > 0) return `${h}:${String(m).padStart(2, '0')}:${String(sec).padStart(2, '0')}`;
  return `${m}:${String(sec).padStart(2, '0')}`;
}

function resolveTs(item) {
  const ch     = _tsData?.channels?.[item.channelCode];
  const stream = ch?.streams?.find(s => Number(s.index) === Number(item.streamIndex));
  const song   = stream?.songs?.[item.songIndex];
  return {
    streamTitle: stream?.title || `第${item.streamIndex}枠`,
    songTitle:   song ? `${song.title} / ${song.artist || ''}` : `曲${item.songIndex + 1}`,
    date:        stream?.date || '',
  };
}

function renderTimestamps(items) {
  const wrap = $('#ts-table-wrap');
  _tsItems = Array.isArray(items) ? items : [];
  $('#ts-count').textContent = `${items.length}件`;
  const approveAllBtn = $('#ts-approve-all');
  if (approveAllBtn) {
    approveAllBtn.hidden = _tsFilter !== 'pending';
    approveAllBtn.disabled = _tsBusy || _tsFilter !== 'pending' || !_tsItems.length;
    approveAllBtn.textContent = _tsItems.length ? `表示中${_tsItems.length}件を一括承認` : '表示中を一括承認';
  }
  if (!items.length) {
    wrap.innerHTML = '<p class="admin-note">該当する申請はありません</p>';
    return;
  }
  wrap.innerHTML = `
    <table class="admin-table">
      <thead>
        <tr>
          <th>ch</th><th>配信</th><th>曲</th><th>時間</th><th>コメント</th><th>申請日</th>
          ${_tsFilter === 'pending' ? '<th>操作</th>' : '<th>審査日</th>'}
        </tr>
      </thead>
      <tbody>
        ${items.map(item => {
          const { streamTitle, songTitle, date } = resolveTs(item);
          const chLabel = item.channelCode === 'new' ? '歌った曲リスト' : '別ch';
          const createdAt  = item.createdAt  ? fmtDate(new Date(item.createdAt))  : '—';
          const reviewedAt = item.reviewedAt ? fmtDate(new Date(item.reviewedAt)) : '—';
          const actionCell = _tsFilter === 'pending'
            ? `<td>
                <button class="btn ghost" data-ts-approve="${item.id}" type="button" style="margin-right:4px">承認</button>
                <button class="btn ghost" data-ts-reject="${item.id}"  type="button">却下</button>
               </td>`
            : `<td>${reviewedAt}</td>`;
          return `
            <tr>
              <td>${chLabel}</td>
              <td title="${escapeHtml(streamTitle)}">${escapeHtml(streamTitle.length > 20 ? streamTitle.slice(0, 20) + '…' : streamTitle)}<br><small>${escapeHtml(date)}</small></td>
              <td>${escapeHtml(songTitle)}</td>
              <td><strong>${fmtSeconds(item.timeSeconds)}</strong></td>
              <td>${escapeHtml(item.submitterNote || '—')}</td>
              <td>${createdAt}</td>
              ${actionCell}
            </tr>`;
        }).join('')}
      </tbody>
    </table>`;
}

async function loadTimestamps() {
  $('#ts-status').textContent = '読み込み中…';
  $('#ts-table-wrap').innerHTML = '<p class="admin-note">読み込み中…</p>';
  const approveAllBtn = $('#ts-approve-all');
  if (approveAllBtn) approveAllBtn.disabled = true;
  try {
    const data = await adminApi(`timestamps?status=${_tsFilter}&limit=100`);
    $('#ts-status').textContent = '';
    renderTimestamps(data.items || []);
  } catch (err) {
    $('#ts-status').textContent = `エラー: ${err.message || err}`;
    $('#ts-table-wrap').innerHTML = '';
  }
}

async function initTimestamps() {
  // 配信・曲名参照用にデータをキャッシュ
  try { _tsData = await loadAll(); } catch (_) {}

  document.querySelectorAll('.ts-filter-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      if (_tsBusy) return;
      document.querySelectorAll('.ts-filter-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      _tsFilter = btn.dataset.tsFilter;
      loadTimestamps();
    });
  });

  $('#ts-approve-all')?.addEventListener('click', async () => {
    const pending = _tsFilter === 'pending' ? _tsItems.slice() : [];
    if (!pending.length || _tsBusy) return;
    if (!confirm(`表示中の${pending.length}件をすべて承認しますか？`)) return;

    _tsBusy = true;
    const approveAllBtn = $('#ts-approve-all');
    const rowButtons = $('#ts-table-wrap')?.querySelectorAll('button');
    if (approveAllBtn) {
      approveAllBtn.disabled = true;
      approveAllBtn.textContent = '一括承認中…';
    }
    rowButtons?.forEach(btn => { btn.disabled = true; });

    let succeeded = 0;
    const failed = [];
    for (let i = 0; i < pending.length; i++) {
      const item = pending[i];
      $('#ts-status').textContent = `一括承認中… ${i + 1}/${pending.length}`;
      try {
        await adminApi(`timestamps/${item.id}/approve`, {});
        succeeded++;
      } catch (err) {
        failed.push({ item, error: err });
      }
    }

    _tsBusy = false;
    if (failed.length) {
      $('#ts-status').textContent = `${succeeded}件を承認しました。${failed.length}件は失敗しました。`;
    } else {
      $('#ts-status').textContent = `${succeeded}件を一括承認しました`;
    }
    loadTimestamps();
  });

  $('#ts-table-wrap').addEventListener('click', async (e) => {
    if (_tsBusy) return;
    const approveBtn = e.target.closest('[data-ts-approve]');
    const rejectBtn  = e.target.closest('[data-ts-reject]');
    if (!approveBtn && !rejectBtn) return;

    const id     = approveBtn ? approveBtn.dataset.tsApprove : rejectBtn.dataset.tsReject;
    const action = approveBtn ? 'approve' : 'reject';
    const label  = approveBtn ? '承認' : '却下';

    if (!confirm(`この申請を${label}しますか？`)) return;
    $('#ts-status').textContent = `${label}中…`;
    try {
      await adminApi(`timestamps/${id}/${action}`, {});
      $('#ts-status').textContent = `${label}しました`;
      loadTimestamps();
    } catch (err) {
      $('#ts-status').textContent = `エラー: ${err.message || err}`;
    }
  });

  loadTimestamps();
}

/* ─── 音楽動画管理 ───────────────────────────────────────────────────────── */

let _mvVideos = [];

function _youtubeThumb(url) {
  try {
    const id = new URL(url).searchParams.get('v') || new URL(url).pathname.split('/').pop();
    return id ? `https://i.ytimg.com/vi/${id}/mqdefault.jpg` : '';
  } catch (_) { return ''; }
}

function _renderMvList() {
  const wrap = $('#mv-list-wrap');
  const badge = $('#mv-count');
  if (!wrap) return;
  if (badge) badge.textContent = _mvVideos.length;
  if (!_mvVideos.length) {
    wrap.innerHTML = '<p class="admin-note">動画が登録されていません</p>';
    return;
  }
  wrap.innerHTML = `
    <div class="admin-table-wrap">
      <table class="admin-table">
        <thead><tr><th>ID</th><th>サムネ</th><th>タイトル</th><th>種別</th><th>追加情報</th><th>公開日</th><th></th></tr></thead>
        <tbody>
          ${_mvVideos.map((v, i) => {
            const typeLabel = { original: 'オリ曲', office: 'Re:AcT', character: 'キャラ', cover: 'カバー' }[v.type] || v.type;
            const extra = v.type === 'cover' ? (v.originalArtist || '—') : v.type === 'character' ? (v.character || '—') : '—';
            return `
            <tr>
              <td style="font-size:11px;color:var(--ink-mute)">${v.id}</td>
              <td>${v.url ? `<img src="${_youtubeThumb(v.url)}" width="80" alt="" referrerpolicy="no-referrer" style="border-radius:4px">` : '—'}</td>
              <td>${v.title || '—'}</td>
              <td>${typeLabel}</td>
              <td style="font-size:12px">${extra}</td>
              <td>${v.publishedAt || '—'}</td>
              <td><button class="btn ghost" data-mv-del="${i}" type="button" style="padding:4px 10px;font-size:12px">削除</button></td>
            </tr>`;
          }).join('')}
        </tbody>
      </table>
    </div>`;

  wrap.querySelectorAll('[data-mv-del]').forEach(btn => {
    btn.addEventListener('click', () => {
      const idx = Number(btn.dataset.mvDel);
      if (!confirm(`「${_mvVideos[idx]?.title}」を削除しますか？`)) return;
      _mvVideos.splice(idx, 1);
      _saveMvData();
    });
  });
}

function _saveMvData() {
  // サーバーサイドAPIなし: JSONをダウンロードしてリポジトリにコミットする
  const json = JSON.stringify({ videos: _mvVideos }, null, 2);
  const blob = new Blob([json], { type: 'application/json' });
  const url  = URL.createObjectURL(blob);
  const a    = document.createElement('a');
  a.href = url; a.download = 'music.json'; a.click();
  URL.revokeObjectURL(url);
  const status = $('#mv-status');
  if (status) status.textContent = 'music.json をダウンロードしました。docs/data/ に上書きしてコミットしてください。';
  _renderMvList();
}

function initMusicVideos() {
  const addBtn = $('#mv-add-btn');
  if (!addBtn) return;

  // music.json を読み込む
  fetch('/data/music.json')
    .then(r => r.json())
    .then(j => { _mvVideos = j.videos || []; _renderMvList(); })
    .catch(() => { _mvVideos = []; _renderMvList(); });

  $('#mv-download-btn')?.addEventListener('click', _saveMvData);

  addBtn.addEventListener('click', () => {
    const url       = $('#mv-url')?.value.trim();
    const title     = $('#mv-title')?.value.trim();
    const type      = $('#mv-type')?.value || 'original';
    const artist    = $('#mv-artist')?.value.trim() || null;
    const character = $('#mv-character')?.value.trim() || null;
    const date      = $('#mv-date')?.value || '';
    const manualId  = $('#mv-id')?.value.trim();

    if (!url || !title) {
      const s = $('#mv-status');
      if (s) s.textContent = 'URL とタイトルは必須です';
      return;
    }

    const id = manualId || `mv${String(Date.now()).slice(-6)}`;
    if (_mvVideos.find(v => v.id === id)) {
      const s = $('#mv-status');
      if (s) s.textContent = `ID "${id}" はすでに存在します`;
      return;
    }

    _mvVideos.push({
      id,
      title,
      type,
      ...(type === 'cover'     ? { originalArtist: artist || null } : {}),
      ...(type === 'character' ? { character: character || null }   : {}),
      url,
      publishedAt: date || null,
    });

    // フォームリセット
    ['mv-url','mv-title','mv-artist','mv-character','mv-date','mv-id'].forEach(id => {
      const el = $(`#${id}`);
      if (el) el.value = '';
    });

    _renderMvList();
    const status = $('#mv-status');
    if (status) status.textContent = `「${title}」を追加しました。準備ができたら「music.json をダウンロード」してください。`;
  });
}

/* ─── 起動 ───────────────────────────────────────────────────────────────── */

$('#refresh-status').addEventListener('click', loadStatus);
initManagement();
loadStatus();
initTimestamps();
initMusicVideos();
