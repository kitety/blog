---
title: CICD实战之Nginx搭建
abbrlink: 342a6d66
date: 2020-07-29 10:50:34
tags:
  - CICD
---

## 目的

学习 Nginx 的搭建

## 搭建步骤

这次的 Nginx 我们在一台新机器安装

### 安装 docker

[地址](https://kitety.github.io/posts/bc65362f.html#docker-%E4%BB%8B%E7%BB%8D)
#### 配置阿里源
不配置的话速度很慢[地址](https://kitety.github.io/posts/bc65362f.html#%E9%85%8D%E7%BD%AE%E9%98%BF%E9%87%8C%E4%BA%91%E6%BA%90)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F52cccf78-21ef-4c83-8d84-0cd9ec88429a%2Fia_10003.png?table=block&id=e98172ed-8797-41f1-a335-a6abaee002a0&width=1500&cache=v2)

<!-- more -->
### 拉取镜像
```bash
docker pull nginx
```


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2d162338-9bd3-4853-bd0d-f7e285e9a17e%2Fia_10004.png?table=block&id=4aad9370-480f-48ba-b766-6a1cf1862b2f&width=1480&cache=v2)

### 安装
```bash
mkdir /home/nginx
docker run -itd -p 80:80 --name nginx-test \
  -v /home/nginx/html:/usr/share/nginx/html \
  -v /home/nginx/logs:/var/log/nginx \
  --restart always \
  nginx
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fafaf6ceb-3612-473c-bbfc-893259e0ae13%2Fia_10005.png?table=block&id=2bee5d65-5d3b-4d8f-b80b-a57ec9411b8c&width=3060&cache=v2)

简单修改一下
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbe1b6dbe-370e-482e-ae6f-cb1832726f33%2Fia_10006.png?table=block&id=583afb2b-6079-4c85-b30e-ccecdb657a87&width=850&cache=v2)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F407e7cf3-fdc8-43a9-8793-520d9156467e%2Fia_10007.png?table=block&id=ca8085d5-a176-4311-b946-c27b16e35d35&width=910&cache=v2)

## 结语
至此，我们已经完整搭建了Nginx环境，下一步我们将联合Gitlab和Jenkins一起构建，一起期待吧。撒花！

