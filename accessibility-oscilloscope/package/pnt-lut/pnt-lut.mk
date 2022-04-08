################################################################################
#
# pnt-lut
#
################################################################################

PNT_LUT_VERSION = sigint-test
PNT_LUT_SOURCE = $(PNT_LUT_VERSION).tar.gz
PNT_LUT_SITE = https://github.com/accessibility-oscilloscope/pnt-lut/archive/refs/tags

PNT_LUT_BIN = pnt-lut

define PNT_LUT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(PNT_LUT_BIN)
endef

define PNT_LUT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(PNT_LUT_BIN) $(TARGET_DIR)/usr/bin/$(PNT_LUT_BIN)-$(PNT_LUT_VERSION)
	ln -f $(TARGET_DIR)/usr/bin/$(PNT_LUT_BIN)-$(PNT_LUT_VERSION) $(TARGET_DIR)/usr/bin/$(PNT_LUT_BIN)
endef

$(eval $(generic-package))
