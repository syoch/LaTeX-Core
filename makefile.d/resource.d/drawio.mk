DKRDrawioTag:=rlespinasse/drawio-desktop-headless
DKRDrawio:=docker run --rm -v $(PWD):/work -w /work $(DKRDrawioTag)

$(RES_DIST)/%.pdf: $(RES_SRC)/%.drawio
	@echo "Converting $< to $@"
	@$(DKRDrawio) --crop -xf pdf -o $@ $<

RC_TARGETS+=$(patsubst $(RES_SRC)/%.drawio,$(RES_DIST)/%.pdf,$(wildcard $(RES_SRC)/*.drawio))
