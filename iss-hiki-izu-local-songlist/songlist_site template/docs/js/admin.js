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

const KEY_PRESETS = ['原キー', '-9', '-8', '-7', '-6', '-5', '-4', '-3', '-2', '-1', '+1', '+2', '+3', '+4', '+5', '+6', '+7', '+8', '+9'];

function renderKeyPicker(displayKey) {
  const keys = String(displayKey || '').split(',').map(k => k.trim()).filter(Boolean);
  const chips = keys.map(k => `
    <span class="key-chip">
      ${escapeHtml(k)}<button type="button" class="key-chip-remove" data-remove-key="${escapeHtml(k)}" aria-label="${escapeHtml(k)}を削除">×</button>
    </span>
  `).join('');
  const menuItems = KEY_PRESETS.map(k => `
    <button type="button" data-add-key="${escapeHtml(k)}" class="${keys.includes(k) ? 'is-selected' : ''}">${escapeHtml(k)}</button>
  `).join('');
  return `
    <div class="key-picker">
      <input type="hidden" data-field="displayKey" value="${escapeHtml(keys.join(','))}">
      ${chips}
      <button type="button" class="key-add-btn" data-key-add-btn>＋ キー</button>
      <div class="key-add-menu">${menuItems}</div>
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
              <td>${renderKeyPicker(row.display_key || '')}</td>
              <td><input class="admin-compact-input" data-field="genre" value="${escapeHtml(row.genre || '')}"></td>
              <td><button class="btn ghost" type="button" data-save-meta>保存</button></td>
            </tr>
          `).join('')}
        </tbody>
      </table>
    </div>
  `;
}

const REQUEST_STATUS_LABELS = {
  unregistered: '未確認',
  practicing: '練習中',
  singable: '歌える',
  sung: '歌唱済み',
  rejected: '対象外',
};

function renderRequestStatusSelect(value) {
  return `
    <select data-field="status" class="admin-compact-input">
      ${Object.entries(REQUEST_STATUS_LABELS).map(([key, label]) => (
        `<option value="${key}" ${key === value ? 'selected' : ''}>${label}</option>`
      )).join('')}
    </select>
  `;
}

function renderRequestAdmin(items) {
  const box = $('#request-admin-box');
  if (!box) return;
  if (!items.length) {
    box.innerHTML = '<p class="admin-note">該当するリクエストはありません</p>';
    return;
  }
  box.innerHTML = `
    <div class="admin-table-wrap">
      <table class="admin-table request-admin-table">
        <thead>
          <tr>
            <th>曲</th>
            <th>歌手</th>
            <th>状態</th>
            <th>票</th>
            <th>送信者</th>
            <th>日付</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          ${items.map((item) => `
            <tr data-request-id="${item.id}">
              <td>
                <strong>${escapeHtml(item.title)}</strong>
                ${item.url ? `<br><a href="${escapeHtml(item.url)}" target="_blank" rel="noopener noreferrer">リンクを開く</a>` : ''}
              </td>
              <td>${escapeHtml(item.artist || '—')}</td>
              <td>${renderRequestStatusSelect(item.status || 'unregistered')}</td>
              <td><input class="admin-compact-input request-votes-input" data-field="voteCount" type="number" min="0" value="${Number(item.voteCount || 0)}"></td>
              <td>${escapeHtml(item.requesterName || '—')}</td>
              <td>${item.createdAt ? fmtDate(item.createdAt) : '—'}</td>
              <td>
                <button class="btn ghost" type="button" data-save-request>保存</button>
                <button class="btn ghost" type="button" data-delete-request>削除</button>
              </td>
            </tr>
          `).join('')}
        </tbody>
      </table>
    </div>
  `;
}

function renderRequestSummary(summary, count) {
  const badge = $('#request-count');
  if (badge) badge.textContent = `${count}件`;
  const total = Object.values(summary || {}).reduce((sum, value) => sum + Number(value || 0), 0);
  const status = $('#request-status');
  if (status) {
    status.textContent = total
      ? `全体: ${total}件 / 未確認: ${summary.unregistered || 0}件 / 歌える: ${summary.singable || 0}件 / 歌唱済み: ${summary.sung || 0}件`
      : 'リクエストはまだありません';
  }
}

async function loadSongRequests() {
  const box = $('#request-admin-box');
  if (!box) return;
  $('#request-status').textContent = '読み込み中...';
  box.innerHTML = '<p class="admin-note">読み込み中...</p>';
  try {
    const params = new URLSearchParams({
      status: $('#request-status-filter')?.value || 'all',
      q: $('#request-query')?.value || '',
      limit: '200',
    });
    const data = await adminApi(`song-requests?${params.toString()}`);
    renderRequestAdmin(data.items || []);
    renderRequestSummary(data.summary || {}, (data.items || []).length);
  } catch (error) {
    $('#request-status').textContent = `エラー: ${error.message || String(error)}`;
    box.innerHTML = '';
  }
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
    // ── キーピッカー: ＋キーボタン → ドロップダウン開閉 ──────────────────
    const addBtn = event.target.closest('[data-key-add-btn]');
    if (addBtn) {
      const menu = addBtn.nextElementSibling;
      const isOpen = menu.classList.contains('is-open');
      document.querySelectorAll('.key-add-menu').forEach(m => m.classList.remove('is-open'));
      if (!isOpen) {
        const rect = addBtn.getBoundingClientRect();
        menu.style.top = (rect.bottom + 4) + 'px';
        menu.style.left = rect.left + 'px';
        menu.classList.add('is-open');
      }
      return;
    }

    // ── キーピッカー: プリセットキーをトグル ────────────────────────────
    const addKeyBtn = event.target.closest('[data-add-key]');
    if (addKeyBtn) {
      const picker = addKeyBtn.closest('.key-picker');
      const hiddenInput = picker.querySelector('[data-field="displayKey"]');
      const key = addKeyBtn.dataset.addKey;
      let keys = hiddenInput.value.split(',').map(k => k.trim()).filter(Boolean);
      if (keys.includes(key)) {
        keys = keys.filter(k => k !== key);
        addKeyBtn.classList.remove('is-selected');
      } else {
        keys.push(key);
        addKeyBtn.classList.add('is-selected');
      }
      hiddenInput.value = keys.join(',');
      // チップを再描画
      picker.querySelectorAll('.key-chip').forEach(c => c.remove());
      keys.forEach(k => {
        const chip = document.createElement('span');
        chip.className = 'key-chip';
        chip.innerHTML = `${escapeHtml(k)}<button type="button" class="key-chip-remove" data-remove-key="${escapeHtml(k)}" aria-label="${escapeHtml(k)}を削除">×</button>`;
        picker.insertBefore(chip, picker.querySelector('[data-key-add-btn]'));
      });
      return;
    }

    // ── キーピッカー: チップのxで削除 ───────────────────────────────────
    const removeBtn = event.target.closest('[data-remove-key]');
    if (removeBtn) {
      const picker = removeBtn.closest('.key-picker');
      const hiddenInput = picker.querySelector('[data-field="displayKey"]');
      const key = removeBtn.dataset.removeKey;
      let keys = hiddenInput.value.split(',').map(k => k.trim()).filter(Boolean);
      keys = keys.filter(k => k !== key);
      hiddenInput.value = keys.join(',');
      removeBtn.closest('.key-chip').remove();
      // メニューの selected 状態を更新
      picker.querySelectorAll(`[data-add-key="${CSS.escape(key)}"]`).forEach(b => b.classList.remove('is-selected'));
      return;
    }

    // ── 保存ボタン ────────────────────────────────────────────────────────
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

  // ドロップダウン外クリックで閉じる
  document.addEventListener('click', (e) => {
    if (!e.target.closest('.key-picker')) {
      document.querySelectorAll('.key-add-menu').forEach(m => m.classList.remove('is-open'));
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

  $('#load-requests')?.addEventListener('click', loadSongRequests);
  $('#request-status-filter')?.addEventListener('change', loadSongRequests);
  $('#request-query')?.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') loadSongRequests();
  });
  $('#request-admin-box')?.addEventListener('click', async (event) => {
    const saveBtn = event.target.closest('[data-save-request]');
    const deleteBtn = event.target.closest('[data-delete-request]');
    if (!saveBtn && !deleteBtn) return;
    const row = event.target.closest('[data-request-id]');
    const id = row?.dataset.requestId;
    if (!id) return;

    if (deleteBtn) {
      const title = row.querySelector('strong')?.textContent || 'このリクエスト';
      if (!confirm(`「${title}」を削除します。よろしいですか？`)) return;
      $('#request-status').textContent = '削除中...';
      try {
        await adminApi(`song-requests/${id}/delete`, {});
        $('#request-status').textContent = '削除しました。';
        await loadSongRequests();
      } catch (error) {
        $('#request-status').textContent = `エラー: ${error.message || String(error)}`;
      }
      return;
    }

    $('#request-status').textContent = '保存中...';
    try {
      await adminApi(`song-requests/${id}`, {
        status: row.querySelector('[data-field="status"]').value,
        voteCount: row.querySelector('[data-field="voteCount"]').value,
      });
      $('#request-status').textContent = '保存しました。';
      await loadSongRequests();
    } catch (error) {
      $('#request-status').textContent = `エラー: ${error.message || String(error)}`;
    }
  });
  loadSongRequests();

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
          const chLabel = item.channelCode === 'new' ? CHANNELS.new.label : (item.channelCode || '—');
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
  if (!$('#ts-table-wrap')) return;
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
            const typeLabel = { original: 'オリ曲', office: 'ルミステ', character: 'キャラ', cover: 'カバー' }[v.type] || v.type;
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

/* ─── 歌枠の編集・削除 ────────────────────────────────────────────────────── */

let _editStreamId = null;
let _editStreamMeta = null;   // 一覧から選んだ歌枠の情報
let _editSongLines = [];      // セトリ1行 = 「曲名 / アーティスト | キー | ジャンル」

function _renderStreamList(streams) {
  const wrap = $('#stream-list-wrap');
  if (!streams.length) {
    wrap.innerHTML = '<p class="admin-note">歌枠がありません</p>';
    return;
  }
  wrap.innerHTML = `
    <div class="admin-table-wrap">
      <table class="admin-table">
        <thead><tr><th>枠</th><th>配信日</th><th>タイトル</th><th>曲数</th><th>時刻</th><th></th></tr></thead>
        <tbody>
          ${streams.map((s) => `
            <tr>
              <td>#${s.sourceIndex}</td>
              <td>${escapeHtml(s.streamedOn)}</td>
              <td>${escapeHtml(s.title || `第${s.sourceIndex}枠`)}</td>
              <td>${s.songCount}</td>
              <td>${s.timestampCount > 0 ? `✓${s.timestampCount}` : '—'}</td>
              <td><button class="btn ghost" data-edit-stream="${s.id}" type="button" style="padding:4px 10px;font-size:12px">編集</button></td>
            </tr>`).join('')}
        </tbody>
      </table>
    </div>`;

  wrap.querySelectorAll('[data-edit-stream]').forEach((btn) => {
    btn.addEventListener('click', () => _loadStreamForEdit(Number(btn.dataset.editStream)));
  });
}

/** セトリを行単位で描画する。並び替え・削除・追加はこの配列を書き換えて再描画する */
function _renderSetlistRows() {
  const wrap = $('#edit-setlist-wrap');
  if (!wrap) return;
  if (!_editSongLines.length) {
    wrap.innerHTML = '<p class="admin-note">曲がありません。「曲を追加」から追加してください。</p>';
    return;
  }
  wrap.innerHTML = `
    <div class="admin-table-wrap">
      <table class="admin-table setlist-edit-table">
        <thead><tr><th style="width:3em">#</th><th>曲名 / アーティスト</th><th style="width:9em">並び替え</th><th style="width:4em"></th></tr></thead>
        <tbody>
          ${_editSongLines.map((line, i) => `
            <tr>
              <td>${i + 1}</td>
              <td><input class="text-input" data-song-line="${i}" type="text" value="${escapeHtml(line)}" style="width:100%"></td>
              <td>
                <button class="btn ghost" data-song-up="${i}" type="button" ${i === 0 ? 'disabled' : ''} title="上へ" style="padding:2px 8px">↑</button>
                <button class="btn ghost" data-song-down="${i}" type="button" ${i === _editSongLines.length - 1 ? 'disabled' : ''} title="下へ" style="padding:2px 8px">↓</button>
              </td>
              <td><button class="btn ghost" data-song-del="${i}" type="button" title="この曲を削除" style="padding:2px 8px">×</button></td>
            </tr>`).join('')}
        </tbody>
      </table>
    </div>`;

  wrap.querySelectorAll('[data-song-line]').forEach((input) => {
    input.addEventListener('input', () => { _editSongLines[Number(input.dataset.songLine)] = input.value; });
  });
  wrap.querySelectorAll('[data-song-up]').forEach((btn) => {
    btn.addEventListener('click', () => _moveSong(Number(btn.dataset.songUp), -1));
  });
  wrap.querySelectorAll('[data-song-down]').forEach((btn) => {
    btn.addEventListener('click', () => _moveSong(Number(btn.dataset.songDown), 1));
  });
  wrap.querySelectorAll('[data-song-del]').forEach((btn) => {
    btn.addEventListener('click', () => {
      const i = Number(btn.dataset.songDel);
      _editSongLines.splice(i, 1);
      _renderSetlistRows();
      $('#setlist-status').textContent = '削除しました（「セトリを保存」で確定します）';
    });
  });
}

function _moveSong(index, delta) {
  const next = index + delta;
  if (next < 0 || next >= _editSongLines.length) return;
  const [row] = _editSongLines.splice(index, 1);
  _editSongLines.splice(next, 0, row);
  _renderSetlistRows();
  $('#setlist-status').textContent = '並び替えました（「セトリを保存」で確定します）';
}

async function _loadStreamForEdit(streamId) {
  $('#stream-edit-status').textContent = '読み込み中…';
  try {
    const data = await adminApi(`streams/${streamId}/songs`);
    const s = data.stream;
    _editStreamId = streamId;
    _editStreamMeta = s;
    _editSongLines = String(data.songsText || '').split(/\r?\n/).filter((line) => line.trim());

    $('#edit-streamed-on').value = s.streamedOn || '';
    $('#edit-source-index').value = s.sourceIndex != null ? s.sourceIndex : '';
    $('#edit-stream-title').value = s.title || '';
    $('#edit-stream-url').value = s.url || '';
    $('#stream-edit-heading').textContent = `#${s.sourceIndex} ${s.streamedOn} ${s.title || ''}`;
    $('#stream-edit-form').style.display = '';
    $('#stream-edit-badge').textContent = `編集中: #${s.sourceIndex}`;
    $('#stream-info-status').textContent = '';
    $('#setlist-status').textContent = '';
    $('#stream-edit-status').textContent = '';
    _renderSetlistRows();
    $('#stream-edit-form').scrollIntoView({ behavior: 'smooth', block: 'start' });
  } catch (err) {
    $('#stream-edit-status').textContent = `エラー: ${err.message || err}`;
  }
}

