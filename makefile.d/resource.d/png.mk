$(RES_DIST)/%.png: $(RES_SRC)/%.png
	@echo "Converting $< to $@"
	@cp $< $@

RC_TARGETS+=$(patsubst $(RES_SRC)/%.png,$(RES_DIST)/%.png,$(wildcard $(RES_SRC)/*.png))
