################################################################################
#
# oscilloscope_dump
#
################################################################################

OSCILLOSCOPE_DUMP_VERSION = v0.0.1
OSCILLOSCOPE_DUMP_SOURCE = $(OSCILLOSCOPE_DUMP_VERSION).tar.gz
OSCILLOSCOPE_DUMP_SITE = https://github.com/accessibility-oscilloscope/oscilloscope-serial/archive/refs/tags

define OSCILLOSCOPE_DUMP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) oscope_dump
endef

define OSCILLOSCOPE_DUMP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/oscope_dump $(TARGET_DIR)/usr/bin/oscope_dump
endef

$(eval $(generic-package))
