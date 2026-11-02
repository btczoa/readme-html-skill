# html-readme-architect-skill

`html-readme-architect` スキルを別 PC やチーム環境に `npx skills add` で 1 コマンド導入するための配布用 Git リポジトリです。

---

## 概要

Rule.11（HTML-Firstポリシー & ネイティブビジュアル標準）に完全準拠した、**完全自己完結型 HTML 技術仕様書・`README.html`** を作成するための専門スキルです。

* **Zero-CDN / Zero-Script**: Mermaid.js や外部スクリプト、フォントCDNに依存しない完全なオフライン稼働保証。
* **Native Visual Standard**: インライン SVG ベクターと CSS Grid/Flexbox によるモダンな図解・パイプライン表現。
* **Modern Light-Mode Theme**: 知的で清潔感のあるスレート基調のデザインシステム。
* **10大標準セクション網羅**: Overview から Recovery まで均一で高品質な技術文書を構築。

---

## インストール方法

### 1. GitHub リポジトリから直接インストール
```bash
npx skills add <GITHUB_USER>/<REPO_NAME>
```

または明示的にスキル名を指定する場合：
```bash
npx skills add <GITHUB_USER>/<REPO_NAME> --skill html-readme-architect
```

### 2. ローカル環境からの検証・追加
```bash
npx skills add ./path/to/html-readme-architect-skill
```

---

## インストール後の確認

```bash
# スキル一覧の確認
npx skills list

# スキルの実行確認
npx skills run html-readme-architect
```

---

## ディレクトリ構成

```text
html-readme-architect-skill/
├── README.md
├── skill.json                     # スキル定義マニフェスト
├── SKILL.md                       # ルート定義
└── skills/
    └── html-readme-architect/     # スキル本体
        └── SKILL.md               # スキル仕様・プロンプト定義（CSSトークン、SVG規約、10大セクション構成等）
```
