/**
 * @module admin/timestamp-matcher
 * @description 歌枠の固定コメント（セトリ＆タイムスタンプ）から、
 * セットリスト各曲の開始秒を割り当てる純粋関数群。
 *
 * 依存を持たないので、管理画面（ブラウザ）と tools/（Node）の両方から使える。
 * 照合の優先順は実データで決めたもので、変えると精度が落ちる:
 *   1. 曲名の完全一致 かつ アーティストも一致
 *   2. 曲名の完全一致
 *   3. 曲名の部分一致（3文字以上かつ長さ比50%以上）
 *   4. 上で埋まらなかった箇所を並び順で補完
 *
 * @副作用 なし
 */

const TS_RE = /(\d{1,3}:\d{2}(?::\d{2})?)/g;

/** 曲ではない行。固定コメントに混ざる目印を落とす */
const NON_SONG_RE = /^(声入り|あくび|雑談|スクショ|開始|終了|end|start|オープニング|エンディング|告知|宣伝|フリートーク|挨拶|自己紹介|コメント|お知らせ|休憩)/i;

/** ヘッダー行（YouTube のコメント欄をそのまま貼ったときに混ざる） */
const HEADER_RE = /さんによって固定されています|^@|^\d+\s*(日|時間|分|週間|か月|年)前$|^セトリ|^タイムスタンプ|^setlist/i;

/**
 * NFKC → 小文字 → 括弧内除去 → 記号/空白除去。
 * 半角カナや全角英数は NFKC で吸収される。
 * @param {string} s
 * @returns {string}
 */
