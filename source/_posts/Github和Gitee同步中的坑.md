---
title: Github和Gitee同步中的坑
tags:
  - Hexo
abbrlink: be3db861
translate_title: pitfalls-in-github-and-gitee-synchronization
date: 2020-10-09 15:50:48
---
最近在做Github Pages到Gitee Pages的同步操作，做个镜像备份

## 仓库同步

我的博客构建使用的是Github Action，因此同步功能使用的是[`wearerequired/git-mirror-action@master`](https://github.com/wearerequired/git-mirror-action)。因为Gitee Page的并不会随着仓库更新主动更新，因此还需要[`yanglbme/gitee-pages-action@master`](https://github.com/yanglbme/gitee-pages-action)做一个build的操作。

<!-- more -->

[具体可以参照我的配置文件](https://github.com/kitety/blog/blob/master/.github/workflows/main.yml)，部分整体配置如下：
```yml
- name: Sync to Gitee
uses: wearerequired/git-mirror-action@master
env:
  # 注意在 Settings->Secrets 配置 GITEE_RSA_PRIVATE_KEY
  SSH_PRIVATE_KEY: ${{ secrets.ACTION_DEPLOY_KEY }}
with:
  # 注意替换为你的 GitHub 源仓库地址
  source-repo: "git@github.com:kitety/kitety.github.io.git"
  # 注意替换为你的 Gitee 目标仓库地址
  destination-repo: "git@gitee.com:kitety/kitety.git"

- name: Build Gitee Pages
uses: yanglbme/gitee-pages-action@master
with:
  # 注意替换为你的 Gitee 用户名
  gitee-username: kitety
  # 注意在 Settings->Secrets 配置 GITEE_PASSWORD
  gitee-password: ${{ secrets.GITEE_PASSWORD }}
  # 注意替换为你的 Gitee 仓库
  gitee-repo: kitety/kitety

```
其中：ACTION_DEPLOY_KEY是私钥，GITEE_PASSWORD是Gitee的密码。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201009155932.png)

## 踩坑
### 第一次同步
第一次同步的时候必须先再自己的电脑上提交上去，就是不要用上面的命令行做第一次提交。

### 登陆问题
开始我的也是跑Github Action没有问题，看起正常。但是在gitee的博客内容不更新，每次跑的时候还有短信的异地登录提醒。

后来发现有人也有相同的[问题](https://github.com/yanglbme/gitee-pages-action/issues/6),仔细看了解决。 

**解决方案**
就是要关注`Gitee（Gitee.com）官方账号`,绑定自己的Gitee账号，后面就会有推送的提醒，这样就可以同步更新了。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201009212425.png)

以上就是解决问题的方法了。