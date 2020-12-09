---
title: HTTP协议原理笔记
tags:
  - HTTP
abbrlink: 44c01e4f
translate_title: http-protocol-principle-notes
date: 2020-05-25 21:41:08
---

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200114.png)

## 导学

### 现状

- 现在的 WEB 开发不理解 HTTP
- HTTP 相当的重要
- 提升自身价值
<!-- more -->

### 简单的例子

- 输入 URL 打开网页

- AJAX 获取数据

- img 标签加载图片

- Cache-control 的 public 属性和 private 属性，must-revalidate 属性，no-cache，no-store

- 缓存验证

  - last-modified 和 if-modified-since 配合验证

  - etag 和 if-modified-since 配合验证

  - CORS 跨域
  - 浏览器输入 URL 后 HTTP 请求返回全过程（下图依据 performance 对象）
    ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200127.png)

## 网络协议

### 网络模型介绍

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200237.png)
本文主要讲 HTTP（应用层），HTTP 基于 TCP/IP 协议

#### 底三层

- 物理层：定义物理设备如何传输数据

  硬件、网卡端口、光缆

- 数据链路层：通信的实体间建立数据链路连接

  软件服务通过物理设备创建电路的连接

- 网络层：为数据在节点之间传输创建逻辑链路

  访问百度的寻址的逻辑关系

#### 传输层

- 向用户提供可靠的端到端（End-to-End）服务
- 传输层向高层屏蔽了下层数据通信的细节

  比如本地与百度服务器之间的连接，两端如何传输数据，传输数据的方式；根据数据的大小来分包、分片，接收端的组装，两者的协议的定义。

#### 应用层

HTTP 就在应用层实现

- 为软件提供了很多服务
- 构建与 TCP/IP 协议只上
- 屏蔽了网络传输的相关细节

### HTTP 协议发展历史

#### HTTP 0.9

- 只支持 GET 请求
- 没有 HEADER 等描述数据的信息
- 服务器发送完毕关闭 TCP 连接

#### HTTP 1.0

- 增加很多命令（POST,HEADER 等）
- 增加 status code 和 header
- 多字符集支持、多部分发送、权限、缓存等等

#### HTTP 1.1

- 持久连接

  1.0 版本一个请求创建一次 TCP 连接，服务端返回了 TCP 连接就关闭，成本较高；持久连接就不用关闭。

- pipeline

  同一个链接发送多个请求，发送的请求在一个连接发送多个，服务端进来的请求需要串行排队

- 增加 host 和其他一些命令

  有了 host，就可以在同一台物理服务器上跑多个不同 WEB 服务

#### HTTP 2

- 所有的数据都是以二进制传输

  之前的方式大部分是字符串，因此数据的分片方式是不同的，HTTP2 中都是帧传输。

- 同一个连接里面发送多个请求不再需要按照顺序

  并行极大提高了效率

- 头信息压缩及推送等提高效率的功能

  HTTP2 解决 HTTP1 中性能低下的问题而设计的。

  - 头信息压缩

  HTTP1 中发送请求和返回请求很多的 HTTP 头都是必须要完整的发送和返回的，而这部分头信息比如 header、content-type、cache-control 这些字段是用**字符串**形式保存的，所以占用一定的**带宽**。而在 HTTP2 中就会对头信息压缩，减少带宽使用。

  - 推送

  常规的客户端为主动方，服务端为被动方。但是在 HTTP2 有推送功能，服务端可以主动发起数据传输。常规的 html 网页是请求 html，再请求其中的资源；HTTP2 的话可以在你请求 html 的时候主动推送资源到客户端，达到并行的效果，提高传输效率。

#### HTTP 三次握手

在客户端和服务器在进行 HTTP 的发送和返回过程中，会建立 TCP connection。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200251.png)
HTTP 不存在连接的概念，只存在请求和响应的概念。请求和响应都传输数据包，会经过一个传输的通道，在 TCP 就创建了这样一个连接（通道），这个连接会保持在那里，请求是在这个基础之上发送的。在 TCP 连接上可以发送多个 HTTP 请求。

这个模式在不同的版本里面有所差别

- HTTP1.0 TCP 连接在 HTTP 请求创建的时候创建服务端想赢回来之后就会关闭
- HTTP1.1 可以声明 TCP 连接保持状态，多个 HTTP 请求都通过这个连接。TCP 连接创建的过程中有三次握手消耗，减少开销。
- HTTP2.0 并发 HTTP 请求。比如：同个用户在请求一个网页的时候只用一个 TCP 连接。

##### 三次握手时序图

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200258.png) 1.客户端发起创建数据包的请求。SYN 标志位：创建请求的数据包，Seq=X

2.服务端接收，开启 TCP SOCKET 端口。返回给客户端：SYN 标志位；ACK:接受到的 Seq+1，为 X+1；Seq：为服务端的 Seq。

3.服务端发送。发送 ACK=y+1，Seq=Z。

三次握手的目的:防止服务端开启无用的连接。网络服务根据网络传输数据的二次校验，是否有必要开启，数据是否丢失等等。规避网络传输过程延时、丢失等导致的服务器开销。

##### 三次握手数据包举例

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200307.png)

#### URI、URL、URN

- URI：统一资源标志符（Identity），用来唯一标识互联网上的信息资源，包含 URL、URN
- [URL](https://en.wikipedia.org/wiki/URL)：统一资源定位器（Locator）
  ```js
  比如：http：//user:pass@host.com:80/path?query=string#hash
  ```
  具体的格式如下
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200317.png)
- URN：永久统一资源定位符，资源移动之后还可以找到，目前还没有什么好的方案

#### HTTP 报文格式
