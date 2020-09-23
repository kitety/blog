---
title: Chrome Console面板解析
tags:
  - Chrome
abbrlink: f9dc4616
date: 2020-06-04 22:48:15
---

### Console 面板的打开方式

- 在控制台打开的情况选择 console 按钮
- 在 DevTool 的其他面板按 ESC 键打开面板（在开发者工具获得焦点的情况下）
- 在右上角的菜单打开（setting--show--console--drawer）
- 输入快捷键`Ctrl+Shift+P`，再输入 `Console`
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10006.gif)

<!-- more -->

### 初识面板

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172121.png)

#### 面板分析

上面部分为工具栏
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172130.png)

下面部分为命令区

### 工具栏使用方法

#### 展开关闭侧边栏

![ia_10009.gif](https://i.loli.net/2020/09/23/NwpqoC8jKfMcB41.gif)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172330.png)

点击可以切换侧边栏的展示和隐藏，点击一栏可以对命令区的进行过滤。默认是以关闭的，就不会对信息进行过滤。

左侧的分类栏目主要由以下几类:

- message
  全部的信息，就是未分类的信息，是以下信息的综合。
- user message
- errors
  日志级别为 error 的日志
- warning
  日志级别为 warning 的日志
- info
  日志级别为 info 的日志
- verbose
  日志级别为 verbose(冗长) 的日志

前面会显示该栏目总的日志数量，具体的信息会显示在该栏目的子栏目上，比如文件路径，产生日志数量，文件名等

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172403.png)
点击对应的消息会在右侧展示过滤的结果。

#### 清空命令行

点击这个图标<img src="https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172422.png" width="26px" style="display:inline;" class="nofancybox"/>可以清空命令行

列举出可以清空命令行的一些操作

- 右键菜单 Clear Console
- 在命令行输入 clear()
- js 调用 console.clear()
- 快捷键`Ctrl + L`

#### 上下文选择

默认的上下文环境为 top，也就是当前网页打开的环境。你也可以选择切换为你需要你的环境

比如在[这个 iframe 页面](https://7q43c.csb.app/)，你就可以切换环境为 iframe 的环境。

源代码:[源代码 1](https://codesandbox.io/s/upbeat-frog-c6n68?file=/index.html)和[源代码 2](https://codesandbox.io/s/focused-tesla-7q43c?file=/index.html)

当我进入 iframe 的上下文的时候就可以打印出 iframe 里面的数据
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10012.gif)

#### 实时表达式

Live Expressions 实时执行的表达式,可以创建多个表达式，失去焦点就会保存，创建之后也可以删除。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10013.gif)

#### 过滤选项

可以输入文本、正则等对打印的信息进行搜索和过滤。
![ia_10014](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-9-23/1600854061519-ia_10014.gif)

#### 打印级别过滤

打印级别过滤有如下选项：
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172458.png)

> Default: 默认为警告信息和错误
> Verbose: 冗长的的打印
> 其余为常规的信息、警告、错误级别

当过滤级别不是全部展示的话会在右侧显示被隐藏的条数。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172507.png)

#### 设置

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172514.png)

- Hide Network

  是否对有关网络的日志进行隐藏
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10018.gif)

- Log XmlHttpRequests

  是否打印 XHR 请求
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10019.gif)

- Preserve Log
  是否保留日志，每次刷新是否自动清空日志。
- Selected Context Only
  是否只显示当前的上下文环境的日志信息
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10020.gif)

- Group Similar

* Eager Evaluation

  及时显示执行结果
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10021.gif)

- Autocomplete From History

  根据历史记录自动完成命令
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/ia_10022.gif)

- Group Similar
  相同日志归到一个组里面，此选项在禁用日志时间戳事才有效
- Evaluate triggers user activation

### 命令区使用方法

#### 基本使用

- 上一行输入，下一行输出结果
- 键盘的上线键可根据历史记录自动补全

#### 右键菜单

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923172532.png)

- Clear console

  清空命令区

- Clear console history

  清空历史记录，这时上下键的补全将失效

- Save as

  存储当前的日志信息

#### Console Api

参看[MDN 文档](https://developer.mozilla.org/zh-CN/docs/Web/API/Console)和[谷歌文档](https://developers.google.com/web/tools/chrome-devtools/console/api)

#### Console 工具库 Api

整理自[谷歌文档](https://developers.google.com/web/tools/chrome-devtools/console/utilities)

| 语句              | 效果                                                                                                                                     |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| \$\_              | 返回最近执行的结果                                                                                                                       |
| $0-$4             | 日志历史的最近五个 DOM 元素                                                                                                              |
| \$                | document.querySelector(如果引用了 jquery 等库，就会被覆盖为引入的库)                                                                     |
| \$\$              | document.querySelectorAll                                                                                                                |
| \$x               | \$x(path) 返回与给定 XPath 表达式匹配的 DOM 元素数组。                                                                                   |
| clear             | 清除控制台                                                                                                                               |
| copy              | copy(object) 将指定对象的字符串表示形式复制到剪贴板。                                                                                    |
| debug             | 当调用指定的函数时，调试器将被调用并在 Sources 面板上的函数内部中断，从而逐步执行代码并进行调试。                                        |
| dir               | dir(object)显示所有指定对象属性的对象样式列表。此方法是 Console API console.dir()方法的别名。                                            |
| dirxml            | dirxml(object)打印指定对象的 XML 表示形式。此方法等效于 console.dirxml（）方法。                                                         |
| inspect           | inspect(object/function) 打开并在适当的面板中选择指定的元素或对象：DOM 元素的 Elements 面板或 JavaScript 堆对象的 Profiles 面板。        |
| getEventListeners | getEventListeners(object)返回在指定对象上注册的事件                                                                                      |
| keys              | keys(object)返回一个数组，其中包含属于指定对象的属性的名称                                                                               |
| monitor           | 调用指定的函数时，一条消息会记录到控制台，该消息指示函数名称以及调用该函数时传递给该函数的参数。                                         |
| monitorEvents     | 当指定对象上发生指定事件之一时，事件对象将记录到控制台。您可以指定要监视的单个事件，事件数组或映射到预定义事件集合的一般事件“类型”之一。 |

### 参考资源

> https://developers.google.com/web/tools/chrome-devtools/console/utilities
> https://developer.mozilla.org/zh-CN/docs/Web/API/Console
> https://segmentfault.com/a/1190000002511877
> https://zhuanlan.zhihu.com/p/80751021
