$(RES_DIST)/%.pdf: $(RES_SRC)/%.pdf
	@echo "Converting $< to $@"
	@cp $< $@

RC_TARGETS+=$(patsubst $(RES_SRC)/%.pdf,$(RES_DIST)/%.pdf,$(wildcard $(RES_SRC)/*.pdf))
