/**
 * @module domain/song-request/song-request
 * @description 楽曲リクエストのエンティティ。
 */

export class SongRequest {
  /**
   * @param {object} props
   * @param {number|null} props.id
   * @param {string} props.title
   * @param {string} [props.artist]
   * @param {string|null} [props.url]
   * @param {string|null} [props.requesterName]
   * @param {string} [props.status] - singable | practicing | unregistered
   * @param {number} [props.voteCount]
   * @param {string} props.createdAt
   * @param {string} props.updatedAt
   */
  constructor({
    id,
    title,
    artist = '',
    url = null,
    requesterName = null,
    status = 'unregistered',
    voteCount = 0,
    createdAt,
    updatedAt,
  }) {
    this.id = id ?? null;
    this.title = title;
    this.artist = artist || '';
    this.url = url || null;
    this.requesterName = requesterName || null;
    this.status = status;
    this.voteCount = Number(voteCount || 0);
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }
}
