# onedrive

> Network => Cloud Manager => onedrive

这是一个 Linux 平台的、免费的 Microsoft OneDrive 客户端，支持 OneDrive Personal、OneDrive for Business、OneDrive for Office365 和 SharePoint，详情请看：[abraunegg/onedrive: #1 Free OneDrive Client for Linux (github.com)](https://github.com/abraunegg/onedrive)。

_**Note：此包 Makefile 尚未完成，请勿使用！**_

## 准备

要使用此包，您需要为您的编译环境安装 D Compiler：

```shell
# for Ubuntu 22.04
sudo wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
sudo apt-get update --allow-insecure-repositories
sudo apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
sudo apt-get update && sudo apt-get install dmd-compiler dub
```

详情请看：[Downloads - D Programming Language (dlang.org)](https://dlang.org/download.html)