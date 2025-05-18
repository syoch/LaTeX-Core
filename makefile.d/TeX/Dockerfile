FROM paperist/texlive-ja:latest

RUN apt update && \
    apt install -y ghostscript && \
    rm -rf /var/lib/apt

# ここに sty ファイルの追加処理を書く
ADD luacode.sty /usr/local/texlive/2025/texmf-dist/tex/lualatex/luacode/luacode.sty

# ここまで

RUN mktexlsr /usr/local/texlive/2025/texmf-dist
