################################################################################
#
# ascii-conv
#
################################################################################

ASCII_CONV_VERSION = v0.0.1
ASCII_CONV_SOURCE = $(ASCII_CONV_VERSION).tar.gz
ASCII_CONV_SITE = https://github.com/accessibility-oscilloscope/ascii-conv/archive/tags

define ASCII_CONV_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) ascii-conv
endef

define ASCII_CONV_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/ascii-conv $(TARGET_DIR)/usr/bin/ascii-conv
endef

$(eval $(generic-package))