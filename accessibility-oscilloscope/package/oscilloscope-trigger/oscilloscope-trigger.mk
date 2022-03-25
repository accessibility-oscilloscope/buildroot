################################################################################
#
# oscilloscope-trigger
#
################################################################################

OSCILLOSCOPE_TRIGGER_VERSION = v0.6-beta
OSCILLOSCOPE_TRIGGER_SOURCE = $(OSCILLOSCOPE_TRIGGER_VERSION).tar.gz
OSCILLOSCOPE_TRIGGER_SITE = https://github.com/accessibility-oscilloscope/oscilloscope-trigger/archive/refs/tags

OSCILLOSCOPE_TRIGGER_BIN = trigger-data

define OSCILLOSCOPE_TRIGGER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/trigger_data.py $(TARGET_DIR)/usr/bin/$(OSCILLOSCOPE_TRIGGER_BIN)-$(OSCILLOSCOPE_TRIGGER_VERSION)
	ln -f $(TARGET_DIR)/usr/bin/$(OSCILLOSCOPE_TRIGGER_BIN)-$(OSCILLOSCOPE_TRIGGER_VERSION) $(TARGET_DIR)/usr/bin/$(OSCILLOSCOPE_TRIGGER_BIN)
endef

$(eval $(generic-package))
