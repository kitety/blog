---
title: CICD实战之Jenkins + Gitlab 实现前端构建
tags:
  - CICD
abbrlink: d26a2f6b
date: 2020-08-01 16:20:01
---

## 目的

Jenkins + Gitlab 实现前端构建

## 正式开始

### Jenkins 安装 NodeJS

因为在 Jenkins 构建的时候我们需要去执行一些 shell，需要用到 NodeJS，因此我们先安装 NodeJS。

在这里我们采用插件方式安装。

#### 在 Jenkins 插件管理中心搜索 NodeJS

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930571244-image.png)

<!-- more -->

我这里已经安装了

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930582615-image.png)

没有安装的话应给在可选插件的 Tab,勾选之后选择直接安装即可。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930592193-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930598660-image.png)

#### 全局配置

在系统设置--系统工具设置可以为全局配置 NodeJS。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930606080-image.png)

选择好对应的版本之后保存即可。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930617174-image.png)

#### 使用

我们只需要在任务的“配置”中，找到“构建环境”，选中 “Provide Node & npm bin/ folder to PATH” ，选择刚才配置好的 NodeJS 即可。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930630463-image.png)

第一次执行会下载对应的 Node 版本，后续不会下载。

### 开始集成

因为集成构建的时候我们需要 Jenkins 去 Gitlab 拉去代码，因此我们需要用 ssh 的方式去鉴权。

#### 生成公钥私钥

Jenkins 拉取，因此要在 Jenkins 上生成，并且将公钥传输到 Gitlab，这样就可以实现鉴权的作用。

```bash
docker exec -it jenkins /bin/bash
ssh-keygen -t rsa
```

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930645747-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930652308-image.png)

#### Gitlab 配公钥

将公钥存入即可

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930663266-image.png)

#### Jenkins 配私钥

在系统管理，管理凭证。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930669759-image.png)

在全局添加凭证

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930675896-image.png)

类型为 “SSH Username with private key.”，ID 为此凭据在 Jenkins 的标识符，UserName 为你的 Gitlab 用户名，PrivateKey 为你的服务器私钥。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930684117-image.png)

**配置完之后最好还是重启一下 jenkins 和 gitlab**

至此，Jenkins 配置完毕。

### 小试牛刀，构建一下

#### 新建任务

选择：构建一个自由风格的软件项目，我这里用的 ssh-way

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930692858-image.png)

#### 配置任务

我这里是临时用的一个 Vue-Cli 搭建的项目演示。

进入任务配置，在任源码管理这里选择 Git

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930700725-image.png)

注意

> 仓库地址为 gitlat 的 ssh 方式
> ![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930709305-image.png)

> 直接复制的地址有两个端口号，要改为 ssh 的 333 端口。[端口为 333 是在之前配置的这个端口号。](https://kitety.github.io/posts/aa4ef8c5.html#%E4%BF%AE%E6%94%B9SSH%E7%AB%AF%E5%8F%A3)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930718459-image.png)

选择对应的 NodeJS 版本

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930729006-image.png)

构建选择--执行 Shell

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930737265-image.png)

填写基本的 shell

```bash
node -v
npm -v
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm install
npm run build
```

保存再立即构建一波。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930745105-image.png)

看到 Finished: SUCCESS，完美。

### 同步到 Nginx 环境

当我们构建成功之后，我们只需要把 Jenkins 的 dist 目录下面的资源全部拷贝到服务器 Nginx 上面就可以实现更新了。而且没有不会变更配置文件，也不用重启 Nginx。

#### 创建文件夹

为了避免我们后续找不到文件夹，我们就先创建秘钥顺便创建文件夹。

```bash
// nginx机器
ssh-keygen -t rsa
```

#### 配置鉴权文件

因为我们已经在 Jenkins 生成过私钥公钥了，我们只需要将这边的文件复制到 Nginx 的`/root/.ssh/authorized_keys`就好了。

```bash
scp -p /root/.ssh/id_rsa.pub root@192.168.182.4:/root/.ssh/authorized_keys
```

第一次需要输入密码，后续都不需要了。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930763078-image.png)

#### 发布到 Nginx

原理很简单，将 build 生成的 dist 的全部文件全部都拷贝到 nginx 的 html 的目录下。（Nginx 资源路径具体要看配置）

在之前的 shell 命令中加入以下命令。

```bash
scp -o "StrictHostKeyChecking no" -r dist/* root@192.168.182.4:/home/nginx/html
```

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930771190-image.png)

#### 修改测试

修改了，提交了，我们构建一下。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930781689-image.png)

构建成功

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930787947-image.png)

完美

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-24/1600930793990-image.png)

## 结语

至此，我们已经完整搭建了 Jenkins + Gitlab 实现前端构建，搭了这么久的环境终于开始实战了。撒花！
