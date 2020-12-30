---
title: CICD实战之基本介绍
abbrlink: "444099e9"
tags:
  - CICD
translate_title: basic-introduction-to-cicd-combat
date: 2020-07-24 23:25:19
---

## 什么是 CI/CD

在软件工程中，CI / CD 或 CICD 通常是指持续集成以及持续交付或持续部署的组合实践（[具体](https://www.redhat.com/zh/topics/devops/what-is-ci-cd)）。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-28/1609146550365-image.png)

<!-- more -->

## 部署方式的区别

### 传统部署

传统部署方式
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923175617.png)

缺点：**人工操作，部署速度慢，易出错，版本管理机制差**

### CI/CD

CI/CD 的根本原则就是实现自动化构建部署，解决人工构建部署带来的**效率低，出错率高**等问题。下面是 CI/CD 的总体流程：

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923175633.png)

可以看到一套完整的流程：**代码编写-提交 Git-触发代码扫描-触发 Jenkins-构建镜像到 Hub-服务器拉取镜像部署**

优点：**流程规范、不易出错、效率高**

## 总结
CI持续集成，伴随的是我们的代码产物每次提交，可能会经过一系列流程才会进入发布阶段，在这些流程中有单元测试，规则校验等可以配置的流程单元，我们把这些单元设置为每次代码产物提交都要经过的任务，保持一定频率的触发，这个整体就是CI。

CD持续部署或者持续交付，我们每次的代码产物为的目的就是新的产品更新迭代，而某些分支的提交、合并等操作应该触发新的产品的输出，整个产品随着代码产物在流水线的运行而不断更新，持续迭代，这就是CD。


## 参考资料

> [CI/CD 是什么？如何理解持续集成、持续交付和持续部署](https://www.redhat.com/zh/topics/devops/what-is-ci-cd) 
> 
> [语雀分享](https://www.yuque.com/docs/share/5a58e274-6b1e-4697-b36d-89d5a152f30e)
