# Project 構造

この環境でのレポートフォルダの構造

## ルート

- (Optional) Makefile: レポート固有の Makefile
  - ここで .c をビルドしたり画像を自動生成したりできる
- (Artifact) .gitignore: 生成物のリストが書き込まれるファイル 基本無視

## ルート/data/(name: 任意の文字列) (表)
[table](./table.md): を参照

## ルート/data/(name: 任意の文字列) (グラフ)
- (Required) commands.gplot: GNU Plot スクリプト
  - ファイル生成先の指定は不要 (ビルドシステム側で指定される)
  - 出力先は: `main/resources/(name).pdf` になる
  - LaTeX での読み込みは `\includegraphics{resources/(name).pdf}` で行う

## ルート/main: LaTeX ソース
- (Required) template.tex: ソースコード
- (Artifact) template.pdf: 生成されたソースコード

## ルート/resources
このディレクトリ配下のファイルは pdf または png に変換されて `main/resources` にコピーされる
- .bmp: png に変換してコピー
- .BMP: png に変換してコピー
- .jpg: png に変換してコピー
- .png: そのままコピー
- .drawio: PDF に変換してコピー
- .pu: PlantUML として解釈して PNG に変換してコピー
