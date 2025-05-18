# resource.d

## (既知) PROJECT
include 元で定義されることが前提
プロジェクトのルートへのパス

## RC_TARGETS 変数
リソースビルドのターゲットリスト
template.pdf の前提ターゲットに追加される

## ファイル
- `all.mk`
- `drawio.mk`
- `pdf.mk`
- `plant-uml.mk`
- `bmp.mk`, `jpg.mk`, `png.mk`: 画像系の変換スクリプト
- `graph.mk`, `table.mk`: 表, グラフを作るやつ