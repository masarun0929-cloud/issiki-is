import { SITE } from './config.js';

const FAVORITES_KEY = `${SITE.storagePrefix}-favorites-v1`;

export function loadFavorites() {
  try {
    const raw = localStorage.getItem(FAVORITES_KEY);
    if (!raw) return new Set();
    const arr = JSON.parse(raw);
    return new Set(Array.isArray(arr) ? arr : []);
  } catch (_) {
    return new Set();
  }
}

export function saveFavorites(favorites) {
  try {
    localStorage.setItem(FAVORITES_KEY, JSON.stringify([...favorites]));
  } catch (e) {
    console.warn('Failed to save favorites:', e);
  }
}

export function toggleFavorite(key) {
  const favorites = loadFavorites();
  if (favorites.has(key)) {
    favorites.delete(key);
  } else {
    favorites.add(key);
  }
  saveFavorites(favorites);
  state.favorites = favorites;
  emit({ key: 'favorites', prev: null, next: favorites });
  return favorites;
}

export function isFavorite(key) {
  return state.favorites.has(key);
}

export const state = {
  // multi-channel data
  channelData: null,  // { channels: { new, old }, combined }
  channel: 'new',     // 'new' | 'old' | 'all'
  data: null,         // currently active channel's dataset (set by main.js on switch)
  lives: [],
  liveStats: {},

  // favorites
  favorites: loadFavorites(),
  favoritesFilter: false,

  activeTab: 'dashboard',
  audience: 'listener',

  // timeline
  timelineLimit: 12,
  timelineFilter: null,
  timelineFocus: null,

  // songs
  songsQuery: '',
  songsSort: 'count-desc',
  songsLimit: 100,
  songsFilter: 'all',
  songsGenre: 'all',
  songsSeason: 'all',
  songsView: 'comfortable',
  singerMode: false,
  singerPreset: 'all',
  setlist: {
    theme: '',
    copyFormat: 'simple',
    items: [],
  },
  setlistExpanded: false,

  // ranking
  rankingLimit: 50,
};

const listeners = new Set();
export const onStateChange = (fn) => { listeners.add(fn); return () => listeners.delete(fn); };
export const emit = (event) => { for (const fn of listeners) fn(event); };
