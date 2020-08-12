---
title: CICD实战之Nexus制品库的介绍与安装
abbrlink: da240c4a
date: 2020-08-08 23:25:46
tags:
 - CICD
---

## 目的

学习 Nexus 制品库的介绍与安装

## 介绍

在前面我们写到，制品库是**承接 CI 构建后的产出制品的仓库**，具有版本管理，历史管理，权限校验等功能。

在这里，我们选用 Nexus3 作为制品库。
<!-- more -->

## 正式开始

### 拉取镜像

```bash
docker pull sonatype/nexus3
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc7394f96-521a-4d75-9657-56e3f7997392%2FUntitled.png?table=block&id=affa503e-e7ac-4308-baec-c15145250541&width=1170&cache=v2)

### 启动容器
新建一个名为 nexus 的文件夹，方便我们存放 Nexus 相关数据，并赋予权限。
```bash
mkdir /home/nexus && chown -R 200 /home/nexus
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F989a883f-6e58-4d33-9007-35a03d268b50%2FUntitled.png?table=block&id=9ba4a2dd-5cde-45da-9a71-cde44fd3688c&width=940&cache=v2)
#### 创建容器

```bash
docker run -d -p 8081:8081 -p 8082:8082 \
--name nexus \
-v /home/nexus:/nexus-data \
--restart always \
sonatype/nexus3
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbcb6a00f-6a95-459d-8ad1-4d40aa84b4d5%2FUntitled.png?table=block&id=398776f0-76de-474d-9b3a-cccef7afe288&width=1230&cache=v2)
- Nexus 主服务端口，我们设置为 8081,；但是还需要新分配一个端口为服务端口，这里采用的是 8082

#### 防火墙
将对应端口添加到防火墙

```bash
firewall-cmd --zone=public --add-port=8081/tcp --permanent
firewall-cmd --zone=public --add-port=8082/tcp --permanent
systemctl reload firewalld
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F852d64c8-9747-427e-a72e-7f6269885109%2FUntitled.png?table=block&id=056bdba7-908c-42f7-8975-a4a8004a75bb&width=1230&cache=v2)
### 访问Nexus
打开浏览器地址栏，访问 Nexus 的服务地址，这里是ip:8001。启动时间比较长，可以使用```docker logs -f nexus```查看日志，如果显示以下文字**Started Sonatype Nexus OSS 3.25.1-04**就代表成功
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F12f64937-982c-4ccf-880e-c050e1ba2cf0%2FUntitled.png?table=block&id=39d424c1-13b0-48c5-82e6-480c41a62805&width=3340&cache=v2)

### 配置Nexus
我们访问```ip:8001```就可以看到界面了。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7703a87e-ad2f-4d7b-84ab-a55f7ef3644e%2FUntitled.png?table=block&id=5c2de677-bf43-431a-a84e-7f2c51f2d6ed&width=3840&cache=v2)
#### 登录
我们可以使用```默认账号:admin```登录，默认的密码在```cat /home/nexus/admin.password```可以查看。

注意不包含#号
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbcea1a4c-635b-4018-8b2a-ecc8ca72f9ce%2FUntitled.png?table=block&id=e3ebfdfd-53ef-4295-acb8-98421314f575&width=720&cache=v2)
当我们初次进入之后会让我们设置一下初始密码，和登录的权限。

#### 匿名访问性
设置密码之后需要设置访问性,**我们在任何没有登录的情况下，拉取（推送）制品到制品库，都算匿名访问。**,在实际生产中是**不安全**的，我们测试可以开启。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F162cf517-369b-4b16-8db9-2fddd033d225%2FUntitled.png?table=block&id=8730dcac-ee4e-4fa8-9a01-b60a02d1188c&width=1600&cache=v2)

#### 创建一个Docker私服
点击设置，选择左侧菜单中的 Repositories ，点击 Create repository
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8cb6fdcc-accf-4f58-8241-12dae916188e%2FUntitled.png?table=block&id=d0afe642-9784-4c60-a494-d6b8b6bfe0e3&width=1640&cache=v2)

