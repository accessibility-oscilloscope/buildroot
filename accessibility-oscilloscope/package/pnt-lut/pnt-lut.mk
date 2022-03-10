################################################################################
#
# pnt-lut
#
################################################################################

PNT_LUT_VERSION = v0.0.6
PNT_LUT_SOURCE = $(PNT_LUT_VERSION).tar.gz
PNT_LUT_SITE = https://github.com/accessibility-oscilloscope/pnt-lut/archive/refs/tags

define PNT_LUT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) pnt-lut
endef

define PNT_LUT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/pnt-lut $(TARGET_DIR)/usr/bin/pnt-lut
endef

$(eval $(generic-package))
