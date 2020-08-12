---
title: CICD实战之Jenkins搭建
tags:
  - CICD
abbrlink: bc65362f
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
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F76c0a9fc-a192-4e82-be2a-7df26106a1c2%2Fia_10002.png?table=block&id=f90dfe5e-f647-469d-8dfd-09464ad130ba&width=2300&cache=v2)

<!-- more -->
## 正式开始

### docker

#### docker 介绍

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F924582a7-0306-4fe5-91b2-fb2e14381754%2Fia_10004.png?table=block&id=33ea4d75-f35d-4b86-80a9-8a05aa2fe695&width=400&cache=v2)

现在都流行容器化部署，想了解 docker 的点[维基百科](https://zh.wikipedia.org/wiki/Docker)和[菜鸟教程](https://www.runoob.com/docker/docker-tutorial.html)

#### docker安装

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
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7971d128-722a-491c-926d-d863c30b4c02%2Fia_10025.png?table=block&id=c701e059-a093-4ba5-ad25-49cec082931e&width=900&cache=v2)

#### 基本命令
```bash
systemctl start docker 启动
systemctl enable docker 建立连接
```
#### 配置阿里云源
拉取Docker镜像时，一般默认会去```Docker```官方源拉取镜像，为了优化速度我们更换为[阿里云镜像仓库](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)源进行镜像下载加速。

在对应```/etc/docker/daemon.json```添加内容就是了
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fda079af1-512e-4843-abec-4d4436bbe947%2Fia_10024.png?table=block&id=f64d18eb-3bc7-4e55-b5fa-5dcedbf06b19&width=1410&cache=v2)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe8c726ed-b3af-4e1c-952d-2b1a965c189a%2Fia_10023.png?table=block&id=faaa14f7-6321-45a8-af09-b801907ed6d1&width=1350&cache=v2)
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

### 安装Jenkins
Jenkins是一款由Java编写的开源的持续集成工具。在与Oracle发生争执后，项目从Hudson项目复刻。 Jenkins提供了软件开发的持续集成服务。[维基百科](https://zh.wikipedia.org/zh-cn/Jenkins_(%E8%BD%AF%E4%BB%B6))

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
- firewalld:[firewall简单使用](https://blog.csdn.net/s_p_j/article/details/80979450)
- ip的那个地方，我是使用的是的本地虚拟机，因此我配置的本地虚拟机的
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8282f08f-a52f-4c4b-8c8c-c263291d0adf%2Fia_10022.png?table=block&id=76fdf1cd-349e-46bc-9194-fee1e1d2b798&width=2250&cache=v2)


**必须配置**，否则会之后的docker启动服务失败

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F260f4ce0-fa5c-4c41-b529-c600d77345ef%2Fia_10021.png?table=block&id=0a10acdf-a2b0-4130-b971-d08dd3833fa6&width=2200&cache=v2)


#### docker in docker
##### 简介
Docker 采用的是C/S（即Client/Server）架构。我们在执行 ```docker xxx``` 等命令时，其实是使用 Client 在和```docker engine``` 在进行通信。

我们在安装 Docker CE 时，会生成一个``` systemd service ```服务。这个服务启动时，就是 ```Docker Engine``` 服务。默认情况下，Docker守护进程会生成一个``` socket（/var/run/docker.sock）```文件来进行本地进程通信，因此只能在本地使用 docker 客户端或者使用 Docker API 进行操作。
> *.sock文件：sock 文件是 UNIX 域套接字，它可以通过文件系统（而非网络地址）进行寻址和访问。
因此，只要把宿主机的Docker套接字通过Docker数据卷挂载到容器内部，就能实现在容器内使用Docker命令（如下图）。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff5afed89-25d6-41b0-956a-a9f9df08aff3%2Fia_10020.png?table=block&id=b859b677-8b38-4036-94f0-703670a4a8e6&width=940&cache=v2)
**使用方式**：```docker run ... -v /var/run/docker.sock:/var/run/docker.sock```
****
### 创建Dockerfile

在/usr/dockerdemo1建立一个Dockerfile

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
文件创建后，执行```docker build -t local/jenkins .```(名字为:local/jenkins)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fafa628da-57de-44d0-bed7-08a4169a7415%2Fia_10019.png?table=block&id=0758352e-cae5-458d-a073-182e77123f37&width=2800&cache=v2)

如果提示 Successfully tagged local/jenkins:latest 则构建成功。

