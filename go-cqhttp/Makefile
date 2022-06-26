# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=go-cqhttp
PKG_VERSION:=1.0.0-rc3
PKG_RELEASE:=1

PKG_SOURCE:=go-cqhttp_linux_amd64.tar.gz
PKG_SOURCE_URL:=https://github.com/Mrs4s/go-cqhttp/releases/download/v$(PKG_VERSION)/
PKG_SOURCE_DATE:=2022-06-21
PKG_HASH:=412b966f488e52927fe5654dc1604cc19a14e41be385fa460560cdafe3ff5b28

PKG_MAINTAINER:=Mrs4s
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/go-cqhttp
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=go-cqhttp
  URL:=https://github.com/Mrs4s/go-cqhttp
endef

define Package/go-cqhttp/description
  OneBot Golang native implementation based on Mirai and MiraiGo.
endef

define Build/Compile
endef

define Package/go-cqhttp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/../go-cqhttp $(1)/usr/bin/cqhttp
	$(CP) ./root/* $(1)/
endef

$(eval $(call BuildPackage,go-cqhttp))
