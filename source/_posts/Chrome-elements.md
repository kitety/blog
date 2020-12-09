---
title: Chrome Elements面板解析
tags:
  - Chrome
abbrlink: 9430c0ea
translate_title: chrome-elements-panel-analysis
date: 2020-05-05 11:00:03
---

### Chrome 开发者工具的打开方式

在开始面板分析之前，说下 DevTool 的打开方式。

- 右键 Inspect(Ctrl+Shift+I)
- F12 打开(或者光标放在地址栏 F12 打开)
- Menu -> More tools -> Developer Tools

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192035.png)

<!-- more -->

### 初识面板

在打 DevTool 之后选择 Elements 就可以打开 Elements 面板
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192117.png)

#### 面板分析

最左侧面板为实际网页；在右侧的面板中，主要分为两部分，一部分是左侧的 DOM Tree 结构，右侧则是属性的子面板。

### DOM 面板使用方法

#### 选择元素

选择元素之后，右侧的 DOM Tree 面板会高亮此元素，底部会显示当前的 DOM 元素的路径，属性子面板也会展示该元素的属性。

选择元素的方式有几种：

- 在元素上右键审查

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192155.png)

- 使用选择工具在页面审查
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192204.png)
- 在 DOM Tree 面板 hover 选中元素。此时两边的显示是及时联动的，可以及时观察，底部显示了 DOM 元素路径。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192215.png)

在元素选中之后，DOM Tree 会呈现高亮状态，hover 的时候在网页的实际视图也会呈现高亮。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192227.png)

#### 切换元素

在选择元素之后，可以通过键盘的**上下键**来进行上一级和下一级的选择，**左右键**可以对这个 DOM 节点进行展开和闭合。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600860508428-ia_10012.gif)
同时，在选择了元素之后，可以直接输入$0，打印当前的元素。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192850.png)

#### 基本编辑操作

所有的属性编辑之后再网页都可以及时看到效果。

##### 文本编辑

在对应的文本上面双击可以快速选择属性，进行修改。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192905.png)

##### 属性编辑

在对应的属性上面双击可以快速选择属性，进行修改。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923192928.png)

##### 元素拖拽

选中的元素右键单击按住不放可以拖拽，DOM Tree 的结构顺序被改变。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10016.gif)

##### 元素隐藏、删除，恢复

选中元素，按**H**键（英文输入模式下）可以切换元素的显隐，**delete**键可以直接删除 DOM 节点，**Ctrl+Z**可以恢复上一步的操作。

- 显隐切换
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10017.gif)
- 删除和恢复
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600860698279-ia_10018.gif)

#### hover 效果

##### hover

hover 的时候，网页内容会随鼠标位置联动，同时如果是图片元素会显示图片的缩略图和图片地址。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923193201.png)

#### 右键菜单

当我们在 DOM tree 面板对元素右键的的时候会显示右键菜单。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923193213.png)

接下来我们将对右键菜单一一解析。

##### Reveal in Source panel 在资源面板显示（图片、音视频等资源会显示）

##### Open in new tab 在新窗口打开资源（图片、音视频等资源会显示）

##### Add attribute 为当前元素添加属性

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600860770382-ia_10021.gif)

##### Edit as HTML 以 HTML 方式编辑当前元素

点击其他地方，编辑区域失去焦点就会保存

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600860994416-ia_10022.gif)

##### Delete Element 删除当前的元素，和键盘的 Delete 一样

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861077498-ia_10023.gif)

##### Copy 复制

###### Cut element 剪切元素

**粘贴的时候原来元素会消失**

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861109023-ia_10024.gif)

###### Copy element 复制元素

**粘贴的时候原来元素不会消失**

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861135705-ia_10025.gif)

###### Paste element 粘贴元素（在已复制的情况）

粘贴操作

###### Copy outerHTML 复制序列化的 HTML 片段（[outerHTML](https://developer.mozilla.org/zh-CN/docs/Web/API/Element/outerHTML)）

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861179087-ia_10026.gif)

###### Copy selector 复制选择器（可以直接放到选择语句中使用）

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861215618-ia_10027.gif)

###### Copy JS path 复制 JS 路径，可以直接使用

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861240014-ia_10028.gif)

###### Copy styles 复制作用在此元素的样式

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861263916-ia_10029.gif)

###### Copy XPath 复制元素的 XPath

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861288306-ia_10030.gif)

###### Copy full XPath 复制元素的完整 XPath

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-9-23/1600861309572-ia_10031.gif)

###### Copy link address 复制当前的连接地址（在图片等媒体元素上会显示）

##### Force state 强制当前元素的状态

