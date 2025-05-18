# LaTeX ビルド用の Makefile
# $(TEX_DIR)/Dockerfile を元にイメージ syoch/texlive を作成する
# ユーティリティとして dkr_latex を定義する
# このコマンドは LaTeX のコンテナの中で作業するときに使われるもの

TEX_DIR:=$(dir $(lastword $(MAKEFILE_LIST)))

DKRTexLiveTag:=syoch/texlive

$(TEX_DIR)/marker: $(TEX_DIR)/Dockerfile
	docker build -t $(DKRTexLiveTag) $(TEX_DIR)
	touch $@

DKRTexLive:=docker run -i --rm \
	--mount type=volume,src=ltcache,dst=/usr/local/texlive/2024/texmf-var/luatex-cache \
	-v $(PWD)/$(LATEX_ROOT):/work -w /work $(DKRTexLiveTag)

.PHONY: dkr_latex
dkr_latex: $(TEX_DIR)/marker
	@echo "Running docker latex"
	docker run -it --rm \
		--mount type=volume,src=ltcache,dst=/usr/local/texlive/2024/texmf-var/luatex-cache \
		-v $(PWD)/$(LATEX_ROOT):/work -w /work $(ARGS) $(DKRTexLiveTag)
