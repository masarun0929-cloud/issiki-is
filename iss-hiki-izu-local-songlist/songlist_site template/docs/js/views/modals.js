// チャンネル情報・各種モーダル(ヘルプ / ウェルカムTip)
import { $, escapeHtml } from '../utils.js';
import { SITE, CHANNELS } from '../config.js';

const WELCOME_TIP_DISMISSED_KEY = `${SITE.storagePrefix}-welcome-tip-dismissed`;

// ─── チャンネル情報モーダル ────────────────────────────────────────────────────
// 単一チャンネル構成のため CHANNELS.new のみを表示する。

const CH_INFO = {
  new: {
    name: `${SITE.creatorName}`,
    handle: CHANNELS.new.handle,
    url: SITE.officialLinks.find(l => l.label === 'YouTube')?.url || 'https://www.youtube.com/',
    label: CHANNELS.new.label,
    desc: CHANNELS.new.intro,
    links: SITE.officialLinks
      .filter(l => l.label !== 'YouTube')
      .map(l => ({
        icon: l.className === 'x-link'
          ? '<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>'
          : l.className === 'tiktok-link'
          ? '<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M16.6 5.82A4.28 4.28 0 0 1 15.83 3H12.6v14.5a3.1 3.1 0 1 1-2.2-2.97V11.3a6.24 6.24 0 1 0 5.3 6.17V9.1a7.2 7.2 0 0 0 4.2 1.35V7.2a4.28 4.28 0 0 1-3.3-1.38z"/></svg>'
          : '<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 3c-4.97 0-9 3.13-9 7 0 2.24 1.36 4.23 3.47 5.51-.11.9-.5 2.1-1.47 3.24a.4.4 0 0 0 .34.65c1.98-.2 3.5-1.02 4.5-1.72.99.2 2.04.32 3.16.32 4.97 0 9-3.13 9-7s-4.03-7-9-7z"/></svg>',
        label: l.label === 'X' ? 'X（旧Twitter）' : l.label,
        url: l.url,
      })),
    avatarUrl: CHANNELS.new.avatarUrl,
    bannerUrl: CHANNELS.new.bannerUrl,
  },
};

function _buildChCard(key) {
  const info = CH_INFO[key];
  if (!info) return '';

  // バナー部分（画像URL があれば img、なければグラデーション）
  const bannerInner = info.bannerUrl
    ? `<img class="ch-card-banner-img" src="${escapeHtml(info.bannerUrl)}" alt="" loading="lazy" referrerpolicy="no-referrer">`
    : '';

  // アバター部分（画像URL があれば img、なければ文字）
  const avatarInner = info.avatarUrl
    ? `<img class="ch-card-avatar-img" src="${escapeHtml(info.avatarUrl)}" alt="${escapeHtml(info.name)}" loading="lazy" referrerpolicy="no-referrer">`
    : SITE.creatorName.slice(0, 1);

  // 説明文（改行対応）
  const descHtml = info.desc
    ? `<p class="ch-card-desc">${info.desc.split('\n').map(l => escapeHtml(l)).join('<br>')}</p>`
    : '';

  // リンク一覧
  const linksHtml = info.links?.length ? `
    <div class="ch-card-links">
      ${info.links.map(l => `
        <a class="ch-card-link" href="${escapeHtml(l.url)}" target="_blank" rel="noopener">
          <span class="ch-card-link-icon" aria-hidden="true">${l.icon}</span>
          <span>${escapeHtml(l.label)}</span>
        </a>`).join('')}
    </div>` : '';

  return `
    <div class="ch-card ch-card--${key}">
      <div class="ch-card-banner ch-card-banner--${key}${info.bannerUrl ? ' ch-card-banner--img' : ''}">
        ${bannerInner}
      </div>
      <div class="ch-card-body">
        <div class="ch-card-header">
          <div class="ch-card-avatar ch-card-avatar--${key}${info.avatarUrl ? ' ch-card-avatar--img' : ''}">${avatarInner}</div>
          <div class="ch-card-meta">
            <div class="ch-card-name">${escapeHtml(info.name)}</div>
            <div class="ch-card-handle">${escapeHtml(info.handle)}</div>
          </div>
        </div>
        ${descHtml}
        ${linksHtml}
        <div class="ch-card-actions">
          <a class="ch-card-yt-btn" href="${escapeHtml(info.url)}" target="_blank" rel="noopener">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M23.5 6.2a3 3 0 0 0-2.1-2.1C19.5 3.6 12 3.6 12 3.6s-7.5 0-9.4.5A3 3 0 0 0 .5 6.2C0 8.1 0 12 0 12s0 3.9.5 5.8a3 3 0 0 0 2.1 2.1c1.9.5 9.4.5 9.4.5s7.5 0 9.4-.5a3 3 0 0 0 2.1-2.1C24 15.9 24 12 24 12s0-3.9-.5-5.8ZM9.6 15.6V8.4l6.3 3.6-6.3 3.6Z"/></svg>
            YouTubeチャンネルへ
          </a>
        </div>
      </div>
    </div>`;
}

function openChannelModal() {
  const modal = $('#ch-modal');
  const body  = $('#ch-modal-body');
  if (!modal || !body) return;

  // 単一チャンネル構成のため常に new のカードのみ表示する。
  body.innerHTML = _buildChCard('new');
  modal.hidden = false;
  $('#ch-modal-close')?.focus();
}

export function initChannelModal() {
  const modal    = $('#ch-modal');
  const closeBtn = $('#ch-modal-close');
  if (!modal || !closeBtn) return;

  const close = () => { modal.hidden = true; };
  closeBtn.addEventListener('click', close);
  modal.addEventListener('click', e => { if (e.target === modal) close(); });

  // Official Channel ボタン
  document.querySelectorAll('[data-ch-modal]').forEach(btn => {
    btn.addEventListener('click', () => openChannelModal(btn.dataset.chModal));
  });
}

export function initHelpModal() {
  const modal = $('#help-modal');
  const openBtn = $('#help-btn');
  const closeBtn = $('#help-close');
  if (!modal || !openBtn || !closeBtn) return;

  const open = () => {
    modal.hidden = false;
    closeBtn.focus();
  };
  const close = () => {
    modal.hidden = true;
    openBtn.focus();
  };

  openBtn.addEventListener('click', open);
  closeBtn.addEventListener('click', close);
  modal.addEventListener('click', (event) => {
    if (event.target === modal) close();
  });
  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && !modal.hidden) close();
  });
}

export function initWelcomeTip() {
  const tip = $('#welcome-tip');
  const close = $('#welcome-close');
  if (!tip || !close) return;
  if (window.matchMedia('(max-width: 760px)').matches) return;
  if (localStorage.getItem(WELCOME_TIP_DISMISSED_KEY) === '1') return;
  const show = () => { tip.hidden = false; };
  if ('requestIdleCallback' in window) {
    window.requestIdleCallback(show, { timeout: 5000 });
  } else {
    window.setTimeout(show, 2500);
  }
  close.addEventListener('click', () => {
    tip.hidden = true;
    localStorage.setItem(WELCOME_TIP_DISMISSED_KEY, '1');
  });
}
