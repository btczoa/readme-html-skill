---
name: html-readme-architect
description: Rule.11（HTML-Firstポリシー）に準拠した、Mermaidや外部CDNを一切使わない完全自己完結型・高品質技術仕様書および「README.html」の作成規約・設計標準スキル。モダンなライトモードデザインシステム（CSS Grid/Flexbox + インラインSVGベクター図解）と10標準セクション構成パターンを提供。
---

# html-readme-architect

Rule.11（HTML-Firstポリシー & ネイティブビジュアル標準）に完全準拠した、**完全自己完結型 HTML 技術仕様書・`README.html`** を作成するための専門スキルです。

---

## 1. 核心理念（Core Principles）

1. **Mermaid 構文・外部スクリプトの完全排除 (Zero-CDN / Zero-Script)**
   - Mermaid.js、外部フォントCDN、JavaScriptライブラリに一切依存しない。
   - ブラウザでダブルクリックするだけで、オフライン環境でも即座に100%美しく表示される完全な自己完結性。
2. **Native HTML/CSS & Inline SVG による高精細ビジュアル (Native Visual Standard)**
   - システムアーキテクチャ図、インフラ配置図、コンテナ関係図はすべて **`<svg>` インラインベクター** で描画。
   - 処理パイプラインや状態遷移は **CSS Grid / Flexbox + ステップカード + 接続矢印** で表現。
3. **モダン・ライトモード・デザインシステム (Modern Light-Mode Theme)**
   - 背景は目に優しく知的なスレート調（`#f8fafc`）。
   - コンポーネントは清潔な白カード（`#ffffff`）、繊細なボーダー（`#e2e8f0`）、高コントラストな文字色（`#0f172a`）。
4. **10大標準セクション網羅 (Comprehensive 10-Chapter Structure)**
   - 概要から運用リカバリーまで、開発者・運用者が迷わない均一で高品質なドキュメント構成を保証。

---

## 2. 必須10大標準セクション構成

すべての `README.html` は以下の10章立てで構成します。

| 章番号 | セクション名 | 必須記載内容 | 表現形式 |
|:---:|:---|:---|:---|
| **01** | **Overview & Objectives** (概要・目的) | プロジェクトの存在理由、達成する目的、単一責務のスコープ | テキスト + バッジ群 + サマリーカード |
| **02** | **Architecture Diagrams** (アーキテクチャ構成図) | ① ハイレベル論理相関図<br>② インフラ・コンテナ物理配置図（ポート、ネットワーク） | **インライン SVG ベクター図** (必須) |
| **03** | **Data Processing Flow** (データ処理フロー) | リアルタイム受信、判定ロジック、発注・通知のライフサイクル | ステップカード + SVG接続アロー |
| **04** | **Core Components** (重要コンポーネント) | 主要クラス、モジュール、アダプター、ハンドラーの詳細責務 | CSS Grid 2〜3列カード |
| **05** | **Public APIs / Event Specs** (公開API・イベント仕様) | WebUIの場合はHTTP/SSEエンドポイント一覧表。<br>Workerの場合はRedis Pub/SubやQueueイベント購読仕様 | レスポンシブ仕様テーブル + メソッドバッジ |
| **06** | **External Integrations** (外部連携仕様) | 取引所API（WebSocket/REST）、Redis、Slack Webhook、Deno KV | 連携先別カード + プロトコルタグ |
| **07** | **Configuration & Secrets** (参照データ・環境変数) | `.env` 変数一覧（必須/任意/型/デフォルト値）、KVキー空間設計 | テーブル + コードブロック |
| **08** | **Prerequisites & Run Guide** (前提条件・実行手順) | 動作環境（Deno 2.x, Docker）、ビルド & 起動コマンド | コマンドラインブロック（コピペ可能） |
| **09** | **Constraints & Recovery** (制約事項・運用リカバリー) | レートリミット、DBロック、異常系発生時の再起動・復帰手順 | Notice Box（注意・警告スタイル） |
| **10** | **Related Services** (関連サービス相関) | クラスタ内の他Bot、WebUI、共通ストレージとの関係性 | サービスリンクカード + 相関タグ |

---

## 3. デザインシステム & CSS変数仕様

以下のCSS変数トークンをすべての `README.html` の `:root` に定義します。

```css
:root {
  --bg-base: #f8fafc;        /* 全体背景 (Slate 50) */
  --bg-card: #ffffff;        /* カード背景 (White) */
  --bg-subtle: #f1f5f9;      /* サブ領域・コード背景 (Slate 100) */
  --border-subtle: #e2e8f0;  /* 枠線 (Slate 200) */
  --border-focus: #cbd5e1;   /* 強調枠線 (Slate 300) */
  --text-main: #0f172a;      /* メイン文字 (Slate 900) */
  --text-muted: #475569;     /* 補足文字 (Slate 600) */
  --text-dim: #94a3b8;       /* 控えめ文字 (Slate 400) */
  --accent-blue: #2563eb;    /* プライマリ (Blue 600) */
  --accent-emerald: #059669; /* 成功・取引 (Emerald 600) */
  --accent-amber: #d97706;   /* 警告・監視 (Amber 600) */
  --accent-rose: #e11d48;    /* 停止・重要 (Rose 600) */
  --accent-purple: #7c3aed;  /* 通知・Slack (Purple 600) */
  --shadow-sm: 0 1px 3px rgba(0,0,0,0.05);
  --shadow-md: 0 4px 6px -1px rgba(0,0,0,0.08);
  --font-mono: 'JetBrains Mono', 'Fira Code', 'Courier New', monospace;
}
```

