TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FCreditMutuelPlus

FCreditMutuelPlus_FILES = $(wildcard *.x *.m)
FCreditMutuelPlus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += fcreditmutuelpluspref
include $(THEOS_MAKE_PATH)/aggregate.mk