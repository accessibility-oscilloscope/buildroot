################################################################################
#
# signal-processing
#
################################################################################

SIGNAL_PROCESSING_VERSION = v0.0.1
SIGNAL_PROCESSING_SOURCE = $(SIGNAL_PROCESSING_VERSION).tar.gz
SIGNAL_PROCESSING_SITE = https://github.com/accessibility-oscilloscope/signal-processing/archive/refs/tags

define SIGNAL_PROCESSING_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) signal-processing
endef

define SIGNAL_PROCESSING_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/signal-processing $(TARGET_DIR)/usr/bin/signal-processing
endef

$(eval $(generic-package))
