################################################################################
#
# signal-compiler
#
################################################################################

SIGNAL_COMPILER_VERSION = v0.0.1
SIGNAL_COMPILER_SOURCE = $(SIGNAL_COMPILER_VERSION).tar.gz
SIGNAL_COMPILER_SITE = https://github.com/accessibility-oscilloscope/signal-compiler/archive/refs/tags

define SIGNAL_COMPILER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) signal-compiler
endef

define SIGNAL_COMPILER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/signal-compiler $(TARGET_DIR)/usr/bin/signal-compiler
endef

$(eval $(generic-package))
