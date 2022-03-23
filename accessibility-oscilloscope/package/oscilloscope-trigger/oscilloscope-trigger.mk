################################################################################
#
# oscilloscope-trigger
#
################################################################################

OSCILLOSCOPE_TRIGGER_VERSION = v0.0.1
OSCILLOSCOPE_TRIGGER_SOURCE = $(OSCILLOSCOPE_TRIGGER_VERSION).tar.gz
OSCILLOSCOPE_TRIGGER_SITE = https://github.com/accessibility-oscilloscope/oscilloscope-trigger/archive/refs/tags

define OSCILLOSCOPE_TRIGGER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) oscilloscope-trigger
endef

define OSCILLOSCOPE_TRIGGER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/oscilloscope-trigger $(TARGET_DIR)/usr/bin/oscilloscope-trigger
endef

$(eval $(generic-package))
