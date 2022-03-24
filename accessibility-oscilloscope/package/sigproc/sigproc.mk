################################################################################
#
# sigproc
#
################################################################################

SIGPROC_VERSION = v0.3
SIGPROC_SOURCE = $(SIGPROC_VERSION).tar.gz
SIGPROC_SITE = https://github.com/accessibility-oscilloscope/signal-processing/archive/refs/tags

SIGPROC_BIN = sigproc

define SIGPROC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/main.py $(TARGET_DIR)/usr/bin/$(SIGPROC_BIN)-$(SIGPROC_VERSION)
	ln -f $(TARGET_DIR)/usr/bin/$(SIGPROC_BIN)-$(SIGPROC_VERSION) $(TARGET_DIR)/usr/bin/$(SIGPROC_BIN)
endef

$(eval $(generic-package))
