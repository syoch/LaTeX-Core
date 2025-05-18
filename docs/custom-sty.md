# スタイルファイルを追加する方法

1. makefile.d/TeX 配下に .sty ファイルを配置
2. `makefile.d/TeX/Dockerfile` 内にコメントに従って以下のような行をついか
```dockerfile
ADD luacode.sty /usr/local/texlive/2025/texmf-dist/tex/lualatex/luacode/luacode.sty
```

次回ビルドから追加した sty ファイルが使えるようになる
