# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=ohttps-webhook
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sgpublic/OhttpsWebhook/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2024-01-24
PKG_HASH:=29c85b090907fad185a184b0ce238b9e8eabd59f64a918ad8f423ca432f69b4f
PKG_BUILD_DIR:=$(BUILD_DIR)/frp-$(PKG_VERSION)

PKG_MAINTAINER:=sgpublic

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/sgpublic/OhttpsWebhook
GO_PKG_BUILD_PKG:=$(GO_PKG)
GO_PKG_LDFLAGS_X:= \
	$(GO_PKG).build=OpenWrt \
	$(GO_PKG).version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/ohttps-webhook
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ohttps-webhook
  URL:=https://github.com/sgpublic/OhttpsWebhook
endef

define Package/ohttps-webhook/description
  This is a webhook-based open source automated deployment tool for ohttps.com.
endef

define Package/ohttps-webhook/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/OhttpsWebhook $(1)/usr/bin/ohttps
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d
	$(CP) ./root/ohttps/ohttps.yaml $(1)/etc/ohttps/ohttps.yaml
endef

$(eval $(call BuildPackage,ohttps-webhook))
