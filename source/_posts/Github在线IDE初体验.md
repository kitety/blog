---
title: Github在线IDE初体验
tags:
  - Github
abbrlink: 73c1c21d
date: 2020-10-14 21:21:27
---

之前就有听说Github将推出在线IDE，一搜索发现很多[结果](https://www.google.com.hk/search?q=github+ide+%E5%8F%91%E5%B8%83)。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201014212657.png)

现在Github的在线IDE发布一段时间了，官方命名为：Github Codespaces，今天我们就来体验一下。

<!-- more -->
## 基础体验
在这里，我就拿本博客的仓库来简单体验一下Github Codespaces。
### 创建IDE
在Clone的按钮选择`Open With Codespaces`
![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602682721438-image.png)
进入之后会列出已有的IDE列表，没有的话点击下面的新建就是了。
![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602682784043-image.png)
### 进入IDE
开始进入是在初始化，然后就是同步一些配置，会发现在Vscode的配置和插件扩展都会被同步过来。


![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602682883142-image.png)

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602682955735-image.png)

**并且可以看到，IDE可以自动识别package.json安装依赖，进来就自动安装好了。**

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602683153389-image.png)

点击查看日志还可以查看初始化的日志。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602683024095-image.png)

### 基本使用
#### 预装基础环境
简单的几行代码 我们可以发现IDE已经预装了node、docker、npm、git、python等等基础开发软件。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602690279501-image.png)
#### 启动项目
首先 **全局安装Hexo**```yarn add global hexo```，再启动项目```yarn d```.

因为github的环境在外面，因此安装速度还是很快地，纵享丝滑。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602690553256-image.png)


**外部端口的打开**

如果我们的页面需要启动本地端口，IDE也会提示出来有外部端口。

![image](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-14/1602690647172-image.png)

我们点击在浏览器打开，然后就可以看到页面了。
