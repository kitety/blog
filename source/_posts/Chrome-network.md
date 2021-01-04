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

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201221173352.png)

我们可以利用输入框来进行过滤搜索，允许通过:`key:value`的形式来进行过滤，多个条件之间使用**空格**进行分隔，并且支持正则匹配。

输入框支持一些默认字段来增强功能，比如`mime-type:image/gif larger-than:1K`可以过滤出大于 1KB 的 GIF 图片。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201221173802.png)
当我们输入对应的键之后，Chrome 会智能将一些可以选择的值作为下拉列表展示出来。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201221174610.png)

具体的字段如下：

- cookie-domain cookie 所在的域
- cookie-name cookie 的键的名字
- cookie-path cookie 所在的目录
- cookie-value cookie 的值
- domain 只展示具体的域名的资源
- has-response-header 显示包含指定 HTTP 响应标头的资源
- is 使用`is:running`匹配`WebSocket`资源
- larger-than 过滤出资源比指定值大的资源
- method 请求方法过滤
- mime-type MIME type 过滤
- mixed-content HTTP 和 HTTPS 混合页面过滤[相关](https://developer.mozilla.org/zh-TW/docs/Web/Security/Mixed_content#Mixed_active_content)
- priority 优先级与指定值匹配
- resource-type 资源类型过滤
- scheme HTTP/HTTPS 过滤
- set-cookie-domain 根据 set-Cookie 的 Domain 过滤
- set-cookie-name 根据 set-Cookie 的 name 过滤
- set-cookie-value 根据 set-Cookie 的 value 过滤
- status-code 状态码过滤
- url 请求 URL 过滤

#### 类型过滤

##### Hide Data URLs

含义：前缀为 data: 协议的 URL，其允许内容创建者向文档中嵌入小文件。简单的例子：用 base64 展示图片
[demo](https://www.w3docs.com/tools/code-editor/10848)
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_1900000653.gif)

##### 具体类型

后面展示了一些具体的类型 All(全部)、XHR(XMLHttpRequest 和 fetch)、CSS(样式表)、Img(图片资源)、Media(媒体资源)、Font(字体资源)、WS(WebSocket)、MainFest()

### 请求搜索

点击搜索按钮，或者在 Network 面板按快捷键`Ctrl+F`,将会出现搜索侧边栏。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608537844605-image.png)
侧边栏不仅可以搜索`请求地址`、`请求参数`、`头信息`，还可以搜索`响应数据`，简单说来就是可以搜索**请求的所有信息**，感觉还比讲到的`Filter`还要强大，但是不能够针对响应的文件类型做过滤。

以下举例请求地址、Response 数据和 cookie。

![请求地址](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608537986338-image.png)

![Response响应](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538087481-image.png)

![cookie](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608538063517-image.png)

### 保留请求日志

`Preserve Log`:是否保留日志，一般的是关闭，代表每次刷新就会清空请求的数据；勾选代表一直保留，可以跨页面保留。

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

按住`Ctrl`再点击图片，可以看到当前帧所发出的请求。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-21/1608540509955-scr1.gif)

## 信息总览栏

信息总览栏列出了一些页面加载情况的参数和指标，一共有`requests`、`transferred`、`resources`、`Finish`、`DOMContentLoaded`、`Load`等字段。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201221171308.png)

### 含义解析

- requests 记录的是请求的数量
- transferred 所有资源的压缩大小
- resources 所有资源未压缩的大小
- Finish 页面上所有 http 请求发送到响应完成的时间总和
- DOMContentLoaded DOM 树构建完成。
- Load 页面加载完毕。

### Filter

当与`Filter`搭配的时候，可以过滤出当前类型的所占全部请求的数据。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201221171911.png)

## 请求区

请求区总体可以看似一个表格，其中表头的列可以进行拖拽直到达到你想展示的效果，表头的项目是可以进行筛选和排序的。

### 表头分析

在表头右键可以展示出表头项目（在请求区域右键也可以调出）,可以通过单击来切换是否展示表头项。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609744994318-image.png)

#### 基本表头

具体含义如下:

| 表头 | 表头 |
| :----: | :----: |
| Name | 资源的文件名或者唯一标识符 |
| Path | 请求路径 |
| Url | 请求完整地址 |
| Method | 请求方法 |
| Status | HTTP 状态码 |
| Protocol | 请求协议 |
| Scheme | 请求方法 http/https 等等 |
| Domain | 域名 |
| Remote Address | 远程地址 |
| Type | 请求资源的 MIME type |
| Initator | 发起请求的对象或者流程（Html Parser、http 重定向、JS 函数、其他-比如新网址输入） |
| Cookies | 发送 cookie 数量 |
| Set Cookies | 请求的响应设置 cookie 数量 |
| Size | 响应头的大小和响应体的大小，若从缓存中获取会显示 disk cache/memory cache 等 |
| Time | 请求开始到响应中最后一个字节接收的总持续时间 |
| Priority | 优先级 |
| Waterfall | 每个请求活动的可视化分解 |
| Connection ID | 链接 ID |

