# default-settings

此包为 openwrt 第一次启动初始化，默认状态将执行以下操作：

+ 设置语言为 zh_cn（简体中文）
+ 设置时区为 CST-8、Asia/Shanghai
+ 修改默认密码为 `password`
+ 替换 ash 为 bash
+ 添加 hosts 将域名 `opw.sgpublic.xyz` 指向 `192.168.6.1`，您可以通过 `opw.sgpublic.xyz` 访问路由主页
+ 若您的配置中包含了 `ntfs-3g`，则修复无法使用 ntfs-3g 挂载的问题
+ 减少 dnsmasq 的 log 输出
+ 删除缓存

若您还有其他需求，请将执行的命令添加到 `files/zzz-default-settings` 内。