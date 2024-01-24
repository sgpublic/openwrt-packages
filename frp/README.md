# frp

frp 是一个专注于内网穿透的高性能的反向代理应用，支持 TCP、UDP、HTTP、HTTPS 等多种协议。可以将内网服务以安全、便捷的方式通过具有公网 IP 节点的中转暴露到公网，详情请看：[fatedier/frp: A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet. (github.com)](https://github.com/fatedier/frp)。

## frp-client

> Network => Frp => frp-client

此包为**客户端**，添加此包后，您可以通过 `/etc/init.d/frpc start` 启动，**启动前请修改位于 `/etc/frp/frpc.yaml` 的配置文件以正确链接 frp 服务端**。

## frp-server

> Network => Frp => frp-server

此包为**服务端**，添加此包后，您可以通过 `/etc/init.d/frps start` 启动，**如需定制请修改位于 `/etc/frp/frps.yaml` 的配置文件**。