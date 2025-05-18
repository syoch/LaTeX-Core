# Makefile のエントリポイント
# preprocess: フォルダ構造/環境の検証
# test: 環境テストの実行
# entry: LaTeX ビルドの実行
#   必要に応じて $(RC_TARGETS) を実行
#   また， SKIP_LATEX = 1 の場合は LaTeX ビルドをスキップ
# clean: ビルド成果物の削除

LATEX_ROOT?=$(PROJECT)/main
RES_SRC:=$(PROJECT)/resources
RES_DIST:=$(LATEX_ROOT)/resources

entry_: entry

MAKE_ROOT := $(dir $(lastword $(MAKEFILE_LIST)))

include $(MAKE_ROOT)/TeX/all.mk
include $(MAKE_ROOT)/resource.d/all.mk

# Latex
$(LATEX_ROOT)/template.pdf: $(TEX_DIR)/marker $(LATEX_ROOT)/template.tex
	$(DKRTexLive) lualatex template.tex

preprocess:
	@[ "$(LATEX_DOCKER_ENV)" = "1" ] || { \
		echo "Please run this Makefile in a docker container"; \
		exit 1; \
	}

	@if [ ! -d $(LATEX_ROOT) ]; then \
		echo "Please specify the valid path to the latex root directory"; \
		exit 1; \
	fi

	@if [ -f $(PROJECT)/Makefile ]; then \
		echo "Executing $(PROJECT)/Makefile"; \
		$(MAKE) -C $(PROJECT); \
	fi

	mkdir -p $(RES_SRC) $(RES_DIST)

test: preprocess $(ENV_TESTS)

ifeq ($(SKIP_LATEX),1)
entry: test $(RC_TARGETS)
else
ifeq ($(FORCE_LATEX),1)
entry: force_latex test $(RC_TARGETS) $(LATEX_ROOT)/template.pdf
else
entry: test $(RC_TARGETS) $(LATEX_ROOT)/template.pdf
endif
endif

clean:
	@rm -rf $(RES_DIST)
	@rm -f $(LATEX_ROOT)/*.aux $(LATEX_ROOT)/*.log $(LATEX_ROOT)/*.pdf
	@if [ -f $(PROJECT)/Makefile ]; then \
	  echo "Executing $(PROJECT)/Makefile clean"; \
		$(MAKE) -C $(PROJECT) clean; \
	fi

.PHONY: force_latex
force_latex:
	touch $(LATEX_ROOT)/template.tex
