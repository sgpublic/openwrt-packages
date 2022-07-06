# go-filebrowser

> Network => Cloud Manager => go-filebrowser

filebrowser 在指定的目录中提供了一个文件管理界面，它可以用来上传，删除，预览，重命名和编辑您的文件。它允许创建多个用户，每个用户都可以拥有自己的目录。它可以用作独立应用程序，详情：[filebrowser/filebrowser： 📂 Web File Browser (github.com)](https://github.com/filebrowser/filebrowser)

注意：**此包需要 GoLang 1.18，因此仅支持 OpenWrt 22.03 及以上版本**，详情：[History for lang/golang/golang/Makefile - openwrt/packages (github.com)](https://github.com/openwrt/packages/commits/openwrt-22.03/lang/golang/golang/Makefile)

添加此包后，您可以通过 `/etc/init.d/filebrowser start` 启动。

此包默认状态下会有以下行为：

+ 添加 hosts 将域名 `filebrowser.sgpublic.xyz` 指向 `192.168.6.1`，您可以通过 `filebrowser.sgpublic.xyz` 访问 filebrowser 页面。
