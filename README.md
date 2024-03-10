# 基于Archlinux构建利用bwrap运行最新原生Linux版微信
本教程参考了以下内容：  

https://aur.archlinux.org/packages/wechat-beta-bwrap  

https://www.52pojie.cn/thread-1896902-1-1.html  

https://www.52pojie.cn/forum.php?mod=redirect&goto=findpost&ptid=1896902&pid=49675160  

# 以下步骤在archlinux中执行
## 执行构建
在仓库目录下执行：
```shell
makepkg
```
构建完成后会生成一个`wechat-beta-bwrap-1.0.0.145-11-x86_64.pkg.tar.zst`安装包，若需要在Ubuntu等Debian发行版上安装则需要重新打包为.deb格式，
先通过命令
```shell
bsdtar -xvf wechat-beta-bwrap-1.0.0.145-11-x86_64.pkg.tar.zst -C wechat-beta_bwrap
```
将安装包解压
# 以下步骤在Ubuntu 23.10中执行
## 将解压后的目录整个复制到Ubuntu中，因为上一步使用的docker构建的因此这里使用以下命令复制：
```shell
docker cp archlinux:/wechat-beta-bwrap/wechat-beta_bwrap .
```
## 复制控制文件
```shell
docker cp archlinux:/wechat-beta-bwrap/DEBIAN wechat-beta_bwrap
```
## 重新打包
```shell
dpkg-deb -b wechat-beta_bwrap wechat-beta_1.0.0.145_amd64.bwrap.deb
```
## 安装微信
```shell
sudo dpkg -i wechat-beta_1.0.0.145_amd64.bwrap.deb
```

