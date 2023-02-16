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
	DEPENDS:=+luci-nginx +luci-ssl-nginx +bash
endef

define Package/default-settings/description
	Default settings.
endef

define Package/default-settings/config
	source "$(SOURCE)/Config.in"
endef

define Build/Compile
	rm -f ./root/etc/nginx/conf.d/www.conf.out
	rm -f ./files/zzz-default-settings.out

	cp ./files/zzz-default-settings.in ./files/zzz-default-settings.out
	cp ./root/etc/nginx/conf.d/www.conf.in ./root/etc/nginx/conf.d/www.conf.out

	sed -i "s/%ip_address%/$(shell echo $(CONFIG_TARGET_PREINIT_IP))/g" ./files/zzz-default-settings.out
    ifeq ($(CONFIG_DEFAULT_SETTINGS_USE_IP), y)
		echo -e "server {\n	listen 80;\n	listen [::]:80;\n	server_name $(shell echo $(CONFIG_TARGET_PREINIT_IP));\n\n	include conf.d/luci.locations;\n}\n" >> ./root/etc/nginx/conf.d/www.conf.out
    endif

    ifeq ($(CONFIG_DEFAULT_SETTINGS_USE_DOMAIN), y)
		sed -i 's/%use_host%//g' ./files/zzz-default-settings.out
		sed -i "s/%host_name%/$(shell echo $(CONFIG_DEFAULT_SETTINGS_DOMAIN))/g" ./files/zzz-default-settings.out
		echo -e "server {\n	listen 80;\n	listen [::]:80;\n	server_name $(shell echo $(CONFIG_DEFAULT_SETTINGS_DOMAIN));\n\n	%plaintext_action%\n}\n" >> ./root/etc/nginx/conf.d/www.conf.out
        ifeq ($(CONFIG_DEFAULT_SETTINGS_DOMAIN_USE_SSL), y)
			echo -e "server {\n	listen 443;\n	listen [::]:443;\n	server_name $(shell echo $(CONFIG_DEFAULT_SETTINGS_DOMAIN));\n\n	ssl_certificate /etc/nginx/conf.d/_lan.crt;\n	ssl_certificate_key /etc/nginx/conf.d/_lan.key;\n\n	include conf.d/luci.locations;\n}\n" >> ./root/etc/nginx/conf.d/www.conf.out
            ifeq ($(CONFIG_DEFAULT_SETTINGS_DOMAIN_FORCE_SSL), y)
				sed -i 's/%plaintext_action%/return https:\/\/\$host\$request_uri;/g' ./root/etc/nginx/conf.d/www.conf.out
            else
				sed -i 's/%plaintext_action%/include conf.d\/luci.locations;/g' ./root/etc/nginx/conf.d/www.conf.out
            endif
        else
			sed -i 's/%plaintext_action%/include conf.d\/luci.locations;/g' ./root/etc/nginx/conf.d/www.conf.out
        endif
    else
		sed -i 's/%use_host%/\# /g' ./files/zzz-default-settings.out
    endif
endef

define Package/default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-default-settings.out $(1)/etc/uci-defaults/99-default-settings
	$(INSTALL_DIR) $(1)/etc/nginx/conf.d
	$(CP) ./root/etc/nginx/conf.d/www.conf.out $(1)/etc/nginx/conf.d/www.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./root/usr/bin/init $(1)/usr/bin/
endef

$(eval $(call BuildPackage,default-settings))