async function _reloadStreamList() {
  const channelCode = $('#edit-channel').value;
  $('#stream-edit-status').textContent = '読み込み中…';
  try {
    const data = await adminApi(`streams?channel=${encodeURIComponent(channelCode)}&limit=300`);
    _renderStreamList(data.streams || []);
    $('#stream-edit-status').textContent = `${(data.streams || []).length}件`;
  } catch (err) {
    $('#stream-edit-status').textContent = `エラー: ${err.message || err}`;
  }
}

function initStreamEdit() {
  const editChannel = $('#edit-channel');
  if (!editChannel) return;
  const channels = Object.values(CHANNELS);
  editChannel.innerHTML = channels
    .map((ch) => `<option value="${escapeHtml(ch.id)}">${escapeHtml(ch.label)}</option>`)
    .join('');
  editChannel.value = CHANNELS[DEFAULT_CHANNEL] ? DEFAULT_CHANNEL : channels[0]?.id || '';

  const resetForm = () => {
    _editStreamId = null;
    _editStreamMeta = null;
    _editSongLines = [];
    $('#stream-edit-form').style.display = 'none';
    $('#stream-edit-badge').textContent = '選択中なし';
  };

  editChannel.addEventListener('change', () => { resetForm(); _reloadStreamList(); });
  $('#load-streams-btn')?.addEventListener('click', () => { resetForm(); _reloadStreamList(); });

  // 歌枠情報（配信日・タイトル・URL・枠番号）
  $('#save-stream-info-btn')?.addEventListener('click', async () => {
    if (!_editStreamId) return;
    if (!confirm('歌枠情報を更新します。よろしいですか？')) return;
    $('#stream-info-status').textContent = '保存中…';
    try {
      const res = await adminApi(`streams/${_editStreamId}`, {
        title: $('#edit-stream-title').value,
        url: $('#edit-stream-url').value,
        streamedOn: $('#edit-streamed-on').value,
        sourceIndex: $('#edit-source-index').value || null,
      });
      const moved = res.movedTimestamps ? '（開始時刻の紐付けも移動しました）' : '';
      $('#stream-info-status').textContent = `保存しました${moved}。公開サイトへ反映するには「静的データ生成」を実行してください。`;
      await _reloadStreamList();
    } catch (err) {
      $('#stream-info-status').textContent = `エラー: ${err.message || err}`;
    }
  });

  // セトリの行操作
  $('#add-song-row-btn')?.addEventListener('click', () => {
    if (!_editStreamId) return;
    _editSongLines.push('');
    _renderSetlistRows();
    const inputs = document.querySelectorAll('[data-song-line]');
    inputs[inputs.length - 1]?.focus();
  });

  $('#preview-edit-stream-btn')?.addEventListener('click', async () => {
    if (!_editStreamId) return;
    $('#setlist-status').textContent = '確認中…';
    try {
      const data = await adminApi('preview-stream', { songsText: _editSongLines.join('\n') });
      $('#edit-preview-box').innerHTML = `
        <div class="admin-table-wrap">
          <table class="admin-table">
            <thead><tr><th>#</th><th>曲名</th><th>アーティスト</th><th>キー</th><th>ジャンル</th><th>照合</th></tr></thead>
            <tbody>
              ${data.songs.map((row, i) => `
                <tr>
                  <td>${i + 1}</td>
                  <td>${escapeHtml(row.title)}</td>
                  <td>${escapeHtml(row.artist || '')}</td>
                  <td>${escapeHtml(row.displayKey || '')}</td>
                  <td>${escapeHtml(row.genre || '')}</td>
                  <td>${escapeHtml(row.match)}</td>
                </tr>`).join('')}
            </tbody>
          </table>
        </div>`;
      $('#setlist-status').textContent = `${data.songs.length}曲を確認しました。`;
    } catch (err) {
      $('#setlist-status').textContent = `エラー: ${err.message || err}`;
    }
  });

  $('#save-setlist-btn')?.addEventListener('click', async () => {
    if (!_editStreamId) return;
    const lines = _editSongLines.map((line) => line.trim()).filter(Boolean);
    if (!lines.length) { $('#setlist-status').textContent = '曲がありません'; return; }
    if (!confirm(`このセトリ（${lines.length}曲）に置き換えます。\nこの歌枠の曲ごとの開始時刻は曲順が変わるため一度破棄されます。よろしいですか？`)) return;
    $('#setlist-status').textContent = '保存中…';
    try {
      const data = await adminApi(`streams/${_editStreamId}/setlist`, { songsText: lines.join('\n') });
      const dropped = data.droppedTimestamps ? `　開始時刻 ${data.droppedTimestamps}件を破棄しました（必要なら再度貼り付けてください）。` : '';
      $('#setlist-status').textContent = `${data.songCount}曲で保存しました。${dropped}公開サイトへ反映するには「静的データ生成」を実行してください。`;
      _editSongLines = lines;
      _renderSetlistRows();
      await _reloadStreamList();
    } catch (err) {
      $('#setlist-status').textContent = `エラー: ${err.message || err}`;
    }
  });

  // 歌枠そのものの削除
  $('#delete-stream-btn')?.addEventListener('click', async () => {
    if (!_editStreamId || !_editStreamMeta) return;
    const label = `#${_editStreamMeta.sourceIndex} ${_editStreamMeta.streamedOn} ${_editStreamMeta.title || ''}`;
    if (!confirm(`この歌枠を削除します。元に戻せません。\n\n${label}\n\n歌唱回数の集計と、この枠の開始時刻も一緒に取り消されます。よろしいですか？`)) return;
    if (!confirm('本当に削除しますか？')) return;
    $('#stream-info-status').textContent = '削除中…';
    try {
      const res = await adminApi(`streams/${_editStreamId}/delete`, {});
      resetForm();
      $('#stream-edit-status').textContent = `削除しました（${res.removedSongs}曲）。公開サイトへ反映するには「静的データ生成」を実行してください。`;
      await _reloadStreamList();
    } catch (err) {
      $('#stream-info-status').textContent = `エラー: ${err.message || err}`;
    }
  });
}

