$(PROJECT)/data/%/table.tex: $(PROJECT)/data/%/table.csv
	@echo "Converting $< to $@"
	python3 $(RES_MK_ROOT)/csv_to_tex.py $< $@

CSV_RESOURCES:=$(shell find $(PROJECT)/data -name "*.csv")
RC_TARGETS+=$(CSV_RESOURCES:.csv=.tex)
