RES_MK_ROOT := $(dir $(lastword $(MAKEFILE_LIST)))

include $(dir $(lastword $(MAKEFILE_LIST)))/bmp.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/drawio.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/graph.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/jpg.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/plant-uml.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/png.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/pdf.mk
include $(dir $(lastword $(MAKEFILE_LIST)))/table.mk
