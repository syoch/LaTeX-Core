$(RES_DIST)/%.png: $(RES_SRC)/%.bmp
	@echo "Converting $< to $@"
	convert $< $@

BMP_RESOURCES1:=$(wildcard $(RES_SRC)/*.bmp)
RC_TARGETS+=$(patsubst $(RES_SRC)/%.bmp,$(RES_DIST)/%.png,$(BMP_RESOURCES1))

$(RES_DIST)/%.png: $(RES_SRC)/%.BMP
	@echo "Converting $< to $@"
	convert $< $@

BMP_RESOURCES2:=$(wildcard $(RES_SRC)/*.BMP)
RC_TARGETS+=$(patsubst $(RES_SRC)/%.BMP,$(RES_DIST)/%.png,$(BMP_RESOURCES2))
