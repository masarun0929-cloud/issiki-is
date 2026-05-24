import { initTheme } from './theme.js';
import { $, fmtDate, formatNumber } from './utils.js';
import { SITE } from './config.js';

initTheme();
applySiteConfig();

function applySiteConfig() {
  const baseTitle = `${SITE.creatorName}　${SITE.databaseName}`;
  document.title = `運用管理｜${baseTitle}`;
  document.querySelector('.brand')?.setAttribute('aria-label', `${baseTitle} ホーム`);
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

function songKey(song) {
  return `${song.title || ''} / ${song.artist || ''}`;
}

function collectIssues(data) {
  const issues = [];
  const datasets = [
    ...Object.entries(data.channels || {}),
    ['combined', data.combined],
  ].filter(([, dataset]) => dataset);

  for (const [scope, dataset] of datasets) {
    for (const song of dataset.songs || []) {
      if (song.count > 0 && (!song.streamRefs || !song.streamRefs.length)) {
        issues.push({ type: '履歴未確認', place: scope, detail: songKey(song) });
      }
      if (!song.genre || song.genre === '未分類') {
        issues.push({ type: 'ジャンル未分類', place: scope, detail: songKey(song) });
      }
      if (dataset.stats?.keyPublished && !song.displayKey) {
        issues.push({ type: 'キー未登録', place: scope, detail: songKey(song) });
      }
    }
    for (const stream of dataset.streams || []) {
      if (stream.songCount && stream.songs && stream.songCount !== stream.songs.length) {
        issues.push({
          type: '曲数不一致',
          place: `${scope} 第${stream.index}枠`,
          detail: `${fmtDate(parseDate(stream.date))}: 表示${stream.songs.length} / 記録${stream.songCount}`,
        });
      }
      const seen = new Map();
      for (const song of stream.songs || []) {
        const key = song.key || songKey(song);
        seen.set(key, (seen.get(key) || 0) + 1);
      }
      for (const [key, count] of seen.entries()) {
        if (count > 1) {
          issues.push({
            type: '同一枠内重複',
            place: `${scope} 第${stream.index}枠`,
            detail: `${key} x${count}`,
          });
        }
      }
    }
  }
  return issues;
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
  const issues = collectIssues(data);
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

async function loadStatus() {
  setBadge(false, '確認中');
  $('#api-detail').textContent = '/api/data を読み込んでいます。';
  $('#channel-rows').innerHTML = '<tr><td colspan="5">読み込み中</td></tr>';
  $('#sync-status').innerHTML = '<div class="admin-note">確認中</div>';
  $('#quality-summary').innerHTML = '<div class="admin-note">確認中</div>';
  $('#quality-rows').innerHTML = '<tr><td colspan="3">読み込み中</td></tr>';

  const started = performance.now();
  try {
    const res = await fetch('/api/data', { cache: 'no-store' });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const data = await res.json();
    const elapsed = Math.round(performance.now() - started);
    const combined = data.combined || {};
    const stats = combined.stats || {};

    setBadge(true, '正常');
    $('#api-stats').innerHTML = [
      stat('曲数', formatNumber(stats.repertoire), '曲'),
      stat('歌枠', formatNumber(stats.streams), '枠'),
      stat('応答', formatNumber(elapsed), 'ms'),
    ].join('');
    $('#api-detail').textContent = `最新データ: ${fmtDate(parseDate(stats.updateDate))} / APIキャッシュは最大約1分です。`;
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

$('#refresh-status').addEventListener('click', loadStatus);
loadStatus();
