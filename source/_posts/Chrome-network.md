---
title: Chrome Network面板解析
abbrlink: 1eb8bb25
tags:
  - Chrome
translate_title: chrome-network-panel-analysis
date: 2020-06-14 19:15:20
---

## Network 打开方式

- 在控制台打开的情况选择 Network 按钮
- 输入快捷键`Ctrl+Shift+P`，再输入 `Network`

## 初识面板

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923175812.png)

<!-- more -->

## 工具栏

工具栏差不多有十个按钮，每个按钮都有不同的功能。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923175847.png)

### 启用网络记录

控制是否开启记录网络请求，高亮时开启。

### 清除请求日志

清除当前的网络请求列表

### 请求过滤

点击此按钮会出现过滤栏，接下来对过滤栏进行分析

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923175907.png)

#### 过滤输入框

#### 类型过滤

##### Hide Data URLs

含义：前缀为 data: 协议的 URL，其允许内容创建者向文档中嵌入小文件。简单的例子：用 base64 展示图片
[demo](https://www.w3docs.com/tools/code-editor/10848)
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_1900000653.gif)

##### 具体类型

后面展示了一些具体的类型 All(全部)、XHR(XMLHttpRequest 和 fetch)、CSS(样式表)、Img(图片资源)、Media(媒体资源)、Font(字体资源)、WS(WebSocket)、MainFest()

### 请求搜索

点击搜索按钮，将会出现搜索侧边栏。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608537844605-image.png)
侧边栏不仅可以搜索`请求地址`、`请求参数`、`头信息`，还可以搜索`响应数据`，简单说来就是可以搜索**请求的所有信息**，感觉还比讲到的`Filter`还要强大，但是不能够针对响应的文件类型做过滤。

以下举例请求地址、Response 数据和 cookie。

![请求地址](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608537986338-image.png)

![Response响应](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538087481-image.png)

![cookie](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538063517-image.png)

### 保留请求日志

`Preserve Log`:是否保留日志，一般的是关闭，代表每次刷新就会清空请求的数据；勾选代表一直保留。

### 禁用缓存

`Disable cache`：是否禁用缓存，发勾选则禁用，否则代表可以使用缓存。

请注意，禁用缓存功能当且仅当开发者工具面板打开的时候有效。

### 网络情况模拟

我们在开发的时候有时候需要用到网速模拟来查看页面的加载情况，Chrome 也很贴心的提供了这个功能。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538559387-image.png)
这里有几项预设：

- Online 默认选项，不对网络进行模拟
- Fast 3G 下载 1.5 Mb/s,延迟 500ms
- Slow 3G 下载 376 kb/s,延迟 2000ms

你也可以选择`Add`自定义添加

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538845190-image.png)

### 请求文件的导入导出

将当前开发者工具的 NetWork 记录的请求记录全部导入和导出的功能，导出生成`HAR`文件,后面也可以导入到开发者工具。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538973115-image.png)

### 设置

点击最右侧的设置按钮将出现设置条目，总共有四个功能：

#### 用更高的行展示请求

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608539961418-image.png)

#### Group by frame 通过请求域名分组

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608540037194-image.png)

#### Show overview 展示请求总览，上面有时间线和请求，可以选择范围

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608539865340-image.png)

#### Capture screenShots 屏幕捕捉

开启之后可以进行屏幕捕捉，双击左键可以放大当前帧的图片，并且底部可以切换

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608540355194-image.png)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608540251524-image.png)

按住`Ctrl`再点击图片，可以看到当当前帧所发出的请求。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608540509955-scr1.gif)

## 信息总览栏

## 请求区
