# 歌唱データベース

Vtuberさんの歌枠データを、曲リスト・ランキング・タイムライン・ジャンル検索として公開するためのファンメイド歌唱データベースです。キー情報は任意で、設定から表示をオン/オフできます。

このリポジトリは公開テンプレート用に、架空のサンプルデータとプレースホルダー設定を入れています。実際のVtuberさん向けに移植する場合は、まず [VTUBER_SETUP.md](VTUBER_SETUP.md) を見てください。

## 構成

```text
docs/
  Cloudflare Pagesで公開するフロントエンド

functions/api/data.js
  Cloudflare Pages Functions。動的API運用にする場合、D1から公開JSONを返す

functions/api/admin/
  管理API。docs/admin.html から呼ばれ、ADMIN_TOKENで保護する

d1/
  D1用の追加SQL

supabase/
  旧Supabase運用で使っていたスキーマと確認SQL

tools/
  Spreadsheet取り込みや補助ツール
```

## 推奨運用

D1を編集元データベースとして使い、公開サイトは `docs/data/*.json` の静的JSONを読む運用を標準にしています。

この構成が一番シンプルです。

```text
管理ページ(/admin.html)でD1を編集
  ↓
静的JSONを生成
  ↓
docs/data/*.json をGitHubへpush
  ↓
Cloudflare Pagesで公開
```

公開サイトはまず `docs/data/*.json` を読みます。静的JSONが読めない場合だけ `/api/data` へフォールバックします。

運用の選び方:

| 運用 | おすすめ度 | 特徴 |
| --- | --- | --- |
| 静的JSON運用 | 標準 | Pagesだけで表示できる。公開側のD1 bindingがなくても動く |
| 動的API運用 | 任意 | `/api/data` がD1を直接読む。PagesのD1 binding `DB` が必要 |

普段の更新手順:

1. 歌枠追加や曲メタデータ編集は公開サイトの `/admin.html` で行う
2. リアルライブ情報も同じ管理ページの「リアルライブ情報」から追加する
3. 管理ページの「静的JSONを生成」で `docs/data/*.json` を更新する
4. 変更をGitへpushする
5. Cloudflare Pagesの自動デプロイで公開サイトへ反映する

```text
https://your-site.example/admin.html
```

管理ページを開くには、Cloudflare Pagesの環境変数 `ADMIN_TOKEN` を設定し、ページ上部でそのトークンを入力します。

`ADMIN_TOKEN` が未設定の場合、管理APIは `503 ADMIN_TOKEN is not configured` を返して操作を受け付けません。設定し忘れたまま公開して、誰でも編集・削除できる状態になるのを防ぐためです。

## GitHubで公開する場合

このリポジトリは公開テンプレートとして使えるよう、実データ・実トークンを含まないサンプル状態にしています。

公開前に確認すること:

```text
ADMIN_TOKEN やAPI tokenがGitに入っていない
*.har や *.log がGitに入っていない
docs/data/*.json が公開してよいデータだけになっている
docs/js/config.js がサンプル値または公開してよい値になっている
スクリーンショットにメールアドレス、実URL、tokenが写っていない
```

GitHubへ置く基本手順:

```powershell
git status
git add .
git commit -m "Prepare public songlist template"
git push
```

`.env`、Cloudflare API token、Supabase secret key、管理画面の `ADMIN_TOKEN` はGitHubへpushしません。Cloudflare PagesとGitHub repositoryを接続すると、`main` ブランチへpushしたタイミングで自動デプロイできます。

GitHub連携とPages設定の詳しい手順は [INFRA_SETUP.md](INFRA_SETUP.md) の「GitHub」も見てください。

## 初期セットアップ

Cloudflare D1 Consoleで以下を実行します。

1. `d1/schema.sql`
2. `d1/generated/songlist_seed.sql`

