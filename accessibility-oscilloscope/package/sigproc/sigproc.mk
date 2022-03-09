################################################################################
#
# sigproc
#
################################################################################

SIGPROC_VERSION = stub-v0.1
SIGPROC_SOURCE = $(SIGPROC_VERSION).tar.gz
SIGPROC_SITE = https://github.com/accessibility-oscilloscope/signal-processing/archive/refs/tags

define SIGPROC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/stub.py $(TARGET_DIR)/usr/bin/sigproc
endef

$(eval $(generic-package))