---

## 4. インライン SVG アーキテクチャ図の作成規約

Mermaid を使わずに、美しく保守性の高いSVG図を作成するための設計ルールです。

### Diagram Generation Style Guidelines (Architecture / Infographics)
When generating architecture diagrams, workflow charts, or system visual assets:
1. **Layout**: Adapt the layout flexibly (vertical top-down, horizontal left-to-right, or modular grid) based on system hierarchy, data flow, and readability requirements, using clear directional connectors/arrows.
2. **Aesthetics**: Clean, minimalist vector style with a solid white background. No cluttered elements or excessive gradients.
3. **Color Coding**: Use a harmonious tech palette (vibrant blue, soft purple, fresh green) where each architectural layer has a distinct, consistent color.
4. **Typography & Icons**: Every card must feature a bold, legible title, a smaller secondary description, and a minimalist line-art icon on the left.

### 4.1. `<svg>` ラッパーと viewBox
- `viewBox="0 0 1000 480"` などの比率を固定し、CSSで `width: 100%; height: auto; max-width: 1100px;` を指定して完全レスポンシブ化する。

### 4.2. 標準マーカー定義 (`<defs>`)
線の先端に付ける矢印マーカーを定義：
```html
<defs>
  <marker id="arr-blue" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
    <path d="M 0 1 L 8 5 L 0 9 z" fill="#2563eb" />
  </marker>
  <marker id="arr-emerald" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
    <path d="M 0 1 L 8 5 L 0 9 z" fill="#059669" />
  </marker>
  <marker id="arr-purple" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
    <path d="M 0 1 L 8 5 L 0 9 z" fill="#7c3aed" />
  </marker>
</defs>
```

### 4.3. ノード・コンテナ表現
- **コンテナ / ホスト枠**: `<rect rx="12" fill="#f8fafc" stroke="#cbd5e1" stroke-width="1.5" />`
- **サービスカード**: `<rect rx="8" fill="#ffffff" stroke="#e2e8f0" stroke-width="1.5" />`
- **テキスト配置**: `<text text-anchor="middle" font-size="11" font-weight="bold" fill="#0f172a">`
- **コネクタ線**: `<line stroke="#2563eb" stroke-width="2" marker-end="url(#arr-blue)" />`

---

## 5. UIコンポーネント・スニペット

### 5.1. バッジ（Badge）
```html
<span class="badge badge-blue">Deno 2.1</span>
<span class="badge badge-emerald">Worker Daemon</span>
<span class="badge badge-purple">Zero Secret</span>
```
```css
.badge {
  display: inline-block;
  padding: 0.25rem 0.65rem;
  border-radius: 9999px;
  font-size: 0.75rem;
  font-weight: 700;
  text-transform: uppercase;
}
.badge-blue { background: #dbeafe; color: #1e40af; }
.badge-emerald { background: #d1fae5; color: #065f46; }
.badge-purple { background: #ede9fe; color: #5b21b6; }
```

### 5.2. Notice Box（注意・警告・リカバリー案内）
```html
<div class="notice-box notice-info">
  <strong>💡 運用のポイント:</strong> 本サービスは秘密鍵を保持しないゼロシークレット設計です。
</div>
```
```css
.notice-box {
  padding: 1rem 1.25rem;
  border-radius: 6px;
  margin: 1.25rem 0;
  font-size: 0.92rem;
  line-height: 1.6;
}
.notice-info { background: #eff6ff; border-left: 4px solid #2563eb; color: #1e3a8a; }
.notice-warning { background: #fffbeb; border-left: 4px solid #d97706; color: #78350f; }
```

### 5.3. テーブル（仕様表・環境変数一覧）
```html
<div class="table-container">
  <table>
    <thead>
      <tr>
        <th>環境変数名</th>
        <th>型 / 既定値</th>
        <th>必須</th>
        <th>説明</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>PORT</code></td>
        <td><code>number (8007)</code></td>
        <td>任意</td>
        <td>WebUI HTTP待受ポート番号</td>
      </tr>
    </tbody>
  </table>
</div>
```

---

## 6. HTML-README 作成手順チェックリスト

1. [ ] **ゼロ外部依存確認**: `<script src="...">` や Google Fonts、Mermaid CDN が含まれていないこと。
2. [ ] **デザイン整合性**: ライトモードカラーパレット（Slate/White/高コントラスト）が統一されていること。
3. [ ] **10セクション網羅**: 01 Overview 〜 10 Related Services まで全て存在すること。
4. [ ] **SVGアーキテクチャ図**: ハイレベル論理図とインフラレベル図がインラインSVGで崩れなく描画されていること。
5. [ ] **コードブロック**: Dockerビルド・起動コマンドが正確にコピー＆ペースト可能な形式になっていること。
6. [ ] **モバイル / レスポンシブ**: 画面幅縮小時にもSVGがはみ出さず、テーブルが水平スクロール可能になっていること。
