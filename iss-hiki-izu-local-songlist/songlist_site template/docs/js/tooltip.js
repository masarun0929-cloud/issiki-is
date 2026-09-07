// グローバルツールチップ: [data-tooltip] を持つ要素に自動配置で表示する。
// 旧CSS([data-tooltip]::after)は無効化済み。textContent代入のためXSS安全。
// 配置: 下に余白があれば下、なければ上。横は画面内に収める。

let tipEl = null;

function ensureTip() {
  if (tipEl) return tipEl;
  tipEl = document.createElement('div');
  tipEl.className = 'global-tip';
  tipEl.hidden = true;
  document.body.appendChild(tipEl);
  return tipEl;
}

function place(target) {
  const el = ensureTip();
  const r = target.getBoundingClientRect();
  const pad = 8;
  const gap = 6;
  // 寸法測定（画面外に置いて測る）
  el.style.visibility = 'hidden';
  el.hidden = false;
  const w = el.offsetWidth;
  const h = el.offsetHeight;
  el.style.visibility = '';
  const below = r.bottom + gap + h <= window.innerHeight - pad;
  const top = below ? r.bottom + gap : Math.max(pad, r.top - gap - h);
  const cx = r.left + r.width / 2;
  const left = Math.min(Math.max(pad, cx - w / 2), Math.max(pad, window.innerWidth - w - pad));
  el.style.top = `${Math.round(top)}px`;
  el.style.left = `${Math.round(left)}px`;
}

function show(target) {
  const text = target.getAttribute('data-tooltip');
  if (!text) {
    hide();
    return;
  }
  const el = ensureTip();
  if (el.textContent !== text) el.textContent = text;
  place(target);
  el.hidden = false;
}

function hide() {
  if (tipEl) tipEl.hidden = true;
}

export function initTooltip() {
  ensureTip();
  document.addEventListener('mouseover', (e) => {
    const t = e.target.closest?.('[data-tooltip]');
    if (!t) return;
    show(t);
  });
  document.addEventListener('mouseout', (e) => {
    const t = e.target.closest?.('[data-tooltip]');
    if (!t) return;
    if (t.contains(e.relatedTarget)) return;
    hide();
  });
  document.addEventListener('focusin', (e) => {
    const t = e.target.closest?.('[data-tooltip]');
    if (!t) return;
    show(t);
  });
  document.addEventListener('focusout', () => hide());
  document.addEventListener('click', () => hide());
  window.addEventListener('scroll', () => hide(), { passive: true, capture: true });
  window.addEventListener('resize', () => hide());
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') hide();
  });
}
