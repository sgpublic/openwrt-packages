# little-paimon

> Network => Tencent => little-paimon

**PS：此包虽然归类于 Tencent，但与 Tencent 及其所属公司无任何关联。**

这是一个基于 [NoneBot2](https://github.com/nonebot/nonebot2) 和 [go-cqhttp](https://github.com/Mrs4s/go-cqhttp) 的原神 QQ 群机器人，详情请看：[CMHopeSunshine/LittlePaimon: 小派蒙！原神qq群机器人，基于NoneBot2的UID查询、抽卡导出分析、模拟抽卡、实时便签、札记等多功能小助手。 (github.com)](https://github.com/CMHopeSunshine/LittlePaimon)

您可以通过 `/etc/init.d/paimon start` 启动。

此包默认状态下会有以下行为：

+ 添加 hosts 将域名 `nonebot.sgpublic.xyz` 指向 `192.168.6.1`，您可以通过 `nonebot.sgpublic.xyz` 访问机器人页面。
+ 在 `/etc/little-paimon` 目录下创建 `nb` 项目并添加 `LittlePaimon`。

## /etc/init.d/paimon 指令

### install

此指令将 `cd` 至 `nb` 项目目录，安装插件 `nonebot-plugin-gocqhttp`，**请在第一次启动前运行此指令！**

### start

此指令将使用 `nb start` 启动 `little-paimon`，启动前你需要启动 `go-cqhttp`。

### stop

此指令将直接杀死 `nb` 进程以关闭 `little-paimon`。

### update

此指令将 `cd` 至 `LittlePaimon` plugin 目录，使用 `git pull` 更新。