export function norm(s) {
  return String(s || '')
    .normalize('NFKC')
    .toLowerCase()
    .replace(/[（(\[【].*?[)）\]】]/g, '')
    .replace(/[\s　]/g, '')
    .replace(/[!-/:-@[-`{-~、。・！？「」『』…～－ー―‐]/g, '');
}

/** 行頭の曲番号（`1.` `12)` `3、`）を落とす */
export function stripTrackNo(s) {
  return String(s || '').replace(/^\s*\d{1,3}\s*[.．、)）:：]\s*/, '');
}

/**
 * "1:02:03" / "12:34" → 秒。
 * 分・秒が60以上の打ち間違い（4:60:04 など）は無効として null を返す。
 * @param {string} t
 * @returns {number|null}
 */
export function toSeconds(t) {
  const parts = String(t || '').split(':').map(Number);
  if (parts.some((n) => !Number.isFinite(n))) return null;
  if (parts.length === 3) {
    if (parts[1] >= 60 || parts[2] >= 60) return null;
    return parts[0] * 3600 + parts[1] * 60 + parts[2];
  }
  if (parts.length === 2) {
    if (parts[1] >= 60) return null;
    return parts[0] * 60 + parts[1];
  }
  return null;
}

/** 秒 → 表示用の時刻（1時間未満は m:ss） */
export function formatSeconds(sec) {
  if (sec == null || sec === '') return '';
  const total = Math.floor(Number(sec));
  if (!Number.isFinite(total) || total < 0) return '';
  const h = Math.floor(total / 3600);
  const m = Math.floor(total / 60) % 60;
  const s = total % 60;
  const pad = (n) => String(n).padStart(2, '0');
  return h > 0 ? `${h}:${pad(m)}:${pad(s)}` : `${m}:${pad(s)}`;
}

/**
 * 固定コメントを { seconds, segments, raw } の候補列にする。
 *
 * 書式はチャンネルや時期でまちまち（時刻が前にも後ろにも来る）なので、
 * 「行から時刻だけを除いた残り全部」を候補にし、`/` 等で分割した断片も候補に加える。
 * 行の先頭の時刻を開始時刻とみなす。
 *
 * @param {string} comment
 * @returns {{seconds:number, segments:string[], raw:string}[]}
 */
export function parseCandidates(comment) {
  const out = [];
  for (const line of String(comment || '').split(/\r?\n/)) {
    const trimmed = line.trim();
    if (!trimmed || HEADER_RE.test(trimmed)) continue;

    const matches = [...trimmed.matchAll(TS_RE)];
    if (!matches.length) continue;
    const seconds = toSeconds(matches[0][1]);
    if (seconds == null) continue;                       // 打ち間違いの時刻

    const rest = trimmed.replace(TS_RE, ' ');            // 時刻を抜いた残り全部
    const head = stripTrackNo(rest.trim());
    if (NON_SONG_RE.test(head)) continue;                // 「声入り」「あくび1」など

    const segments = [rest, ...rest.split(/[/／◇|｜]+/)]
      .map((part) => norm(stripTrackNo(part.trim())))
      .filter(Boolean);
    if (!segments.length) continue;                      // [雑談] などは空になる

    out.push({ seconds, segments, raw: trimmed });
  }
  return out.sort((a, b) => a.seconds - b.seconds);
}

/**
 * セットリストに開始秒を割り当てる。
 *
 * @param {{title:string, artist?:string}[]} songs セットリスト（position 昇順）
 * @param {string} comment 固定コメント全文
 * @returns {{seconds:number|null, how:string|null, raw:string|null}[]} songs と同じ長さ
 */
export function matchSetlist(songs, comment) {
  const list = Array.isArray(songs) ? songs : [];
  const cands = parseCandidates(comment);
  const result = list.map(() => ({ seconds: null, how: null, raw: null }));
  const used = new Set();

  const nTitle = list.map((s) => norm(s?.title));
  const nArtist = list.map((s) => norm(s?.artist));
  const take = (i, c, how) => {
    result[i] = { seconds: cands[c].seconds, how, raw: cands[c].raw };
    used.add(c);
  };

  // 1) 曲名完全一致 かつ アーティスト一致
  for (let i = 0; i < list.length; i++) {
    if (!nTitle[i]) continue;
    for (let c = 0; c < cands.length; c++) {
      if (used.has(c)) continue;
      const segs = cands[c].segments;
      if (segs.includes(nTitle[i]) && nArtist[i] && segs.includes(nArtist[i])) { take(i, c, '曲名一致'); break; }
    }
  }
  // 2) 曲名完全一致
  for (let i = 0; i < list.length; i++) {
    if (result[i].seconds != null || !nTitle[i]) continue;
    for (let c = 0; c < cands.length; c++) {
      if (used.has(c)) continue;
      if (cands[c].segments.includes(nTitle[i])) { take(i, c, '曲名一致'); break; }
    }
  }
  // 3) 部分一致（3文字以上かつ長さ比50%以上）
  for (let i = 0; i < list.length; i++) {
    if (result[i].seconds != null || !nTitle[i] || nTitle[i].length < 3) continue;
    for (let c = 0; c < cands.length; c++) {
      if (used.has(c)) continue;
      const ok = cands[c].segments.some((seg) => {
        if (seg.length < 3) return false;
        const [long, short] = seg.length >= nTitle[i].length ? [seg, nTitle[i]] : [nTitle[i], seg];
        return long.includes(short) && short.length / long.length >= 0.5;
      });
      if (ok) { take(i, c, '部分一致'); break; }
    }
  }
  // 4) 残りを並び順で補完（前後に確定済みがある区間のみ）
  const indexOfSeconds = (sec) => cands.findIndex((c) => c.seconds === sec);
  for (let i = 0; i < list.length; i++) {
    if (result[i].seconds != null) continue;
    let lo = -1;
    let hi = cands.length;
    for (let k = i - 1; k >= 0; k--) if (result[k].seconds != null) { lo = indexOfSeconds(result[k].seconds); break; }
    for (let k = i + 1; k < list.length; k++) if (result[k].seconds != null) { hi = indexOfSeconds(result[k].seconds); break; }
    for (let c = lo + 1; c < hi; c++) {
      if (used.has(c)) continue;
      take(i, c, '並び順');
      break;
    }
  }

  return result;
}

/**
 * 割り当て結果の点検。セトリ順に時刻が単調増加しているかを見る。
 * 逆転はコメントの誤記か照合ミスの目印になる。
 *
 * @param {{seconds:number|null}[]} matched
 * @returns {{index:number, prevIndex:number}[]}
 */
export function findInversions(matched) {
  const out = [];
  let prevIndex = -1;
  for (let i = 0; i < matched.length; i++) {
    if (matched[i]?.seconds == null) continue;
    if (prevIndex >= 0 && matched[i].seconds < matched[prevIndex].seconds) {
      out.push({ index: i, prevIndex });
    }
    prevIndex = i;
  }
  return out;
}
