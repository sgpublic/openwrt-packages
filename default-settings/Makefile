#
# Copyright (C) 2016-2017 GitHub
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=default-settings
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/default-settings
	SECTION:=luci
	CATEGORY:=LuCI
	TITLE:=LuCI support for Default Settings
	PKGARCH:=all
	DEPENDS:=+luci-nginx +luci-ssl-nginx +bash +luci-compat
endef

define Package/default-settings/description
	Default settings.
endef

define Package/default-settings/config
	source "$(SOURCE)/Config.in"
endef

define Build/Compile
	bash ./compile.sh \
		CONFIG_TARGET_PREINIT_IP=$(CONFIG_TARGET_PREINIT_IP) \
		CONFIG_DEFAULT_SETTINGS_USE_IP=$(CONFIG_DEFAULT_SETTINGS_USE_IP) \
		CONFIG_DEFAULT_SETTINGS_USE_DOMAIN=$(CONFIG_DEFAULT_SETTINGS_USE_DOMAIN) \
		CONFIG_DEFAULT_SETTINGS_DOMAIN=$(CONFIG_DEFAULT_SETTINGS_DOMAIN) \
		CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL=$(CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL) \
		CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL=$(CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL) \
		CONFIG_DEFAULT_SETTINGS_USE_BACKUP=$(CONFIG_DEFAULT_SETTINGS_USE_BACKUP) \
		CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL=$(CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_URL) \
		CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH=$(CONFIG_DEFAULT_SETTINGS_USE_BACKUP_REPO_BRANCH)
endef

define Package/default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-default-settings.out $(1)/etc/uci-defaults/98-default-settings
	$(INSTALL_BIN) ./files/zzz-restore-backup.out $(1)/etc/uci-defaults/99-restore-backup
	$(INSTALL_DIR) $(1)/etc/nginx/conf.d
	$(CP) ./root/etc/nginx/conf.d/www.conf.out $(1)/etc/nginx/conf.d/www.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./root/usr/bin/init $(1)/usr/bin/
endef

$(eval $(call BuildPackage,default-settings))