一共有五种
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923194429.png)
(附： [全部伪类](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Pseudo-classes)、 [简单的 demo](https://codesandbox.io/s/crimson-water-3phqw))
1.:active 激活状态  
 2.:hover 虚指状态  
 3.:focus 获得焦点状态  
 4.:visited 已访问过的链接状态  
 5.:focus-within 元素获得焦点或该元素的后代元素获得焦点的状态
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10033.gif)

##### Brake on 断点

(附： [简单的 demo](https://fewn8.csb.app/))

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923194446.png)

一共有三种可以为**JS**修改 DOM 的情况打断点：

1.subtree modification 子节点修改

2.attribute modification 属性修改

3.node removal 节点移除
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10035.gif)

##### expand recursively 将此节点的每个子节点展开

##### collapse children 将子节点全部折叠

一起演示：
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10036.gif)

##### Scroll into view 将元素滚动到视图中

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10037.gif)

##### Focus 将在视图中高亮选择的元素，但是不一定在视图显示

##### Store as global variable 将此元素存储为全局变量

接下来就可以像操作 JS 一样直接操作元素。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10038.gif)

### 属性子面板使用方法

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923194836.png)

#### Styles

当我们选中元素的时候，右侧子面板就会显示当前元素的 Styles 面板。这个面板主要有三个部分**Filter 栏**、**样式操作栏**、**盒模型栏**

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923194844.png)

##### Filter 栏

可以对元素的样式进行筛选，强制状态，切换 class 和增加 class

过滤操作
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10041.gif)

强制状态，和右键菜单的区别就是在这里还可以直接看到作用的样式
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10042.gif)
切换、增加 class
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10043.gif)

增加样式（最右侧）

此处的添加可以下拉添加到已经存在的 class 中，或者仅仅在开发者工具中
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10044.gif)

##### 样式操作栏

选中一个元素可以出现一下的样式操作面板

###### 样式操作栏概览

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195025.png)

- 1：元素行内样式
- 2：元素受 class 影响的样式
- 3：浏览器默认的样式
- 4：继承的样式，并且有标出继承自何处

###### 操作细节

- 右下角可以新增**文本阴影**，**盒子阴影**，**文字淹死**，**背景色**，**权重更高的 class**
- 右上角有显示具体的文件地址
- 单击可以新增 css 的属性，编辑的时候会有提示
- 双击可以款速选中
- 前面的 checkbox 可以切换此条样式的作用

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10046.gif)

颜色选择工具
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195153.png)
文本阴影编辑
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195201.png)
box-shadow 工具
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195208.png)

##### 盒模型栏

见 Computed 面板

#### Computed

展示当前实际作用在元素的盒模型

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195221.png)

一共有三个部分：盒模型，作用样式列表，字体加载

##### 盒模型

展示当前元素的 position，margin，padding，border 值，在不同的边距上面 hover 元素会对应的高亮。

直接双击值可以直接修改。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10051.gif)

##### 作用样式列表

列出作用在元素的列表，可以切换是否展示默认的样式，可以进行 filter（同 Styles Filter）

##### 字体加载

展示字体加载情况

#### Event Listeners

[练习 demo](https://jd4oz.csb.app/)
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195248.png)
从左到右，分别为

- 刷新
- 是否显示父元素及祖先元素的事件
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10053.gif)
- 事件监听类型选择（被动类型和非阻塞类型）

Passive event listeners:[**提升页面滑动的流畅度**](https://zhuanlan.zhihu.com/p/24555031)

- 框架绑定的事件监听

resolve event listeners bound with framework 是否看到的是原始的代码
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10054.gif)

下面就是绑定元素和具体的代码位置，key 是绑定事件名,点击 remove 可以解绑对应的事件。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195345.png)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10056.gif)

#### DOM Breakpoints

展示出在右键菜单中所打的断点

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/ia_10057.gif)

#### Properties

展示所选中元素的各种属性
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195449.png)
如图列举出了当前节点的：

- img#hplogo 的属性
- [图片元素的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLImageElement)
- [元素的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLElement)
- [Node 的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/Node)
- [EventTarget 的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget)
- [Object 的属性](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object)

如果有需要就可以展开详细查看
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195458.png)

#### Accessibility

可访问性，[计算机辅助功能](https://zh.wikipedia.org/wiki/%E8%AE%A1%E7%AE%97%E6%9C%BA%E8%BE%85%E5%8A%A9%E5%8A%9F%E8%83%BD)、[无障碍访问](https://developer.mozilla.org/zh-CN/docs/Web/Accessibility/ARIA)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923195505.png)

从上往下依次为：

- 可访问树

可访问性树是 DOM 树的子集。它仅包含 DOM 树中与在屏幕阅读器中显示页面内容相关且有用的元素。

- 可访问属性

ARIA 属性可确保屏幕阅读器拥有他们需要的所有信息，以正确表示页面的内容

- 最终渲染的属性，计算的可访问性属性

### 结语

以上，就是 Chrome Elements 面板的全部内容，如有错误，还望各位看官斧正。

预告：Chrome Console 面板进行中
