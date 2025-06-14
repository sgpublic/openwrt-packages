# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=frp
PKG_VERSION:=0.62.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/fatedier/frp/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2024-09-19
PKG_HASH:=d0513f1c08f7a6b31f91ddeca64ccdec43726c20d20103de5220055daa04b903
PKG_BUILD_DIR:=$(BUILD_DIR)/frp-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=fatedier

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/fatedier/frp
GO_PKG_BUILD_PKG:=$(GO_PKG)/cmd/...
GO_PKG_LDFLAGS_X:= \
	$(GO_PKG).build=OpenWrt \
	$(GO_PKG).version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/frpc
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Frp
  TITLE:=frp-client
  URL:=https://github.com/fatedier/frp
endef

define Package/frpc/description
  frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.
endef

define Package/frpc/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/frpc $(1)/usr/bin/frpc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./frpc/etc/init.d/* $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/frp
	$(CP) ./frpc/etc/frp/frpc.yaml $(1)/etc/frp/frpc.yaml
endef

define Package/frps
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Frp
  TITLE:=frp-server
  URL:=https://github.com/fatedier/frp
endef

define Package/frps/description
  frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the Internet. As of now, it supports TCP and UDP, as well as HTTP and HTTPS protocols, where requests can be forwarded to internal services by domain name.
endef

define Package/frps/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/frps $(1)/usr/bin/frps
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./frps/etc/init.d/* $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/frp
	$(CP) ./frps/etc/frp/frps.yaml $(1)/etc/frp/frps.yaml
endef

$(eval $(call BuildPackage,frps))
$(eval $(call BuildPackage,frpc))
