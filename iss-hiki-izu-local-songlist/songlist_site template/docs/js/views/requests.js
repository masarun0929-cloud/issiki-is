import { $, escapeHtml, fmtDate } from '../utils.js';
import { icon } from '../icons.js';

const API = '/api/song-requests';

export function renderRequests() {
  const panel = $('#panel-requests');
  if (!panel) return;

  panel.innerHTML = `
    <div class="req-layout">
      <div class="card req-form-card">
        <div class="req-form-head">
          <span class="help-kicker">Request</span>
          <h2 class="req-form-title">曲リクエスト</h2>
          <p class="req-form-lead">歌ってほしい曲を送れます。既にある曲は一覧から「聴きたい」を押してください。</p>
        </div>
        <form id="req-form" class="req-form" novalidate>
          <div class="req-field">
            <label class="req-label" for="req-title">曲名 <span class="req-required">*</span></label>
            <input class="text-input req-input" id="req-title" name="title" type="text" placeholder="曲名を入力してください" maxlength="120" autocomplete="off" required>
          </div>
          <div class="req-field">
            <label class="req-label" for="req-artist">アーティスト</label>
            <input class="text-input req-input" id="req-artist" name="artist" type="text" placeholder="アーティスト名（任意）" maxlength="120" autocomplete="off">
          </div>
          <div class="req-field">
            <label class="req-label" for="req-url">URL</label>
            <input class="text-input req-input" id="req-url" name="url" type="url" placeholder="YouTube などの URL（任意）" maxlength="2000" autocomplete="off">
          </div>
          <div class="req-field">
            <label class="req-label" for="req-name">お名前</label>
            <input class="text-input req-input" id="req-name" name="requesterName" type="text" placeholder="ニックネーム（任意）" maxlength="40" autocomplete="off">
          </div>
          <div id="req-form-msg" class="req-msg" hidden></div>
          <button class="btn primary req-submit" id="req-submit" type="submit">
            <span class="req-submit-icon" aria-hidden="true">${icon('plus')}</span>
            <span>リクエストする</span>
          </button>
        </form>
      </div>

      <section class="card req-list-section">
        <div class="req-list-head">
          <div>
            <span class="help-kicker">Queue</span>
            <h3 class="req-list-title">みんなのリクエスト</h3>
          </div>
          <span class="req-list-note">投票数順</span>
        </div>
        <div id="req-list" class="req-list">
          <div class="state-card"><div class="spinner"></div><div class="msg">読み込み中…</div></div>
        </div>
      </section>

    </div>
  `;

  initForm();
  loadList();
}

function initForm() {
  const form = $('#req-form');
  if (!form) return;

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const btn = $('#req-submit');
    const msg = $('#req-form-msg');
    const title = $('#req-title').value.trim();

    if (!title) {
      showMsg(msg, '曲名を入力してください', 'error');
      $('#req-title').focus();
      return;
    }

    btn.disabled = true;
    btn.textContent = '送信中…';
    hideMsg(msg);

    try {
      const res = await fetch(API, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          title,
          artist: $('#req-artist').value.trim(),
          url: $('#req-url').value.trim(),
          requesterName: $('#req-name').value.trim(),
        }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'エラーが発生しました');

      showMsg(msg, '✅ リクエストを送信しました！ありがとうございます', 'success');
      form.reset();
      await loadList();
    } catch (err) {
      showMsg(msg, `⚠️ ${err.message}`, 'error');
    } finally {
      btn.disabled = false;
      btn.textContent = 'リクエストする';
    }
  });
}

async function loadList() {
  const list = $('#req-list');
  if (!list) return;

  try {
    const res = await fetch(`${API}?limit=100`);
    if (!res.ok) throw new Error('取得に失敗しました');
    const { items } = await res.json();
    renderList(list, items || []);
  } catch (err) {
    list.innerHTML = `<div class="state-card"><div class="msg">⚠️ ${escapeHtml(err.message)}</div></div>`;
  }
}

function renderList(container, items) {
  if (!items.length) {
    container.innerHTML = `
      <div class="req-empty">
        <strong>まだリクエストがありません</strong>
        <span>最初の曲を送るとここに表示されます。</span>
      </div>`;
    return;
  }

  container.innerHTML = items.map((item, index) => `
    <div class="req-card" data-id="${item.id}">
      <span class="req-rank">${index + 1}</span>
      <div class="req-card-body">
        <div class="req-card-main">
          <span class="req-card-title">${escapeHtml(item.title)}</span>
          ${item.artist ? `<span class="req-card-artist">${escapeHtml(item.artist)}</span>` : ''}
        </div>
        <div class="req-card-meta">
          ${item.url ? `<a class="req-card-url" href="${escapeHtml(item.url)}" target="_blank" rel="noopener noreferrer">リンクを開く</a>` : ''}
          ${item.requesterName ? `<span class="req-card-name">by ${escapeHtml(item.requesterName)}</span>` : ''}
          ${item.createdAt ? `<span class="req-card-date">${fmtDate(item.createdAt)}</span>` : ''}
        </div>
      </div>
      <button class="req-vote-btn" data-id="${item.id}" type="button" aria-label="聴きたい">
        <span class="req-vote-icon" aria-hidden="true">${icon('heart')}</span>
        <span class="req-vote-count">${item.voteCount ?? item.vote_count ?? 0}</span>
      </button>
    </div>
  `).join('');

  container.querySelectorAll('.req-vote-btn').forEach((btn) => {
    btn.addEventListener('click', () => vote(btn));
  });
}

async function vote(btn) {
  if (btn.disabled) return;
  const id = btn.dataset.id;
  btn.disabled = true;
  const icon = btn.querySelector('.req-vote-icon');
  const count = btn.querySelector('.req-vote-count');
  const prev = icon.textContent;
  icon.textContent = '♥';

  try {
    const res = await fetch(`${API}/${id}/vote`, { method: 'POST' });
    const data = await res.json();
    if (!res.ok) throw new Error(data.error || 'エラー');
    const n = data.item?.voteCount ?? data.item?.vote_count;
    if (n != null) count.textContent = n;
    btn.classList.add('req-voted');
  } catch {
    icon.textContent = prev;
    btn.disabled = false;
  }
}

function showMsg(el, text, type) {
  el.textContent = text;
  el.className = `req-msg req-msg--${type}`;
  el.hidden = false;
}

function hideMsg(el) {
  el.hidden = true;
}
