$(RES_DIST)/%.pdf: $(PROJECT)/data/%/commands.gplot $(wildcard %/*.plot) $(wildcard %/*.csv)
	cd $(<D) && gnuplot -e "set terminal pdf; set output \"$(PWD)/$@\"" commands.gplot

GP_SCRIPTS:=$(shell find $(PROJECT)/data -name "commands.gplot")
RC_TARGETS+=$(patsubst $(PROJECT)/data/%/commands.gplot,$(RES_DIST)/%.pdf,$(GP_SCRIPTS))