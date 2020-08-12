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
  ![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8ba63b12-9011-4489-b75d-32e70931f245/ia_10006.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=1e26fd27ec4bc21bcf8bc186962d9afeaecad3bc8c051bcdd7bea728cf847e20&X-Amz-SignedHeaders=host)

<!-- more -->

### 初识面板

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7470e1fc-93f0-492c-9cea-c11b7068fd42%2Fia_10007.png?table=block&id=62bf3817-6748-4b5d-9518-a9b547867b96&width=1920&cache=v2)

#### 面板分析

上面部分为工具栏
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F56d70051-22cb-4c15-abf3-ca8c6029b9e8%2Fia_10008.png?table=block&id=9ca55a30-451c-4b8c-a9a7-fe4c87edb887&width=1930&cache=v2)

下面部分为命令区

### 工具栏使用方法

#### 展开关闭侧边栏

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/034a84f7-ff09-405e-b6af-06de66942d03/ia_10009.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=851b378ec7adbca42c456284dea0d4388a5a799e36bf932986a47c9c09a67444&X-Amz-SignedHeaders=host)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe8420630-3a03-4d41-8c17-2d1063e314c7%2Fia_10010.png?table=block&id=6740a6fd-97b5-4578-ae55-0445061ee7e4&width=680&cache=v2)

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

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F30bf9c56-64a7-44bb-baf6-abfceed31b25%2Fia_10011.png?table=block&id=5e7f4801-3e35-4ca4-93f6-1727bf458708&width=700&cache=v2)
点击对应的消息会在右侧展示过滤的结果。

#### 清空命令行



点击这个图标<img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F55c4ba90-12e5-4c8d-a444-d8ffb6b7f358%2Fia_2100000923.png?table=block&id=1ae230a7-f71a-45be-9951-8d43de1c045d&width=50&cache=v2" width="26px" style="display:inline;" class="nofancybox"/>可以清空命令行

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
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fdf54ba8-dd56-4935-91a7-48e27e925e69/ia_10012.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=b8423d8019790b366f5b5bdd6d0e4e362cde07b8944d266fe6628196277fd106&X-Amz-SignedHeaders=host)

#### 实时表达式

Live Expressions 实时执行的表达式,可以创建多个表达式，失去焦点就会保存，创建之后也可以删除。
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b1aa84a6-3ab9-422f-baa9-c418116ad139/ia_10013.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115737Z&X-Amz-Expires=86400&X-Amz-Signature=b8685e3549955cb117e7f972ce598da2cb7dd0eee955908e92301c4e5fdaeb96&X-Amz-SignedHeaders=host)

#### 过滤选项

可以输入文本、正则等对打印的信息进行搜索和过滤。
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/215c7214-05c2-4942-9a87-8178f6d3963b/ia_10014.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115741Z&X-Amz-Expires=86400&X-Amz-Signature=afc8c7784fb56c4fc1510841bbebba79c83669142da5881f49dc72d6ec52a0ff&X-Amz-SignedHeaders=host)

#### 打印级别过滤

打印级别过滤有如下选项：
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ffc4a5e0a-2696-4f9c-880a-84e39248de52%2Fia_10015.png?table=block&id=43688014-9914-4393-a871-6bbac1d767a1&width=410&cache=v2)

> Default: 默认为警告信息和错误
> Verbose: 冗长的的打印
> 其余为常规的信息、警告、错误级别

当过滤级别不是全部展示的话会在右侧显示被隐藏的条数。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ffa7b507d-e454-42b5-ad81-3b2258214889%2Fia_10016.png?table=block&id=a35c0070-26d1-447c-affd-cf56d6649f5c&width=760&cache=v2)

#### 设置

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F397dfef1-b042-4c2f-927b-9f0a56425e83%2Fia_10017.png?table=block&id=3a8c1228-853c-42c4-9ddf-8bf3029abc2b&width=1650&cache=v2)

- Hide Network

  是否对有关网络的日志进行隐藏
  ![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8707384d-69e4-4cce-9cd5-e967263c4196/ia_10018.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=4f67283fda5edcbfd75d6da5df7d7a3c9ec75c138a6ffeafae410dbf65d38940&X-Amz-SignedHeaders=host)

