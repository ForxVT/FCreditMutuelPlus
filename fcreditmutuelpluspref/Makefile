TARGET := iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FCreditMutuelPlusPref

FCreditMutuelPlusPref_FILES = $(wildcard *.x *.m)
FCreditMutuelPlusPref_FRAMEWORKS = UIKit
FCreditMutuelPlusPref_PRIVATE_FRAMEWORKS = Preferences
FCreditMutuelPlusPref_INSTALL_PATH = /Library/PreferenceBundles
FCreditMutuelPlusPref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
