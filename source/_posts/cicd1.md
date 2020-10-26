---
title: CICD实战之基本介绍
abbrlink: '444099e9'
tags:
  - CICD
translate_title: basic-introduction-to-cicd-combat
date: 2020-07-24 23:25:19
---

## 什么是CI/CD
在软件工程中，CI / CD或CICD通常是指持续集成以及持续交付或持续部署的组合实践（[具体](https://www.redhat.com/zh/topics/devops/what-is-ci-cd)）。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175600.png)
<!-- more -->
## 部署方式的区别
### 传统部署
传统部署方式
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175617.png)

缺点：**人工操作，部署速度慢，易出错，版本管理机制差**

### CI/CD
CI/CD 的根本原则就是实现自动化构建部署，解决人工构建部署带来的**效率低，出错率高**等问题。下面是CI/CD的总体流程：

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175633.png)

可以看到一套完整的流程：**代码编写-提交Git-触发代码扫描-触发Jenkins-构建镜像到Hub-服务器拉取镜像部署**

优点：**流程规范、不易出错、效率高**

## 参考资料
> [CI/CD是什么？如何理解持续集成、持续交付和持续部署](https://www.redhat.com/zh/topics/devops/what-is-ci-cd)
> [语雀分享](https://www.yuque.com/docs/share/5a58e274-6b1e-4697-b36d-89d5a152f30e)

