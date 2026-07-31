import { $, $$ } from './utils-dom.js';
import { normalize, escapeHtml, escapeRegExp, parseDateIso, formatDateRaw, formatMonth, monthKey, daysSince as domainDaysSince, daysClass, buildSongKey } from './domain-compat.js';

export { $, $$, normalize, escapeHtml, escapeRegExp, parseDateIso, formatDateRaw, formatMonth, monthKey, daysClass };

export const TODAY = (() => { const d = new Date(); d.setHours(0, 0, 0, 0); return d; })();

export const songKey = (title, artist) => buildSongKey(title, artist);

export const daysSince = (date, today = TODAY) => domainDaysSince(date, today);

export const parseDate = parseDateIso;

export const fmtDate = formatDateRaw;

export const fmtMonth = formatMonth;

export const streamKey = (stream) => `${stream?.channelCode || stream?.channel || ''}:${stream?.dateText || stream?.streamedOn || stream?.date || ''}:${stream?.url || stream?.title || ''}`;

export function youtubeVideoId(url) {
  const text = String(url || '');
  const patterns = [
    /youtu\.be\/([A-Za-z0-9_-]{11})/,
    /youtube\.com\/watch\?[^#]*v=([A-Za-z0-9_-]{11})/,
    /youtube\.com\/live\/([A-Za-z0-9_-]{11})/,
    /youtube\.com\/shorts\/([A-Za-z0-9_-]{11})/,
    /youtube\.com\/embed\/([A-Za-z0-9_-]{11})/,
  ];
  for (const pattern of patterns) {
    const m = text.match(pattern);
    if (m) return m[1];
  }
  return '';
}
// mqdefault は純粋な 16:9 (320x180)。hqdefault (480x360, 4:3) は 16:9 動画で
// 上下に黒帯が焼き込まれるため、表示は mq を主・hq をフォールバックにする。
export const youtubeThumb         = (url) => { const id = youtubeVideoId(url); return id ? `https://i.ytimg.com/vi/${id}/mqdefault.jpg`  : ''; };
export const youtubeThumbFallback = (url) => { const id = youtubeVideoId(url); return id ? `https://i.ytimg.com/vi/${id}/hqdefault.jpg`  : ''; };
// maxresdefault は 16:9 の高解像度 (1280x720)。存在しない動画があるため、
// onerror フォールバック（→ mqdefault）を必ず併用して使う。
export const youtubeThumbHq       = (url) => { const id = youtubeVideoId(url); return id ? `https://i.ytimg.com/vi/${id}/maxresdefault.jpg` : ''; };
export function youtubeThumbTiny(url) {
  const id = youtubeVideoId(url);
  return id ? `https://i.ytimg.com/vi/${id}/default.jpg` : '';
}

export const debounce = (fn, ms = 150) => {
  let t;
  return (...args) => {
    clearTimeout(t);
    t = setTimeout(() => fn(...args), ms);
  };
};

export const groupBy = (arr, fn) => {
  const m = new Map();
  for (const x of arr) {
    const k = fn(x);
    if (!m.has(k)) m.set(k, []);
    m.get(k).push(x);
  }
  return m;
};

export const sumBy = (arr, fn) => arr.reduce((s, x) => s + (fn(x) || 0), 0);

export const formatNumber = (n) => Number(n || 0).toLocaleString();

export const isLink = (el) => !!(el && el.closest && el.closest('a, button'));

export function highlightText(text, queries) {
  if (!queries || !queries.length) return escapeHtml(text);
  const escaped = escapeHtml(text);
  let result = escaped;
  for (const q of queries) {
    if (!q) continue;
    const re = new RegExp(escapeRegExp(escapeHtml(q)), 'gi');
    result = result.replace(re, (m) => `<mark class="hl">${m}</mark>`);
  }
  return result;
}