/* ─── タイムスタンプ反映（固定コメントを貼り付けて曲名で照合） ─────────────── */

let _tspSetlist = null;   // { stream, songs[] }
let _tspMatched = null;   // matchSetlist の結果

async function initTimestampPaste() {
  const channelSelect = $('#tsp-channel');
  const streamSelect = $('#tsp-stream');
  if (!channelSelect || !streamSelect) return;

  const channels = Object.values(CHANNELS);
  channelSelect.innerHTML = channels
    .map((channel) => `<option value="${escapeHtml(channel.id)}">${escapeHtml(channel.label)}</option>`)
    .join('');
  channelSelect.value = CHANNELS[DEFAULT_CHANNEL] ? DEFAULT_CHANNEL : channels[0]?.id || '';

  channelSelect.addEventListener('change', loadTimestampStreams);
  streamSelect.addEventListener('change', () => {
    _tspSetlist = null;
    _tspMatched = null;
    $('#tsp-save').disabled = true;
    $('#tsp-preview-box').innerHTML = '';
    $('#tsp-status').textContent = '';
  });
  $('#tsp-match').addEventListener('click', matchPastedTimestamps);
  $('#tsp-save').addEventListener('click', savePastedTimestamps);

  await loadTimestampStreams();
}

async function loadTimestampStreams() {
  const select = $('#tsp-stream');
  const channelCode = $('#tsp-channel').value;
  select.innerHTML = '<option value="">読み込み中…</option>';
  try {
    const { streams } = await adminApi(`streams?channel=${encodeURIComponent(channelCode)}&limit=200`);
    if (!streams?.length) {
      select.innerHTML = '<option value="">歌枠がありません</option>';
      return;
    }
    select.innerHTML = streams.map((s) => {
      // 反映済みの枠が一目で分かるようにしておく
      const mark = s.timestampCount > 0 ? `✓${s.timestampCount}` : '未';
      return `<option value="${s.sourceIndex}">[${mark}] #${s.sourceIndex} ${escapeHtml(s.streamedOn)} ${escapeHtml(String(s.title).slice(0, 40))}</option>`;
    }).join('');
  } catch (err) {
    select.innerHTML = '<option value="">取得に失敗しました</option>';
    $('#tsp-status').textContent = `⚠️ ${err.message}`;
  }
}