使用搜索docker可以快速定位
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F86a15444-00ba-4f9f-b4e9-784df123b03b%2FUntitled.png?table=block&id=d3f28b82-fac3-4acd-8aff-5d25230c4cc3&width=2400&cache=v2)
**制品库的类型**
- proxy: 此类型制品库原则上 “只下载，不允许用户推送”。可以理解为缓存外网制品的制品库。例如，我们在拉取nginx镜像时，如果通过proxy类型的制品库，则它会去创建时配置好的外网docker镜像源拉取（有点像cnpm）到自己的制品库，然后给你。第二次拉取，则不会下载。起到 缓存 的作用。
- hosted：此类型制品库和proxy相反，原则上 **只允许用户推送，不允许缓存 。**这是私有库的核心，只存放自己的私有镜像或制品。
- group：此类型制品库用作以上两种类型的 **集合 **，将上面两个库集合为一个使用。

这里我们采用hosted类型，点击创建会看到一些输入框，这里做简单的解释。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd5ad3d6c-44fa-40c7-8fbb-38dd7a3ae28b%2FUntitled.png?table=block&id=9c6c314c-f627-43f3-934c-17dd71968752&width=2340&cache=v2)

同时我们还要设置一下权限，在Security-Realms的Docker Bearer Token Realm选择到右边的激活状态。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F659b6de4-136b-43ef-a524-fce864fdeaa8%2FUntitled.png?table=block&id=3aaaf25e-35c0-4ce2-a0e9-c5092751e7b2&width=2850&cache=v2)

### 小试牛刀-登录
安装至此，我们在另一台机器上试一下。

在这里，我的架构是两台虚拟机，一台是gitlab和jenkins，一台是nginx和Nexus。所以，我们就在gitlab的机器上尝试。

#### 配置文件
我们在gitlab配置文件，```vim /etc/docker/daemon.json```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34dc2fcc-5ee0-4c24-b4a7-8f862900611d%2FUntitled.png?table=block&id=0ca494fb-f98e-470c-9702-028008e9e277&width=1240&cache=v2)
```bash
"insecure-registries" : [
    "192.168.182.4:8082"
  ]

```
最后记得使用```systemctl restart docker```重启一下
**注意这里是json格式，格式不能错**

#### 登录
登录一下。从图中可以看出。初次登录需要输入账号密码，后续登录就不需要了。
```bash
docker login 服务IP:端口
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F568d3ad8-2977-40bb-b38d-70015c5c4e1e%2FUntitled.png?table=block&id=1fe5c0b3-a565-4b7f-a69e-c633238d9c10&width=1500&cache=v2)

### 小试牛刀-推送镜像到制品库
我们可以使用docker push推送镜像到私服上面。

docker在推送一个镜像时，镜像的 Tag (名称:版本号) 必须开头带着镜像库的地址，才可以推送。例如下面两个镜像：
 😡 local/jenkins 不能推送
 😃 **192.168.182.4:8082/local/jenkins** 可以推送。

#### 制作镜像
1.制作一份带镜像库地址的镜像：这个可以做，但是开销太大，需要走一遍制作流程

2.使用 docker tag 命令给已有的镜像打个标签：推荐使用，会将已有的镜像归位某个镜像库内。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fffb57a8a-62d1-4408-bcc9-23951b2dfc56%2FUntitled.png?table=block&id=8362eb38-87ca-4957-a8bb-c6fc70465a19&width=1560&cache=v2)

```bash
docker tag 28c624ccaacf    192.168.182.4:8082/local/jenkins
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7e0b5bc1-da68-45a7-b8fe-0b43d888cead%2FUntitled.png?table=block&id=0d221738-85b7-4896-aa6f-3c7d742cfd46&width=1940&cache=v2)
#### 推送
```bash
docker push 192.168.182.4:8082/local/jenkins
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcb751e29-83bb-44c1-8f5b-1620b31354ae%2FUntitled.png?table=block&id=961576d1-bd7e-4873-8801-11eea2541683&width=1890&cache=v2)
在仓库可以看到上传的
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8c4d4830-24f2-47fa-8c40-351cc884527b%2FUntitled.png?table=block&id=95be5f22-2adf-4d7f-828a-a0a5f8085704&width=1600&cache=v2)

## 结语
我们在这部分实现了docker私服的搭建和push，接下来我们将构建代码并且推送到私服。敬请期待吧！
