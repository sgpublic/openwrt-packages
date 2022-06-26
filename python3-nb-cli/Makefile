#
# Copyright (C) 2019-2021 CZ.NIC, z. s. p. o. (https://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nb-cli
PKG_VERSION:=0.6.7
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=394bf65eabbda6aa7c410961b901e9f7320fae12143818b1c078fc43f060fa0e

PKG_MAINTAINER:=nonebot
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-$(PKG_NAME)
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Command Line Tools for NoneBot2 (nb-cli)
  URL:=https://github.com/nonebot/nb-cli
endef

define Package/python3-$(PKG_NAME)/description
  Command Line Tools for NoneBot2.
endef

$(eval $(call Py3Package,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)))
$(eval $(call BuildPackage,python3-$(PKG_NAME)-src))
