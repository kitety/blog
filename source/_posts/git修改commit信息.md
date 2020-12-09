---
title: Git修改Commit信息
abbrlink: 7295d6aa
translate_title: git-modify-commit-information
date: 2020-12-07 13:48:30
tags:
  - Git
---

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607320222725-image.png)

## 背景

在我们的业务开发中，最常见的就是使用`Git`对代码进行版本控制。随之衍生的，就是有可能会遇到修改 Commit Message 的场景，今天我们来总结一下这些基本的操作。

<!-- more -->

## 应用场景

### 准备环境

我们先初始化一个仓库，里面提交一些 commit。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607320677223-image.png)
我这里是有五次提交，分别添加：a,b,c,d,e。

### 修改最近一次的 Commit

```bash
git commit --amend
```

输入之后我们可以进入 vi 编辑模式对 Git Commit 信息进行编辑

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607320804092-image.png)
我们输入`i`编辑，退出是：按键 esc，再在底部输入`:x`即可。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607320903950-image.png)

可以看到，此时最后一个的 commit message 已经修改了。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607320937476-image.png)

### 修改非最后一次的 Commit 信息

比如我们想修改 b 节点-`* be12459 - b (17 minutes ago)`这个节点的信息，我们需要使用到`git rebase`命令。我来简单示范一下。

git rebase 的操作是变基，我们要信息 b 的信息，因此就要变到 b 的前一个：a 的后面，因此我们使用 a 的 hash 来操作

```bash
git rebase -i 8f9a167（目标提交的前一个提交的hash）
```

我们就可以进入一个 vi 编辑的模式

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607321359580-image.png)
我对下面的提示做个简单的翻译

```bash
# p, pick <commit> = 保留commit
# r, reword <commit> = 保留commit, 可以修改信息
# e, edit <commit> = 保留commit，但是要修改提交文件
# s, squash <commit> = 将次commit和前一个commit合并
# f, fixup <commit> = 和squash类似，但是我不保留这次的提交信息
# x, exec <command> = 执行shell
# b, break = 停止在此处 (后续使用 'git rebase --continue')
# d, drop <commit> = 丢弃commit
# l, label <label> = 用名称标记当前HEAD
# t, reset <label> = 重置到某个label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
```

可以发现我们使用`r, reword`就可以达到目的了。
我们修改 b 的操作 tag 为 r，这个时候不用修改 commit 信息，在后面修改。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607321592158-image.png)
接下来会自动进入页面，我们修改 b 的 commit 信息
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607321620974-image.png)
验证下结果，明显成功了。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607321637038-image.png)

### 删除一个 commit 信息

比如此处我要删除 C 的提交信息，**但是保留 C 的文件修改**。我们经过上一步，我们使用 f 就是了。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607322289030-image.png)
结果如下：
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-7/1607322295320-image.png)
发现 C 提交的信息的删除了，但是 C 提交的文件修改还是存在的，所造成的文件修改最终归于 C 的上一个提交：`b-edit`去了。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-8/1607407070868-image.png)

## 结语

简单总结了下平常在工作中遇到的修改 Git commit 信息的方法，留以备忘。
