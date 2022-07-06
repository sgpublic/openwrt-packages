# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=go-cqhttp
PKG_VERSION:=1.0.0-rc3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Mrs4s/go-cqhttp/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2022-06-21
PKG_HASH:=b6cdc881dcf98f5c7fcfa9e597903b482b2186a2a76413b05bfa8e6d2a50e071

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=Mrs4s

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/Mrs4s/go-cqhttp
GO_PKG_BUILD_PKG:=$(GO_PKG)
GO_PKG_LDFLAGS_X:= \
	$(GO_PKG).build=OpenWrt \
	$(GO_PKG).version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/go-cqhttp
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Tencent
  TITLE:=go-cqhttp
  URL:=https://github.com/Mrs4s/go-cqhttp
endef

define Package/go-cqhttp/description
  OneBot Golang native implementation based on Mirai and MiraiGo.
endef

define Package/go-cqhttp/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/go-cqhttp $(1)/usr/bin/cqhttp
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d
	$(CP) ./root/etc/cqhttp.yml $(1)/etc/cqhttp.yml
endef

$(eval $(call BuildPackage,go-cqhttp))
