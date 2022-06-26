# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=onedrive
PKG_VERSION:=2.4.19
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/abraunegg/onedrive/archive/refs/tags/
PKG_SOURCE_DATE:=2022-06-15
PKG_HASH:=4dc977f4caf51af834bb0d1c3da818a6225c96a13c0acba4d1e674eba057d9f7

PKG_MAINTAINER:=abraunegg
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILE:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/onedrive
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=OneDrive Client for Linux
  URL:=https://github.com/abraunegg/onedrive
endef

define Package/onedrive/description
  A free Microsoft OneDrive Client which supports OneDrive Personal, OneDrive for Business, OneDrive for Office365 and SharePoint.
endef

define Build/Compile
	curl -fsS https://dlang.org/install.sh | bash -s dmd
	source ~/dlang/dmd-*/activate
	$(MAKE) -C $(PKG_BUILD_DIR)/onedrive/ \
		$(TARGET_CONFIGURE_OPTS) \
		TARGET=Linux \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
	deactivate
endef

define Package/onedrive/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/onedrive/onedrive $(1)/usr/bin/
endef

$(eval $(call BuildPackage,onedrive))
