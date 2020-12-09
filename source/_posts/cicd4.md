---
title: CICD实战之Nginx搭建
abbrlink: 342a6d66
tags:
  - CICD
translate_title: cicd-actual-combat-nginx-construction
date: 2020-07-29 10:50:34
---

## 目的

学习 Nginx 的搭建

## 搭建步骤

这次的 Nginx 我们在一台新机器安装

### 安装 docker

[地址](https://kitety.github.io/posts/bc65362f.html#docker-%E4%BB%8B%E7%BB%8D)

#### 配置阿里源

不配置的话速度很慢[地址](https://kitety.github.io/posts/bc65362f.html#%E9%85%8D%E7%BD%AE%E9%98%BF%E9%87%8C%E4%BA%91%E6%BA%90)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200001.png)

<!-- more -->

### 拉取镜像

```bash
docker pull nginx
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200014.png)

### 安装

```bash
mkdir /home/nginx
docker run -itd -p 80:80 --name nginx-test \
  -v /home/nginx/html:/usr/share/nginx/html \
  -v /home/nginx/logs:/var/log/nginx \
  --restart always \
  nginx
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200028.png)

简单修改一下
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200037.png)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200045.png)

## 结语

至此，我们已经完整搭建了 Nginx 环境，下一步我们将联合 Gitlab 和 Jenkins 一起构建，一起期待吧。撒花！
