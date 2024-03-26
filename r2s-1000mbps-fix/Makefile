#
# Copyright (C) 2016-2017 GitHub
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=r2s-1000mbps-fix
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/r2s-1000mbps-fix
	SECTION:=luci
	CATEGORY:=LuCI
	TITLE:=Fix r2s 1000Mbps Problem
	PKGARCH:=all
	DEPENDS:=+kmod-usb2 +kmod-usb2-pci +kmod-usb3
endef

define Package/r2s-1000mbps-fix/description
	Fix r2s 1000Mbps problem.
endef

define Build/Compile
endef

define Package/r2s-1000mbps-fix/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-r2s-1000mbps-fix $(1)/etc/uci-defaults/99-r2s-1000mbps-fix
endef

$(eval $(call BuildPackage,r2s-1000mbps-fix))