此处为第二次构建，第二次构建就会非常快，大概流程如下。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff0ba4456-5c1a-433b-9399-87b60a1529ac%2Fia_10018.png?table=block&id=7268e987-568c-47f7-b34f-089b0ad30360&width=3410&cache=v2)

### 创建镜像和容器
我们将Jenkins用户目录外挂到宿主机内，先新建一个 ```/home/jenkins``` 目录，并设置权限：
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


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fffe8d91c-5c21-403a-9a94-9f1845d11dfb%2Fia_10017.png?table=block&id=a525268f-0afd-43d3-8b0e-96dd923ac6ec&width=3050&cache=v2)

### 启动Jenkins
#### 设置防火墙

首先我们在防火墙添加 8080 和 50000 端口的放行，并重载防火墙
```
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=50000/tcp --permanent
systemctl reload firewalld
```

然后在```宿主机IP:8080```就可以看到界面了


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fea7f1f14-f38d-4520-a3d9-d10ea4eab0a7%2Fia_10016.png?table=block&id=86405cf1-1a5f-461b-a989-ce34b548ff0c&width=2820&cache=v2)
#### 设置源

设置源提高Jenkins插件下载速度。因为后面安装插件需要重启，因此这一步可以先操作，避免后面再重启。

```bash
docker exec -it jenkins /bin/bash
find / -name 'default.json'
sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' /var/jenkins_home/updates/default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' /var/jenkins_home/updates/default.json
exit;
```
#### 初始化完成 
初始化完成需要我们输入密码
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F69db3d34-27fa-4bde-9443-3a41f7b8d1f8%2Fia_10015.png?table=block&id=e7280034-9346-4d78-b272-ad594b877dea&width=1910&cache=v2)
我们执行命令
```
docker exec -it jenkins /bin/bash //进入命令行
cat /var/jenkins_home/secrets/initialAdminPassword
```

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff91e6a2b-593a-45f6-b08f-f6a8a1b8ca75%2Fia_10014.png?table=block&id=77edd625-75b0-4f30-8808-685f7f26db8c&width=1260&cache=v2)
密码输入之后就是进入插件安装
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb183706d-35ed-44f7-968c-0415a43b889c%2Fia_10013.png?table=block&id=39e607c5-4526-4bf4-9eef-823bdc9b297b&width=1750&cache=v2)
设置源之后插件安装就很丝滑流畅
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F29a6381d-def5-47e4-b0e9-2ddca92ae467%2Fia_10012.png?table=block&id=d8a317cc-67ee-4bf9-a02d-5e497552e8b7&width=1740&cache=v2)
再就是设置管理员了，我这里使用的是：使用admin账户继续。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8ee1278f-ad17-497b-8cd1-5b5bc2689870%2Fia_10011.png?table=block&id=7aee27f9-f5b5-4e51-84c5-194f951fd58a&width=1690&cache=v2)

进入就是我们熟悉的界面了
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F18504ff7-df75-456f-b977-4cd908491074%2Fia_10010.png?table=block&id=4fe29fc4-39ad-4ae6-86ad-8048ae7f9a36&width=2910&cache=v2)


#### 小试牛刀

左侧新建Item
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd9670413-b9ca-483c-a64c-329fedc0d52f%2Fia_10009.png?table=block&id=8d203501-73a7-48e3-88cb-9feb41347be2&width=1960&cache=v2)
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff02c9d72-9aa1-4c02-a007-9ce3d00eb68e%2Fia_10008.png?table=block&id=be05bfb7-b662-43f6-8887-cf428e473158&width=2000&cache=v2)
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcd7e2fc1-75af-4434-b46d-7b18768f9b9b%2Fia_10007.png?table=block&id=c0002be6-08ee-4101-82c7-99285d2aa5ac&width=1970&cache=v2)
输入代码
```
  docker -v
  docker pull node:latest
```
保存再触发立即构建就可以看到效果了。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7b7d0620-9464-4f4c-a795-28d344d5f51c%2Fia_10006.png?table=block&id=c453151d-5148-407d-ab0a-8428c9012c33&width=740&cache=v2)

可以在控制台看到对应的输出就大功告成了。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F37d07cf9-8ffb-4734-ab42-a27bc555317e%2Fia_10005.png?table=block&id=2731e2b2-c2d7-4a63-a2a7-7ad02c668f1d&width=1570&cache=v2)

## 结语
至此，我们已经完整搭建了Jenkins环境，作为CICD不可少的一部分，也算是有了一个良好的开端。撒花！

