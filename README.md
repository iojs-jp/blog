http://blog.iojs.jp
===================

blog.iojs.jp の静的ページジェネレータ

# 更新の手順

## submodule の更新

```
% npm run update
```

## metadata の更新

`src/metadata.cson` に iojs-ja の `weekly` 以下の Markdown についてのメタデータを保持しているのでこれを更新します。

`metadata.cson` の1記事の構造:

```cson
'ファイル名':
  title: '表示するタイトル'
  description: '概要'
  pubDate: '翻訳元記事の公開日'
```

例:

```cson
'2015-02-13':
  title: 'io.jsウィークリーアップデート 2015/2/13'
  description: '29言語へのローカリゼーション、バージョン1.2.0リリース 他'
  pubDate: '2015-02-13'
```

## トップページの情報更新

io.js の Medium に倣って most recommended/latest という構成になっているので Medium と同じ構成になるように `src/index.cson` を更新します。

`index.cson` の構造:

```cson
headline: 'metadata の key'
contents: [
  'metadata の key'
]
```

例:

```cson
headline: 'io.js_and_node.js_Foundation'
contents: [
  '2015-02-13'
  '2015-02-06'
]
```

## Pull Request

これらの更新を含めた Pull Request を作成します。

## デプロイ

*TODO*

# メンバー

* Takaya Kobayashi (http://jgs.me, [@e-jigsaw](http://github.com/e-jigsaw))
* Yosuke Furukawa ([@yosuke-furukawa](https://github.com/yosuke-furukawa))

# ライセンス

[MIT ライセンス](https://tldrlegal.com/license/mit-license)