async function matchPastedTimestamps() {
  const channelCode = $('#tsp-channel').value;
  const streamIndex = Number($('#tsp-stream').value);
  const comment = $('#tsp-comment').value;
  const status = $('#tsp-status');
  const saveBtn = $('#tsp-save');
  saveBtn.disabled = true;

  if (!streamIndex) { status.textContent = '⚠️ 歌枠を選んでください'; return; }
  if (!comment.trim()) { status.textContent = '⚠️ 固定コメントを貼り付けてください'; return; }

  status.textContent = '照合中…';
  try {
    const { matchSetlist, findInversions, formatSeconds } = await import('./admin/timestamp-matcher.js');
    _tspSetlist = await adminApi(`streams/${encodeURIComponent(channelCode)}/${streamIndex}/setlist`);
    _tspMatched = matchSetlist(_tspSetlist.songs, comment);

    const matchedCount = _tspMatched.filter((m) => m.seconds != null).length;
    const inversions = new Set(findInversions(_tspMatched).map((v) => v.index));

    $('#tsp-preview-box').innerHTML = `
      <table class="admin-table">
        <thead><tr><th>#</th><th>曲名</th><th>アーティスト</th><th>現在</th><th>照合結果</th><th>方法</th></tr></thead>
        <tbody>
          ${_tspSetlist.songs.map((song, i) => {
            const m = _tspMatched[i];
            const changed = m.seconds != null && m.seconds !== song.currentSeconds;
            const warn = inversions.has(i);
            return `
            <tr${warn ? ' style="background:var(--orange-bg);"' : ''}>
              <td>${i + 1}</td>
              <td>${escapeHtml(song.title)}</td>
              <td>${escapeHtml(song.artist || '')}</td>
              <td>${song.currentSeconds != null ? escapeHtml(formatSeconds(song.currentSeconds)) : '—'}</td>
              <td><strong>${m.seconds != null ? escapeHtml(formatSeconds(m.seconds)) : '—'}</strong>${changed && song.currentSeconds != null ? ' <small>(変更)</small>' : ''}</td>
              <td>${warn ? '⚠️ 時刻が前後している' : escapeHtml(m.how || '未割当')}</td>
            </tr>`;
          }).join('')}
        </tbody>
      </table>`;

    const warnText = inversions.size ? `　⚠️ 時刻の逆転 ${inversions.size}件（コメントの誤記か照合ミスの可能性）` : '';
    status.textContent = `照合: ${matchedCount} / ${_tspSetlist.songs.length}曲${warnText}`;
    saveBtn.disabled = matchedCount === 0;
  } catch (err) {
    status.textContent = `⚠️ ${err.message}`;
    $('#tsp-preview-box').innerHTML = '';
  }
}

