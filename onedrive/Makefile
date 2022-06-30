# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=onedrive
PKG_VERSION:=2.4.19
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/abraunegg/onedrive/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2022-06-15
PKG_HASH:=4dc977f4caf51af834bb0d1c3da818a6225c96a13c0acba4d1e674eba057d9f7

PKG_MAINTAINER:=abraunegg
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/onedrive
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Microsoft
  TITLE:=OneDrive Client for Linux
  URL:=https://github.com/abraunegg/onedrive
	DEPENDS:=+libstdcpp +libc +libcurl +libsqlite3 +librt
endef

define Package/onedrive/description
  A free Microsoft OneDrive Client which supports OneDrive Personal, OneDrive for Business, OneDrive for Office365 and SharePoint.
endef

define Package/onedrive/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/onedrive $(1)/usr/bin/
endef

$(eval $(call BuildPackage,onedrive,+librt))
