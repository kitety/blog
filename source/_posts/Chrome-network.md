---
title: Chrome Network面板解析
abbrlink: 1eb8bb25
date: 2020-06-14 19:15:20
tags:
  - Chrome
---

Chrome Console 面板解析

## Network 打开方式

- 在控制台打开的情况选择 Network 按钮
- 输入快捷键`Ctrl+Shift+P`，再输入 `Network`

## 初识面板

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F622cb9e7-efb7-42dd-9944-5eeaaa4e0650%2Fia_10006.png?table=block&id=dc9f2389-ec3f-43d3-b97c-c079ff0bdb8b&width=2020&cache=v2)

<!-- more -->

## 工具栏

工具栏差不多有十个按钮，每个按钮都有不同的功能。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F96aea266-307e-403b-a251-8b7c7f9a3374%2Fia_10007.png?table=block&id=c819fc83-e6a1-42fa-a4b3-5bc76b013bf1&width=2300&cache=v2)

### 启用网络记录

控制是否开启记录网络请求，高亮时开启。

### 清除请求日志

清除当前的网络请求列表

### 请求过滤

点击此按钮会出现过滤栏，接下来对过滤栏进行分析

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F877cc805-6cea-4da5-8e14-7273f25fb593%2Fia_10008.png?table=block&id=59dd5dc0-f3f4-4461-bada-502c407b193d&width=2300&cache=v2)

#### 过滤输入框

#### 类型过滤
##### Hide Data URLs
含义：前缀为 data: 协议的URL，其允许内容创建者向文档中嵌入小文件。简单的例子：用base64展示图片
[demo](https://www.w3docs.com/tools/code-editor/10848)
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/6339bef4-35ad-4b87-93b7-0f9fe70e2e82/ia_10009.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115551Z&X-Amz-Expires=86400&X-Amz-Signature=50b0c34f68b5fd4a7118506a72c1068330494a2e050bc3ffd2407385890e3d92&X-Amz-SignedHeaders=host)
##### 具体类型
后面展示了一些具体的类型All(全部)、XHR(XMLHttpRequest和fetch)、CSS(样式表)、Img(图片资源)、Media(媒体资源)、Font(字体资源)、WS(WebSocket)、MainFest()


### 请求搜索

### 保留请求日志

### 禁用缓存

### 网络情况模拟

### 请求文件的导入导出

### 设置

## 信息总览栏

## 请求区