`songlist_seed.sql` は、リストCSVのB列を曲名、D列をアーティスト名として生成します。E列の歌唱回数は `song_channel_stats` に入ります。
ジャンルは初期SQLでは入れず、管理画面から後でCSV同期します。CSVの例は `d1/genre_import_template.csv` です。

```powershell
npm run d1:seed-sql
```

動的API運用も使う場合、Cloudflare PagesではD1 binding名を `DB` にしてください。公開APIは `env.DB` を参照します。

静的JSON運用だけなら、公開サイトの表示自体は `docs/data/*.json` で完結します。ただし `/api/data` と `/api/d1-test` を使ってD1接続確認もしたい場合は、D1 bindingを設定します。

管理ページを使うには、Cloudflare Pagesの環境変数に管理用パスワードを設定します。

```text
ADMIN_TOKEN=replace_with_private_admin_password
```

このトークンはGitへcommitしません。Cloudflare Pagesの Settings → Environment variables で設定します。

Cloudflare Pages、D1、API token、Supabase旧運用の細かい設定は [INFRA_SETUP.md](INFRA_SETUP.md) にまとめています。

設定中に詰まってChatGPTやGeminiなどへ相談する場合は、秘密情報を貼らずに使える [AI_HELP_PROMPTS.md](AI_HELP_PROMPTS.md) のテンプレートを使ってください。

## 確認方法

公開後、以下を確認します。

```text
https://your-site.example/api/d1-test
https://your-site.example/api/data
https://your-site.example/admin.html
```

画面で見る項目:

```text
チャンネル切替が動く
ランキングが表示される
全曲リスト検索が動く
タイムラインが表示される
ライブ情報が表示される
アナリティクスのグラフが表示される
管理ページの曲数・歌枠数・最新日付が期待通り
```

## APIキャッシュ

`/api/data` はCloudflare側で最大約1分キャッシュします。D1更新直後は、サイト表示に少し遅れが出ることがあります。

キャッシュ時間は [functions/api/data.js](functions/api/data.js) の `CACHE_SECONDS` で調整できます。

## 他Vtuber向けに変える場所

まず [docs/js/config.js](docs/js/config.js) を編集します。

```text
SITE.creatorName
SITE.baseUrl
SITE.officialLinks
SHEET_ID
CHANNELS
ORIGINAL_GENRE_KEYWORDS
```

管理ページ用の `ADMIN_TOKEN` と `ORIGINAL_GENRE_KEYWORDS` は、Cloudflare Pagesの環境変数で設定します。

Cloudflare Pagesにも、必要なら環境変数 `ORIGINAL_GENRE_KEYWORDS` を設定します。値はカンマ区切りです。

詳細なチェックリストは [VTUBER_SETUP.md](VTUBER_SETUP.md) にあります。

## Spreadsheetから移行する場合

既存のSpreadsheet取り込みツールは、環境変数でSpreadsheet ID/GIDを差し替えられます。

```powershell
$env:SONGLIST_SPREADSHEET_ID="your_spreadsheet_id"
$env:SONGLIST_NEW_LIST_GID="0"
$env:SONGLIST_NEW_SETLIST_GID="123456789"
$env:SONGLIST_OLD_LIST_GID="987654321"
$env:SONGLIST_OLD_SETLIST_GID="234567890"
```

旧Supabase運用を使う場合のみ、次の環境変数も設定します。

```powershell
$env:SUPABASE_URL="https://your-project.supabase.co"
$env:SUPABASE_SECRET_KEY="sb_secret_..."
python tools\import_supabase.py
```

削除も反映する完全再インポート:

```powershell
python tools\import_supabase.py --reset
```

## 秘密情報の運用

Cloudflare API token、D1 database ID、Supabase secret key、`ADMIN_TOKEN` は公開しません。

チャット、ログ、GitHub、公開HTMLに出してしまった場合は、CloudflareまたはSupabaseのDashboardで該当キーを削除し、新しいキーへ差し替えます。
