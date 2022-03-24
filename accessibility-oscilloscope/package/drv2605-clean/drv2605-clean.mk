################################################################################
#
# drv2605-clean
#
################################################################################

DRV2605_CLEAN_VERSION = v0.5
DRV2605_CLEAN_SOURCE = $(DRV2605_CLEAN_VERSION).tar.gz
DRV2605_CLEAN_SITE = https://github.com/accessibility-oscilloscope/drv2605-clean/archive/refs/tags

DRV2605_CLEAN_BIN = haptic-driver

define DRV2605_CLEAN_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(DRV2605_CLEAN_BIN)
endef

define DRV2605_CLEAN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(DRV2605_CLEAN_BIN) $(TARGET_DIR)/usr/bin/$(DRV2605_CLEAN_BIN)-$(DRV2605_CLEAN_VERSION)
	ln -f $(TARGET_DIR)/usr/bin/$(DRV2605_CLEAN_BIN)-$(DRV2605_CLEAN_VERSION) $(TARGET_DIR)/usr/bin/$(DRV2605_CLEAN_BIN)
endef

$(eval $(generic-package))