##### 其他释义

- Sort By 设置排序的依据，可以是表头中的项目，这个和双击表头项目的作用是一样的。
- Reset Columns 重置表头的宽度
- Response Headers

  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609745184616-image.png)
  可以在表头显示 Cache-Control 等响应头信息，你还可以点击底部的`Manage Header Columns`编辑头信息
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609745286619-image.png)

- Waterfall
  展示的是请求的时间分布，用柱状的形式展示出来。目前可以展示出以下的时间，具体的释义在后面有详细的阐述。

  - Start Time 开始时间
  - Response Time 响应时间
  - End Time 结束时间
  - Total Duration 总共耗时
  - Latency 延迟

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609745498940-image.png)

### 请求区分析

#### 请求区概览

下图是访问谷歌官网的实例，其中大多数项目是可以像 Name 一样，hover 就可以看到详情。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609746895024-image.png)
其中：

- Initator hover 的时候会显示具体的触发调用栈
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609747118058-image.png)
- Waterfall hover 的时候会显示一些指标


![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609748268570-image.png)


#### Waterfall 指标
|表头|表头|
|:----:|:----:|
|Queuedat|执行到Initator的时间|
|Startedat|开始请求流程的时间|
|Queueing|排队：已有高优先级的请求、已经达到了TCP链接数量、浏览器正在磁盘缓存中短暂分配空间|
|Stalled|由于排队而停下来等待的时间|
|DNSLookup|DNS查找IP|
|Initialconnection|初始化链接|
|Proxynegotiation|代理协商|
|Requestsent|请求发送|
|ServiceWorkerPreparation|浏览器准备启动ServiceWorker|
|RequesttoServiceWorker|向ServiceWorker发送请求|
|Waiting(TTFB)|第一个字节返回的时间。TTFB代表到第一个字节的时间。此时间包括一次往返延迟和服务器准备响应所花费的时间。|
|ContentDownload|浏览器正在接收响应|
|ReceivingPush|浏览器正在通过HTTP/2服务器推送接收数据|
|ReadingPush|浏览器正在读取先前接收的本地数据|
#### 单个请求选中分析
当我们选择一个请求事，右侧面板会展示出这个请求的信息。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609749026512-image.png)
一共有以下几项：
- Headers 请求的头信息，包含Query参数和Post数据，请求头响应头等详见[HTTP Header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)
- Preview 对返回的数据格式化预览
- Response 展示返回的原始数据
- Initator 同表头Initator
- Cookies 同表头Cookies
- Timing 同Waterfall
#### 单个请求右键分析
当我们选择一个请求右键的时候会弹出菜单

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609750559655-image.png)
我们来具体分析：
- Open in new tab 在新窗口打开，这个和双击某个请求的行为是一样的，都是打开新窗口GET请求
- Clear browser cache 清楚浏览器缓存
- Clear browser cookies 清楚浏览器cookies
- Copy 复制此请求，会展开二级菜单
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609751200913-image.png)
  - Copy link address 复制链接地址
  - Copy as Powershell 复制为Powershell 命令
  - Copy as fetch 复制为fetch函数
  - Copy as Nodejs fetch 复制为Nodejs fetch函数
  - Copy as cURl(cmd) 复制cmd执行的命令
  - Copy as cURl(bash) 复制bash执行的命令
  - ... 后面五个为将全部的请求复制为对应的模式
  - Copy all as HAR 将所有请求复制为HAR内容格式（还是文本）
- Block request URL 禁止请求此地址，禁止之后在相同位置可以启用，禁止之后无法访问该请求。
  
  可以进入`network request blocking`面板查看已经禁止的请求
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2021-1-4/1609752010644-image.png)
- Block request Domain 禁止请求此域名
  可以进入`network request blocking`面板查看已经禁止的域名
- Replay XHR 重发此请求
- Sort By 设置排序依据
- Header Options 设置表头项目
- Save all as HAR with content 同“导出”功能，将请求导出为HAR文件







## 引用地址

> [https://developers.google.com/web/tools/chrome-devtools/network/reference](https://developers.google.com/web/tools/chrome-devtools/network/reference)
