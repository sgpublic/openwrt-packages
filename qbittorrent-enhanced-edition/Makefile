#
# Copyright (C) 2020 Krypton Lee <jun.k.lee199410@outlook.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qbittorrent-enhanced-edition
PKG_VERSION:=4.4.3.12
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/c0re100/qBittorrent-Enhanced-Edition/tar.gz/release-$(PKG_VERSION)?
PKG_SOURCE_DATE:=2022-06-01
PKG_HASH:=67f741ad176a487ad9e5d910f9782838082eada623ca84c67774bb859f601bf2
PKG_BUILD_DIR:=$(BUILD_DIR)/qBittorrent-Enhanced-Edition-release-$(PKG_VERSION)

PKG_MAINTAINER:=c0re100
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILE:=COPYING

PKG_BUILD_DEPENDS:=qt6tools/host
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/qbittorrent-enhanced-edition
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=BitTorrent
  TITLE:=qBittorrent Enhanced Edition
  URL:=https://github.com/c0re100/qBittorrent-Enhanced-Edition
  DEPENDS:=+libQt6Core +libQt6Network +libQt6Sql +libQt6Xml +libtorrent-rasterbar +qt6-plugin-libqopensslbackend +qt6-plugin-libqsqlite +boost
endef

define Package/qbittorrent-enhanced-edition/description
  qBittorrent is a bittorrent client programmed in C++ / Qt that uses libtorrent (sometimes called libtorrent-rasterbar) by Arvid Norberg.
endef

CMAKE_OPTIONS+= \
	-DGUI=OFF \
	-DQT6=ON \
	-DSTACKTRACE=OFF \
	-DWEBUI=ON \
	-DQT_ADDITIONAL_PACKAGES_PREFIX_PATH=$(STAGING_DIR_HOSTPKG)

define Package/qbittorrent-enhanced-edition/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qbittorrent-nox $(1)/usr/bin/qbtee
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-qbittorrent-enhanced-edition $(1)/etc/uci-defaults/99-qbittorrent-enhanced-edition
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/nginx
	$(CP) ./root/etc/nginx/* $(1)/etc/nginx
	$(INSTALL_DIR) $(1)/root/Downloads
endef

$(eval $(call BuildPackage,qbittorrent-enhanced-edition))
