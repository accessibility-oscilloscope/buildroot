################################################################################
#
# drv2605-clean
#
################################################################################

DRV2605_CLEAN_VERSION = v0.3
DRV2605_CLEAN_SOURCE = $(DRV2605_CLEAN_VERSION).tar.gz
DRV2605_CLEAN_SITE = https://github.com/accessibility-oscilloscope/drv2605-clean/archive/refs/tags/

define DRV2605_CLEAN_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) haptic-driver
endef

define DRV2605_CLEAN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/haptic-driver $(TARGET_DIR)/usr/bin/haptic-driver
endef

$(eval $(generic-package))