- Log XmlHttpRequests

  是否打印 XHR 请求
  ![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/391789bb-5628-456a-bb19-d0e41c47eec9/ia_10019.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=22889ab308ca051dd3433ff47784ff13320f826aade3050f3216aafcaced029e&X-Amz-SignedHeaders=host)

- Preserve Log
  是否保留日志，每次刷新是否自动清空日志。
- Selected Context Only
  是否只显示当前的上下文环境的日志信息
  ![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8c250f18-9319-48c7-990e-91352f122ee2/ia_10020.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=23a1f71fe038c887a07bd2082d4f25e0f092dca12fa8387d7ea444a407cf8447&X-Amz-SignedHeaders=host)

- Group Similar

* Eager Evaluation

  及时显示执行结果
  ![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b670800f-02cb-4ea7-85d5-f2723abe5385/ia_10021.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115737Z&X-Amz-Expires=86400&X-Amz-Signature=768c3aed17c957d1050ea17ab04e3686d417e03e9c1e44c11e2df61ef25715b7&X-Amz-SignedHeaders=host)

- Autocomplete From History

  根据历史记录自动完成命令
  ![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f6512128-e4e9-4c64-abc0-345a15018d17/ia_10022.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T115738Z&X-Amz-Expires=86400&X-Amz-Signature=c3daf203f4632020f01d5c68314c0b5413f48be192d8fef281234b6f87b135f8&X-Amz-SignedHeaders=host)

- Group Similar
  相同日志归到一个组里面，此选项在禁用日志时间戳事才有效
- Evaluate triggers user activation

### 命令区使用方法

#### 基本使用

- 上一行输入，下一行输出结果
- 键盘的上线键可根据历史记录自动补全

#### 右键菜单


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7d8dea17-f9cd-498c-b270-c5178fdd89a6%2Fia_2100000900.png?table=block&id=2e591d09-3b01-41ec-a1b9-4f3565cd8995&width=360&cache=v2)

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
| $_                | 返回最近执行的结果                                                                                                                       |
| $0-$4             | 日志历史的最近五个DOM元素                                                                                                                |
| $                 | document.querySelector(如果引用了jquery等库，就会被覆盖为引入的库)                                                                                                                   |
| $$                | document.querySelectorAll                                                                                                                |
| $x                | $x(path) 返回与给定XPath表达式匹配的DOM元素数组。                                                                                        |
| clear             | 清除控制台                                                                                                                               |
| copy              | copy(object) 将指定对象的字符串表示形式复制到剪贴板。                                                                                    |
| debug             | 当调用指定的函数时，调试器将被调用并在Sources面板上的函数内部中断，从而逐步执行代码并进行调试。                                          |
| dir               | dir(object)显示所有指定对象属性的对象样式列表。此方法是Console API console.dir()方法的别名。                                             |
| dirxml            | dirxml(object)打印指定对象的XML表示形式。此方法等效于 console.dirxml（）方法。                                                           |
| inspect           | inspect(object/function) 打开并在适当的面板中选择指定的元素或对象：DOM元素的Elements面板或JavaScript堆对象的Profiles面板。               |
| getEventListeners | getEventListeners(object)返回在指定对象上注册的事件                                                                                      |
| keys              | keys(object)返回一个数组，其中包含属于指定对象的属性的名称                                                                               |
| monitor           | 调用指定的函数时，一条消息会记录到控制台，该消息指示函数名称以及调用该函数时传递给该函数的参数。                                         |
| monitorEvents     | 当指定对象上发生指定事件之一时，事件对象将记录到控制台。您可以指定要监视的单个事件，事件数组或映射到预定义事件集合的一般事件“类型”之一。 |


### 参考资源
> https://developers.google.com/web/tools/chrome-devtools/console/utilities
> https://developer.mozilla.org/zh-CN/docs/Web/API/Console
> https://segmentfault.com/a/1190000002511877
> https://zhuanlan.zhihu.com/p/80751021
