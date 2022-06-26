# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=little-paimon
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=CMHopeSunshine
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=little-paimon
  URL:=https://github.com/CMHopeSunshine/LittlePaimon
  PKGARCH:=x86_64
	DEPENDS:=+python3-nb-cli +go-cqhttp +git-http +ffmpeg
endef

define Package/$(PKG_NAME)/description
  Genshin Q group robot based on HoshinoBot, NoneBot2 and go-cqhttp
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) ./root/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