async function savePastedTimestamps() {
  if (!_tspSetlist || !_tspMatched) return;
  const status = $('#tsp-status');
  const saveBtn = $('#tsp-save');
  const items = _tspMatched
    .map((m, i) => (m.seconds == null ? null : { songIndex: i, timeSeconds: m.seconds, note: m.how || '管理画面' }))
    .filter(Boolean);

  if (!confirm(`この歌枠の開始時刻を ${items.length}件で置き換えます。よろしいですか？`)) return;

  saveBtn.disabled = true;
  status.textContent = '保存中…';
  try {
    const res = await adminApi('timestamps/bulk', {
      channelCode: _tspSetlist.stream.channelCode,
      streamIndex: _tspSetlist.stream.sourceIndex,
      items,
    });
    status.textContent = `✅ ${res.saved}件を保存しました。公開サイトへ反映するには「静的データ生成」を実行してください。`;
    await loadTimestampStreams();
  } catch (err) {
    status.textContent = `⚠️ ${err.message}`;
    saveBtn.disabled = false;
  }
}

/* ─── 起動 ───────────────────────────────────────────────────────────────── */

$('#refresh-status').addEventListener('click', loadStatus);
initManagement();
loadStatus();
initTimestamps();
initTimestampPaste();
initMusicVideos();
initStreamEdit();
