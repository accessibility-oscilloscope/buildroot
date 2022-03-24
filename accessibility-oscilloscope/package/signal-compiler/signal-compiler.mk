################################################################################
#
# signal-compiler
#
################################################################################

SIGNAL_COMPILER_VERSION = v1.3
SIGNAL_COMPILER_SOURCE = $(SIGNAL_COMPILER_VERSION).tar.gz
SIGNAL_COMPILER_SITE = https://github.com/accessibility-oscilloscope/signal-compiler/archive/refs/tags

SIGNAL_COMPILER_BIN = signal-compiler

define SIGNAL_COMPILER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(SIGNAL_COMPILER_BIN)
endef

define SIGNAL_COMPILER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(SIGNAL_COMPILER_BIN) $(TARGET_DIR)/usr/bin/$(SIGNAL_COMPILER_BIN)-$(SIGNAL_COMPILER_VERSION)
	ln -f $(TARGET_DIR)/usr/bin/$(SIGNAL_COMPILER_BIN)-$(SIGNAL_COMPILER_VERSION) $(TARGET_DIR)/usr/bin/$(SIGNAL_COMPILER_BIN)
endef

$(eval $(generic-package))
