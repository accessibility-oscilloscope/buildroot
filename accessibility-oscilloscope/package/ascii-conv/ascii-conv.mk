################################################################################
#
# ascii-conv
#
################################################################################

ASCII_CONV_VERSION = v0.0.3
ASCII_CONV_SOURCE = $(ASCII_CONV_VERSION).tar.gz
ASCII_CONV_SITE = https://github.com/accessibility-oscilloscope/ascii-conv/archive/refs/tags

ASCII_CONV_BIN = ascii-conv

define ASCII_CONV_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(ASCII_CONV_BIN)
endef

define ASCII_CONV_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(ASCII_CONV_BIN) $(TARGET_DIR)/usr/bin/$(ASCII_CONV_BIN)-$(ASCII_CONV_VERSION)
	ln -f $(TARGET_DIR)/usr/bin/$(ASCII_CONV_BIN)-$(ASCII_CONV_VERSION) $(TARGET_DIR)/usr/bin/$(ASCII_CONV_BIN)
endef

$(eval $(generic-package))
