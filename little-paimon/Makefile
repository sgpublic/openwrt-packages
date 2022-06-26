# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=little-paimon

PKG_MAINTAINER:=CMHopeSunshine
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/little-paimon
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=little-paimon
  URL:=https://github.com/CMHopeSunshine/LittlePaimon
  DEPENDS:=+gcc +python3-pip +grep
endef

define Package/little-paimon/description
  Genshin Q group robot based on HoshinoBot, NoneBot2 and go-cqhttp
endef

define Build/Compile
endef

define Package/little-paimon/install
	$(INSTALL_DIR) $(1)/usr/bin
endef

$(eval $(call BuildPackage,little-paimonn))
