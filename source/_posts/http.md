---
title: HTTP协议原理笔记
tags:
  - HTTP
abbrlink: 44c01e4f
translate_title: http-protocol-principle-notes
date: 2020-05-25 21:41:08
---

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200114.png)
## 导学
### 现状
- 现在的WEB开发不理解HTTP
- HTTP相当的重要
- 提升自身价值
<!-- more -->

### 简单的例子
- 输入URL打开网页

- AJAX获取数据

- img标签加载图片

- Cache-control 的public属性和private属性，must-revalidate属性，no-cache，no-store

- 缓存验证

  - last-modified和if-modified-since配合验证
  
  - etag和if-modified-since配合验证
  
  - CORS跨域
  - 浏览器输入URL后HTTP请求返回全过程（下图依据performance对象）
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200127.png)

## 网络协议
### 网络模型介绍

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200237.png)
本文主要讲HTTP（应用层），HTTP基于TCP/IP协议
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
HTTP就在应用层实现
- 为软件提供了很多服务
- 构建与 TCP/IP协议只上
- 屏蔽了网络传输的相关细节

### HTTP协议发展历史

#### HTTP 0.9
- 只支持GET请求
- 没有HEADER等描述数据的信息
- 服务器发送完毕关闭TCP连接

#### HTTP 1.0
- 增加很多命令（POST,HEADER等）
- 增加status code和header
- 多字符集支持、多部分发送、权限、缓存等等

#### HTTP 1.1
- 持久连接

  1.0版本一个请求创建一次TCP连接，服务端返回了TCP连接就关闭，成本较高；持久连接就不用关闭。
  
- pipeline

  同一个链接发送多个请求，发送的请求在一个连接发送多个，服务端进来的请求需要串行排队
  
- 增加host和其他一些命令

  有了host，就可以在同一台物理服务器上跑多个不同WEB服务

#### HTTP 2


- 所有的数据都是以二进制传输

  之前的方式大部分是字符串，因此数据的分片方式是不同的，HTTP2中都是帧传输。
- 同一个连接里面发送多个请求不再需要按照顺序
  
  并行极大提高了效率
- 头信息压缩及推送等提高效率的功能
  
  HTTP2解决HTTP1中性能低下的问题而设计的。
  
  - 头信息压缩
  
  HTTP1中发送请求和返回请求很多的HTTP头都是必须要完整的发送和返回的，而这部分头信息比如header、content-type、cache-control这些字段是用**字符串**形式保存的，所以占用一定的**带宽**。而在HTTP2中就会对头信息压缩，减少带宽使用。
  - 推送
  
  常规的客户端为主动方，服务端为被动方。但是在HTTP2有推送功能，服务端可以主动发起数据传输。常规的html网页是请求html，再请求其中的资源；HTTP2的话可以在你请求html的时候主动推送资源到客户端，达到并行的效果，提高传输效率。
#### HTTP三次握手
在客户端和服务器在进行HTTP的发送和返回过程中，会建立TCP connection。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200251.png)
HTTP不存在连接的概念，只存在请求和响应的概念。请求和响应都传输数据包，会经过一个传输的通道，在TCP就创建了这样一个连接（通道），这个连接会保持在那里，请求是在这个基础之上发送的。在TCP连接上可以发送多个HTTP请求。

这个模式在不同的版本里面有所差别
- HTTP1.0 TCP连接在HTTP请求创建的时候创建服务端想赢回来之后就会关闭
- HTTP1.1 可以声明TCP连接保持状态，多个HTTP请求都通过这个连接。TCP连接创建的过程中有三次握手消耗，减少开销。
- HTTP2.0 并发HTTP请求。比如：同个用户在请求一个网页的时候只用一个TCP连接。
##### 三次握手时序图

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200258.png)
1.客户端发起创建数据包的请求。SYN标志位：创建请求的数据包，Seq=X

2.服务端接收，开启TCP SOCKET端口。返回给客户端：SYN标志位；ACK:接受到的Seq+1，为X+1；Seq：为服务端的Seq。

3.服务端发送。发送ACK=y+1，Seq=Z。

三次握手的目的:防止服务端开启无用的连接。网络服务根据网络传输数据的二次校验，是否有必要开启，数据是否丢失等等。规避网络传输过程延时、丢失等导致的服务器开销。
##### 三次握手数据包举例


![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200307.png)

#### URI、URL、URN
- URI：统一资源标志符（Identity），用来唯一标识互联网上的信息资源，包含URL、URN
- [URL](https://en.wikipedia.org/wiki/URL)：统一资源定位器（Locator）
  ```js
  比如：http：//user:pass@host.com:80/path?query=string#hash
  ```
  具体的格式如下
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923200317.png)
- URN：永久统一资源定位符，资源移动之后还可以找到，目前还没有什么好的方案

#### HTTP报文格式




