$(RES_DIST)/%.png: $(RES_SRC)/%.jpg
	@echo "Converting $< to $@"
	convert $< $@

RC_TARGETS+=$(patsubst $(RES_SRC)/%.jpg,$(RES_DIST)/%.png,$(wildcard $(RES_SRC)/*.jpg))
