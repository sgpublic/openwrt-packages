# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 sgpublic

include $(TOPDIR)/rules.mk

PKG_NAME:=go-filebrowser
PKG_VERSION:=2.22.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/filebrowser/filebrowser/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE_DATE:=2022-07-19
PKG_HASH:=511f0e200c4c2c3851f92d1090804a67ed425a8290493a70af49aea93c229d91

PKG_BUILD_DIR:=$(BUILD_DIR)/filebrowser-$(PKG_VERSION)

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=Mrs4s

PKG_BUILD_DEPENDS:=golang/host node/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/filebrowser/filebrowser
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
  filebrowser provides a file managing interface within a specified directory
	and it can be used to upload, delete, preview, rename and edit your files.
	It allows the creation of multiple users and each user can have its own directory.
	It can be used as a standalone app.
endef

define Build/Compile
	( \
		pushd "$(PKG_BUILD_DIR)/frontend" ; \
		npm ci; \
		npm run lint ; \
		npm run build ; \
		popd ; \
		$(call GoPackage/Build/Compile) ; \
	)
endef

define Package/go-filebrowser/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/nginx
	$(CP) ./root/etc/nginx/* $(1)/etc/nginx
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-go-filebrowser $(1)/etc/uci-defaults/99-go-filebrowser
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/filebrowser $(1)/usr/bin/filebrowser
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d
endef

$(eval $(call GoBinPackage,go-filebrowser))
$(eval $(call BuildPackage,go-filebrowser))
