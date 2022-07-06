# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=go-filebrowser
PKG_VERSION:=2.22.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/filebrowser/filebrowser/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2022-07-05
PKG_HASH:=d1108dd89a1f9287cd3b757851921363ec2cae7cd10dfb7f0c82c4b81e1ca285

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=Mrs4s

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/filebrowser/filebrowser
GO_PKG_BUILD_PKG:=$(GO_PKG)
GO_PKG_LDFLAGS_X:= \
	$(GO_PKG).build=OpenWrt \
	$(GO_PKG).version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/go-filebrowser
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Cloud Manager
  TITLE:=go-filebrowser
  URL:=https://github.com/filebrowser/filebrowser
endef

define Package/go-filebrowser/description
  OneBot Golang native implementation based on Mirai and MiraiGo.
endef

define Package/go-filebrowser/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/nginx
	$(CP) ./root/etc/nginx/* $(1)/etc/nginx
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-go-filebrowser $(1)/etc/uci-defaults/99-go-filebrowser
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/go-filebrowser $(1)/usr/bin/filebrowser
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d
endef

$(eval $(call BuildPackage,go-filebrowser))
