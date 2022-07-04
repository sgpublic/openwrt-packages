# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=frp-server
PKG_VERSION:=0.43.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fatedier/frp/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2022-05-27
PKG_HASH:=8e243ab85a0e70b94eec60f6fd9bae23d45d742739cfb9406de5f3fd7f317b03
PKG_BUILD_DIR:=$(BUILD_DIR)/frp-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=Mrs4s

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/fatedier/frp
GO_PKG_BUILD_PKG:=$(GO_PKG)/cmd/frps
GO_PKG_LDFLAGS_X:= \
	$(GO_PKG).build=OpenWrt \
	$(GO_PKG).version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/frp-server
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Frp
  TITLE:=frp-server
  URL:=https://github.com/fatedier/frp
endef

define Package/frp-server/description
  frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.
endef

define Package/frp-server/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/frps $(1)/usr/bin/frps
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/nginx
	$(CP) ./root/etc/nginx/* $(1)/etc/nginx
	$(CP) ./root/etc/frps.ini $(1)/etc/frps.ini
endef

$(eval $(call BuildPackage,frp-server))
