---
title: Chrome Network面板解析
abbrlink: 1eb8bb25
tags:
  - Chrome
translate_title: chrome-network-panel-analysis
date: 2020-06-14 19:15:20
---

Chrome Console 面板解析

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

### 保留请求日志

### 禁用缓存

### 网络情况模拟

### 请求文件的导入导出

### 设置

## 信息总览栏

## 请求区
