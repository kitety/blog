---
title: CICD实战之Jenkins搭建
tags:
  - CICD
abbrlink: bc65362f
translate_title: cicd-actual-combat-jenkins-construction
date: 2020-07-25 16:29:10
---

## 目的

学习 Jenkins 的搭建

## 准备工作

- 机器：vmware 虚拟机安装的 centos 的最小版本[教程](https://blog.csdn.net/babyxue/article/details/80970526)
- 终端：zsh[教程](https://www.jianshu.com/p/556ff130fc65)，安装了 autojump、zsh-autosuggestion 以及 zsh-syntax-highlighting 插件[教程](https://www.zrahh.com/archives/167.html)
- 使用的 xshell 连接 vmware，方便熟悉[教程](https://my.oschina.net/u/4306931/blog/3226337)
- yum 源阿里源

最终终端图

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929878617-image.png)

<!-- more -->

## 正式开始

### docker

#### docker 介绍

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929893064-image.png)

现在都流行容器化部署，想了解 docker 的点[维基百科](https://zh.wikipedia.org/wiki/Docker)和[菜鸟教程](https://www.runoob.com/docker/docker-tutorial.html)

#### docker 安装

```bash
// 安装依赖
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/
yum-config-manager --enable docker-ce-nightly #要每日构建版本的 Docker
yum-config-manager --enable docker-ce-test
yum install docker-ce docker-ce-cli containerd.io
```

你也可以使用阿里源进行安装

```bash
// 安装依赖
yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install docker-ce
```

安装成功再 `docker -v`查看

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929914636-image.png)

#### 基本命令

```bash
systemctl start docker 启动
systemctl enable docker 建立连接
```

#### 配置阿里云源

拉取 Docker 镜像时，一般默认会去`Docker`官方源拉取镜像，为了优化速度我们更换为[阿里云镜像仓库](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)源进行镜像下载加速。

在对应`/etc/docker/daemon.json`添加内容就是了

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929928364-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929936276-image.png)

```bash
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://lgt83q7k.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### 安装 Jenkins

Jenkins 是一款由 Java 编写的开源的持续集成工具。在与 Oracle 发生争执后，项目从 Hudson 项目复刻。 Jenkins 提供了软件开发的持续集成服务。[维基百科](<https://zh.wikipedia.org/zh-cn/Jenkins_(%E8%BD%AF%E4%BB%B6)>)

#### 安装防火墙

```bash
yum install firewalld systemd -y
service firewalld start //启动防火墙
firewall-cmd --permanent --add-service=http

firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="172.16.0.0/16" accept"
systemctl reload firewalld
```

关于:

- Systemd:[Systemd 入门教程：命令篇](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)
- firewalld:[firewall 简单使用](https://blog.csdn.net/s_p_j/article/details/80979450)
- ip 的那个地方，我是使用的是的本地虚拟机，因此我配置的本地虚拟机的

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929958983-image.png)

**必须配置**，否则会之后的 docker 启动服务失败

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929979697-image.png)

#### docker in docker

##### 简介

Docker 采用的是 C/S（即 Client/Server）架构。我们在执行 `docker xxx` 等命令时，其实是使用 Client 在和`docker engine` 在进行通信。

我们在安装 Docker CE 时，会生成一个`systemd service`服务。这个服务启动时，就是 `Docker Engine` 服务。默认情况下，Docker 守护进程会生成一个` socket（/var/run/docker.sock）`文件来进行本地进程通信，因此只能在本地使用 docker 客户端或者使用 Docker API 进行操作。

> \*.sock 文件：sock 文件是 UNIX 域套接字，它可以通过文件系统（而非网络地址）进行寻址和访问。
> 因此，只要把宿主机的 Docker 套接字通过 Docker 数据卷挂载到容器内部，就能实现在容器内使用 Docker 命令（如下图）。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600929989131-image.png)

**使用方式**：`docker run ... -v /var/run/docker.sock:/var/run/docker.sock`

### 创建 Dockerfile

在/usr/dockerdemo1 建立一个 Dockerfile

内容

```
FROM jenkins/jenkins
USER root
# 清除了基础镜像设置的源，切换成阿里云源
RUN echo '' > /etc/apt/sources.list.d/jessie-backports.list \
  && echo "deb http://mirrors.aliyun.com/debian jessie main contrib non-free" > /etc/apt/sources.list \
  && echo "deb http://mirrors.aliyun.com/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list \
  && echo "deb http://mirrors.aliyun.com/debian-security jessie/updates main contrib non-free" >> /etc/apt/sources.list
# 更新源并安装缺少的包
RUN apt-get update && apt-get install -y libltdl7
ARG dockerGid=999

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group
```

### 构建镜像

文件创建后，执行`docker build -t local/jenkins .`(名字为:local/jenkins)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930061853-image.png)

如果提示 Successfully tagged local/jenkins:latest 则构建成功。

此处为第二次构建，第二次构建就会非常快，大概流程如下。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930070420-image.png)

### 创建镜像和容器

我们将 Jenkins 用户目录外挂到宿主机内，先新建一个 `/home/jenkins` 目录，并设置权限：

```
mkdir /home/jenkins
chown -R 1000 /home/jenkins/
```

接下来我们用镜像创建容器并启动：

```
docker run -itd --name jenkins -p 8080:8080 -p 50000:50000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /usr/bin/docker:/usr/bin/docker \
-v /home/jenkins:/var/jenkins_home \
--restart always \
--user root local/jenkins
```

创建成功

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930078755-image.png)

### 启动 Jenkins

#### 设置防火墙

首先我们在防火墙添加 8080 和 50000 端口的放行，并重载防火墙

```
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=50000/tcp --permanent
systemctl reload firewalld
```

然后在`宿主机IP:8080`就可以看到界面了

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930091448-image.png)

#### 设置源

设置源提高 Jenkins 插件下载速度。因为后面安装插件需要重启，因此这一步可以先操作，避免后面再重启。

```bash
docker exec -it jenkins /bin/bash
find / -name 'default.json'
sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' /var/jenkins_home/updates/default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' /var/jenkins_home/updates/default.json
exit;
```

#### 初始化完成

初始化完成需要我们输入密码

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930101097-image.png)

我们执行命令

```
docker exec -it jenkins /bin/bash //进入命令行
cat /var/jenkins_home/secrets/initialAdminPassword
```

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930114355-image.png)

密码输入之后就是进入插件安装

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930124287-image.png)

设置源之后插件安装就很丝滑流畅

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930131849-image.png)

再就是设置管理员了，我这里使用的是：使用 admin 账户继续。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930141714-image.png)

进入就是我们熟悉的界面了

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930151106-image.png)

#### 小试牛刀

左侧新建 Item

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930158573-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930168607-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930174874-image.png)

输入代码

```
  docker -v
  docker pull node:latest
```

保存再触发立即构建就可以看到效果了。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930183638-image.png)

可以在控制台看到对应的输出就大功告成了。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-24/1600930190482-image.png)

## 结语

至此，我们已经完整搭建了 Jenkins 环境，作为 CICD 不可少的一部分，也算是有了一个良好的开端。撒花！
