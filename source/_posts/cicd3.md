---
title: CICD实战之Gitlab搭建
abbrlink: aa4ef8c5
date: 2020-07-26 12:05:29
tags:
  - CICD
---

## 目的

学习 Gitlab 的搭建

## 正式开始

### 拉取 Gitlab 镜像

```
docker pull gitlab/gitlab-ce
```

我这网速的确感人啊

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930371197-image.png)

<!-- more -->

### 创建 Gitlab 容器

```
mkdir /home/gitlab #创建Gitlab工作目录

docker run -itd -p 443:443 \
-p 8899:8899 \
-p 333:333 \
--name gitlab \
--restart always \
-v /home/gitlab/config:/etc/gitlab \
-v /home/gitlab/logs:/var/log/gitlab \
-v /home/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce
```

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930382739-image.png)

关于：

- --restart: 当 Docker 重启时，容器自动启动，否则就需要使用 docker restart 启动
- gitlab 端口映射规则：最好内外端口映射一致，gitlab 会根据你的配置文件调整服务端口。如外部访问 8899，内外都配置 8899
- 一般 Gitlab 有三个端口要使用：ssh，https，主服务地址。
- ssh 默认是 22，这里我改为了 333，

然后我们在防火墙添加 333 和 8899 端口的放行，并重载防火墙

```bash
firewall-cmd --zone=public --add-port=333/tcp --permanent
firewall-cmd --zone=public --add-port=8899/tcp --permanent
systemctl reload firewalld
```

我们可以看下现在的运行状况

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930391115-image.png)

### 修改 Gitlab 配置文件

#### 外部路径

```
vi /home/gitlab/config/gitlab.rb
```

在文件内增加三条配置：

- external_url: 外部服务访问地址
- gitlab_rails['gitlab_ssh_host']：SSH 代码拉取地址
- gitlab_rails['gitlab_shell_ssh_port']：SSH 代码拉取端口

```
external_url 'http://外部访问域名/地址:端口'
gitlab_rails['gitlab_ssh_host'] = 'SSH外部访问域名/地址'
gitlab_rails['gitlab_shell_ssh_port'] = SSH端口
```

我的虚拟机是 192.168.182.3，因此我的填写如下

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930401361-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930406859-image.png)

#### 修改 SSH 端口

前面设置的是 333 端口，因此要把默认的 22 端口改为 333 端口。

```
docker exec -it gitlab /bin/bash
vim /assets/sshd_config
vim /etc/ssh/sshd_config
```

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930425027-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930430871-image.png)

#### 重启 Gitlab

```
docker restart gitlab
```

访问我们的地址端口。如果显示 502 ，则代表正在启动中。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930439978-image.png)

初始化完成就好了

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930448387-image.png)

接下来就是改密码和登录了，登陆之后就进入页面，gitlab 也终于露出了庐山真面目。注意：管理员的账号是**root**。

最后，我们就进入 gitlab 了。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930458016-image.png)

## 结语

至此，我们已经完整搭建了 Gitlab 环境，作为 CICD 不可少的一部分，也算是有了一个良好的开端。撒花！
