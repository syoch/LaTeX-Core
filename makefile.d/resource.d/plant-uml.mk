.PHONY: plantuml-server
plantuml-server:
	curl http://localhost:8080 || docker run -d --rm -p 8080:8080 plantuml/plantuml-server:jetty
ENV_TESTS+=plantuml-server

$(RES_DIST)/%.png: $(RES_SRC)/%.pu
	@mkdir -p $(@D)
	@echo "Converting $< to $@"
	@$(RES_MK_ROOT)/render-plant-uml.sh $< > $@

RC_TARGETS+=$(patsubst $(RES_SRC)/%.pu,$(RES_DIST)/%.png,$(wildcard $(RES_SRC)/*.pu))
