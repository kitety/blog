---
title: Chrome Elements面板解析
tags:
  - Chrome
abbrlink: 9430c0ea
date: 2020-05-05 11:00:03
---

### Chrome开发者工具的打开方式

在开始面板分析之前，说下DevTool的打开方式。

- 右键Inspect(Ctrl+Shift+I)
- F12打开(或者光标放在地址栏F12打开)
- Menu -> More tools -> Developer Tools

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F88d8eafe-f628-423c-b630-eb3b93d20db7%2Fia_10006.png?table=block&id=587d28c2-79d9-41bc-9709-90aacfad0854&width=1420&cache=v2)
<!-- more -->
### 初识面板
在打DevTool之后选择Elements就可以打开Elements面板
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff0903299-e588-4f3a-983e-3a520dcc4db0%2Fia_10007.png?table=block&id=37e30b2e-51f3-4be8-8bd1-ab1a14b88ec7&width=3840&cache=v2)

#### 面板分析

最左侧面板为实际网页；在右侧的面板中，主要分为两部分，一部分是左侧的DOM Tree结构，右侧则是属性的子面板。

### DOM面板使用方法
#### 选择元素

选择元素之后，右侧的DOM Tree面板会高亮此元素，底部会显示当前的DOM元素的路径，属性子面板也会展示该元素的属性。

选择元素的方式有几种：
- 在元素上右键审查

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff0a0107c-0dec-46a4-8713-2385c19262b2%2Fia_10008.png?table=block&id=5aa67908-cfab-4d75-b0db-eebd980bfcff&width=1490&cache=v2)

- 使用选择工具在页面审查

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6dca281a-bfb0-4cb9-8434-efc62c7643b6%2Fia_10010.png?table=block&id=6ee4ebd3-7cda-4bf4-949e-34f05ae4c9bf&width=2910&cache=v2)
- 在DOM Tree面板hover选中元素。此时两边的显示是及时联动的，可以及时观察，底部显示了DOM元素路径。


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5efa9cc2-9b77-4a68-95c2-9166c1e13749%2Fia_10011.png?table=block&id=fb695df0-5f43-4677-a29d-4a966c00763b&width=2550&cache=v2)


在元素选中之后，DOM Tree会呈现高亮状态，hover的时候在网页的实际视图也会呈现高亮。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcd43f1f3-7988-4472-af56-0b693a804b06%2FUntitled.png?table=block&id=f15d48f3-37db-423a-b6da-115223fbc456&width=2550&cache=v2)
#### 切换元素
在选择元素之后，可以通过键盘的**上下键**来进行上一级和下一级的选择，**左右键**可以对这个DOM节点进行展开和闭合。
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e3e7ebe1-bd38-43bc-867a-102547d910e0/ia_10012.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120609Z&X-Amz-Expires=86400&X-Amz-Signature=c9e8bbb313c47bcaf7543c255360b562e2e624ff1bc2b43f0e81a785074bff41&X-Amz-SignedHeaders=host)
同时，在选择了元素之后，可以直接输入$0，打印当前的元素。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4106546d-0cca-44a4-92e8-6163b0d41e91%2Fia_10013.png?table=block&id=6571821c-4275-430e-bc76-e18be5b3fb7e&width=3270&cache=v2)

#### 基本编辑操作
所有的属性编辑之后再网页都可以及时看到效果。
##### 文本编辑
在对应的文本上面双击可以快速选择属性，进行修改。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd5d4d239-bf16-46a0-afe3-cc196462f82f%2Fia_10014.png?table=block&id=542d3d9b-21e5-4ac7-813f-aef33e997954&width=2170&cache=v2)
##### 属性编辑

在对应的属性上面双击可以快速选择属性，进行修改。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F57890fdd-ba02-4078-a4a3-491981f1aa84%2Fia_10015.png?table=block&id=87e7e9e3-a09c-414d-bd9b-498ca8cb4144&width=1320&cache=v2)

##### 元素拖拽
选中的元素右键单击按住不放可以拖拽，DOM Tree的结构顺序被改变。
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7baa41bd-c550-49b1-b463-f25b51450f5e/ia_10016.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120609Z&X-Amz-Expires=86400&X-Amz-Signature=a2bc98ddc3610daf6f87681a690986097861a06620fdf7972bff225d18b5cded&X-Amz-SignedHeaders=host)
##### 元素隐藏、删除，恢复
选中元素，按**H**键（英文输入模式下）可以切换元素的显隐，**delete**键可以直接删除DOM节点，**Ctrl+Z**可以恢复上一步的操作。
- 显隐切换
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/1c8d429c-8ec6-44fc-a379-94125b5c83dd/ia_10017.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120621Z&X-Amz-Expires=86400&X-Amz-Signature=3892966e9031bdbf6a649af02acf584203811655e3359234eafe3b206e4795f0&X-Amz-SignedHeaders=host)
- 删除和恢复

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/1efa7f5c-5c7c-4742-a979-1d9b097c9e01/ia_10018.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120611Z&X-Amz-Expires=86400&X-Amz-Signature=eb327f563c63beaa8cc8bf82350c54cb0149fc32d2ccfde7f1530c542dceaafa&X-Amz-SignedHeaders=host)


#### hover效果
##### hover
hover的时候，网页内容会随鼠标位置联动，同时如果是图片元素会显示图片的缩略图和图片地址。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6c71becd-7a80-48dd-84c2-ddfdb39ebbdc%2Fia_10019.png?table=block&id=5ddafd7b-228c-4914-ab1c-19b0a9756707&width=3270&cache=v2)
#### 右键菜单
当我们在DOM tree面板对元素右键的的时候会显示右键菜单。


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F65184f9a-0e24-4a94-b98f-64915a2a1d92%2Fia_10020.png?table=block&id=15c35207-cf3d-4b3b-8ef5-9f1bd4922ea4&width=710&cache=v2)

接下来我们将对右键菜单一一解析。
##### Reveal in Source panel 在资源面板显示（图片、音视频等资源会显示）
##### Open in new tab 在新窗口打开资源（图片、音视频等资源会显示）
##### Add attribute 为当前元素添加属性

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b09310a5-21bc-47ee-9144-b63bc4459ca7/ia_10021.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120608Z&X-Amz-Expires=86400&X-Amz-Signature=81189b4c1b749fc133306a4c66dce059829a65cad82ff113303b34a862378c0a&X-Amz-SignedHeaders=host)

##### Edit as HTML 以HTML方式编辑当前元素

点击其他地方，编辑区域失去焦点就会保存
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/85345d23-ee9d-4360-804a-fd084ddc3fbb/ia_10022.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120608Z&X-Amz-Expires=86400&X-Amz-Signature=f3fae309fbaef6b7db6a3e0c640d6e321c6e6cf2be3a70928c73b5eece811bc2&X-Amz-SignedHeaders=host)

##### Delete Element 删除当前的元素，和键盘的Delete一样

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/efd268cd-4997-4531-86e9-a3cda929c3b6/ia_10023.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120609Z&X-Amz-Expires=86400&X-Amz-Signature=722d9ef878b5e7b7e89f7986e0853bc67a5377ea47fdf6248c6424a75c268c3d&X-Amz-SignedHeaders=host)

##### Copy复制
  ###### Cut element 剪切元素
  **粘贴的时候原来元素会消失**
  
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/72621a64-e563-4a71-8801-d704a9dbfe4b/ia_10024.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=335a92f43c280685461d4116bce16a1bf8384e12f707e8409132db7cc525b61a&X-Amz-SignedHeaders=host)

  ###### Copy element 复制元素
   **粘贴的时候原来元素不会消失**
   
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/81d8d3ca-b889-4e8d-9f43-42673f2adfea/ia_10025.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=0437d6c12360e9a6edf9be25b1d6e496b46c2abde75510d02f441a4474484714&X-Amz-SignedHeaders=host)

  ###### Paste element 粘贴元素（在已复制的情况）
  
  粘贴操作
  ###### Copy outerHTML 复制序列化的HTML片段（[outerHTML](https://developer.mozilla.org/zh-CN/docs/Web/API/Element/outerHTML)）
  
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/cb7c71fc-02b3-49f1-9d59-c7f4ca409407/ia_10026.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=80744687ba931e5bdcbe0da088c6210c630fd36d872ca7cf5d3a76f1249cfab0&X-Amz-SignedHeaders=host)

  ###### Copy selector 复制选择器（可以直接放到选择语句中使用）
  
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/ff4cb4d4-a1e5-4aa7-a477-d0dfe5ad4449/ia_10027.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=6eecb7f0fc03e792d1f2c7974364d59dcb2e299c71d0bddf816695b260202755&X-Amz-SignedHeaders=host)

  ###### Copy JS path 复制JS路径，可以直接使用
  
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f7bf4c8a-4845-4b2c-b01e-4fbcbaabb7a9/ia_10028.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=4e12ccd9b04b8d21da12ce768078d1e6688c6ac2f5a6d1115e53b9c25dccb8f1&X-Amz-SignedHeaders=host)

  ###### Copy styles 复制作用在此元素的样式
  
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af60e7fc-d9cb-43e1-9d9e-83ec0cfa67bc/ia_10029.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120608Z&X-Amz-Expires=86400&X-Amz-Signature=a6c31a0cdf67b1f212622936241650df50422698b3ac13dc69879040297a5cef&X-Amz-SignedHeaders=host)

  ###### Copy XPath 复制元素的XPath
  
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/c64d41df-962e-455c-b46d-6019337faad5/ia_10030.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=b8d65dcd49ffcd70d30647872857cb2714d0573243d44f62a2114da086363dc3&X-Amz-SignedHeaders=host)
  ###### Copy full XPath 复制元素的完整XPath
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/6f6c12a3-b9cf-4afa-8823-20e4b3747e78/ia_10031.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120608Z&X-Amz-Expires=86400&X-Amz-Signature=fd51282ee45f7e30d8f1baeba04f056247d8dda6cca23ad7eb4427b0972329f0&X-Amz-SignedHeaders=host)
  ###### Copy link address 复制当前的连接地址（在图片等媒体元素上会显示）
##### Force state 强制当前元素的状态 
一共有五种
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4b2388fb-3345-4bcc-b7af-9c42df923d65%2Fia_10032.png?table=block&id=565b793b-5e90-430d-8432-6449d2469f85&width=650&cache=v2)
(附： [全部伪类](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Pseudo-classes)、 [简单的demo](https://codesandbox.io/s/crimson-water-3phqw))
  1.:active 激活状态  
  2.:hover 虚指状态  
  3.:focus 获得焦点状态  
  4.:visited 已访问过的链接状态  
  5.:focus-within 元素获得焦点或该元素的后代元素获得焦点的状态
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/35bb120a-5a45-4756-8991-266ab0b700e3/ia_10033.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120615Z&X-Amz-Expires=86400&X-Amz-Signature=e72193da02d811015b5ae94a4019a2272fc84b6f844c6ca11506a22e6c1ac26e&X-Amz-SignedHeaders=host)

##### Brake on 断点
(附：  [简单的demo](https://fewn8.csb.app/))

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F15e49d4b-e86d-49d9-80e5-e8f519332969%2Fia_10034.png?table=block&id=054d2e73-775b-48bd-8142-552ce288a545&width=850&cache=v2)

一共有三种可以为**JS**修改DOM的情况打断点：

1.subtree modification 子节点修改

2.attribute modification 属性修改

3.node removal 节点移除
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/18faba51-01a1-493e-a9df-03a0c8a06d5e/ia_10035.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=41a35647e75482fded2067ebcebbc91551ef4f46cbaf7f82926fd66eda59c55e&X-Amz-SignedHeaders=host)

##### expand recursively 将此节点的每个子节点展开
##### collapse children 将子节点全部折叠

一起演示：
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/32ae82f6-ebbd-4dfd-a471-e8501bd83980/ia_10036.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120619Z&X-Amz-Expires=86400&X-Amz-Signature=133b4d91526eae6ea75531d91a27b2f858615f2937c90bc4431d029f57fd7d47&X-Amz-SignedHeaders=host)

##### Scroll into view 将元素滚动到视图中

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/d0799c1b-fd0a-4010-9556-cf0164dd8148/ia_10037.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120611Z&X-Amz-Expires=86400&X-Amz-Signature=c8c4fd7b3bb6eb785e3d909044d2f8e7ac345930c3fe9443c35c9be089bbb287&X-Amz-SignedHeaders=host)

##### Focus 将在视图中高亮选择的元素，但是不一定在视图显示
##### Store as global variable 将此元素存储为全局变量

接下来就可以像操作JS一样直接操作元素。
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/278015cc-1a16-4bad-92c2-4f5597e57e09/ia_10038.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=77ba36a28c3d0a1a00916e1d76991416085da0b59849f993b845d0ed92fbf538&X-Amz-SignedHeaders=host)

### 属性子面板使用方法

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F16f5024e-d6e8-4b59-9b9f-3aa7e3a00a58%2Fia_10039.png?table=block&id=25087a6c-1a18-4a68-b59a-9dc85f76adc9&width=1090&cache=v2)
#### Styles 
当我们选中元素的时候，右侧子面板就会显示当前元素的Styles面板。这个面板主要有三个部分**Filter栏**、**样式操作栏**、**盒模型栏**

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3297595b-b38a-4e1c-8d14-1ad328184c7f%2Fia_10040.png?table=block&id=152f1161-accc-4cd6-b02b-f20e173aac09&width=1730&cache=v2)
##### Filter栏
可以对元素的样式进行筛选，强制状态，切换class和增加class

过滤操作
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/6c571133-c5d8-4668-ad3a-e6c2c4b5384a/ia_10041.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120619Z&X-Amz-Expires=86400&X-Amz-Signature=22e7c527b96072eee3d67dd6278fae3cfd9c4605df22e85f99dc7b821ce83387&X-Amz-SignedHeaders=host)

强制状态，和右键菜单的区别就是在这里还可以直接看到作用的样式
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/4200c4bc-a027-4840-bfef-7add58ee8762/ia_10042.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120611Z&X-Amz-Expires=86400&X-Amz-Signature=d36d0b6cc601e152fca3aff9df5aaadabd888e1381f9ed723a5b2ca9f4e42657&X-Amz-SignedHeaders=host)

切换、增加class
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/23556037-c6e6-4827-92a6-eb894dbd6fb5/ia_10043.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120608Z&X-Amz-Expires=86400&X-Amz-Signature=93525c01b0c6689147bc5bf224e011b1c748ce422e6fcb31fdc60f9d7a941249&X-Amz-SignedHeaders=host)

增加样式（最右侧）

此处的添加可以下拉添加到已经存在的class中，或者仅仅在开发者工具中
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/57c5cc31-0928-45ba-8091-54aca212a519/ia_10044.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120611Z&X-Amz-Expires=86400&X-Amz-Signature=c220ce054a171621e63b1ee0851664c9fa1db241453cb2053f80a458ffa88bf1&X-Amz-SignedHeaders=host)

##### 样式操作栏
选中一个元素可以出现一下的样式操作面板
###### 样式操作栏概览
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F29761155-5970-42ef-bdbf-b2ff19d03b0a%2Fia_10045.png?table=block&id=d9ea30c7-1ae4-42e3-807e-5dc379c5a3ba&width=930&cache=v2)
- 1：元素行内样式
- 2：元素受class影响的样式
- 3：浏览器默认的样式
- 4：继承的样式，并且有标出继承自何处
###### 操作细节
- 右下角可以新增**文本阴影**，**盒子阴影**，**文字淹死**，**背景色**，**权重更高的class**
- 右上角有显示具体的文件地址
- 单击可以新增css的属性，编辑的时候会有提示
- 双击可以款速选中
- 前面的checkbox可以切换此条样式的作用

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7833da09-ee99-427b-8f54-31db96b9a7b8/ia_10046.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120615Z&X-Amz-Expires=86400&X-Amz-Signature=1053b1d951b4d919327d8cf4142f5244d2e54dca9e80245d761f42a78a0f6b38&X-Amz-SignedHeaders=host)

颜色选择工具
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb0011334-8bb5-489b-8146-8aed9b0f548e%2Fia_10047.png?table=block&id=6ff8e9c9-a79f-4d4b-a504-a0e785ddafba&width=500&cache=v2)
文本阴影编辑
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F913f54a6-f09e-4210-92dc-182e1d47e9d8%2Fia_10048.png?table=block&id=abdc5b16-8f01-44cf-b670-b28a15d69327&width=510&cache=v2)
box-shadow工具
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2bc54da0-29fb-476c-a895-87632e76cdf2%2Fia_10049.png?table=block&id=b012611d-b88a-4add-9ebf-5cecc126aa34&width=510&cache=v2)
##### 盒模型栏 
见Computed面板


#### Computed 
展示当前实际作用在元素的盒模型


![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1592f5fa-6395-4939-87a8-5d33df37cf10%2Fia_10050.png?table=block&id=db4c5abc-2d89-4477-8156-a992a48c53c2&width=920&cache=v2)



一共有三个部分：盒模型，作用样式列表，字体加载
##### 盒模型
展示当前元素的position，margin，padding，border值，在不同的边距上面hover元素会对应的高亮。

直接双击值可以直接修改。
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/54440e78-cfb4-4433-8067-ea3184f30786/ia_10051.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=3934510ac0c579649f51e849766a1fa68b3155879034b73fa6ecd2d8ec71839a&X-Amz-SignedHeaders=host)
##### 作用样式列表
列出作用在元素的列表，可以切换是否展示默认的样式，可以进行filter（同Styles Filter）

##### 字体加载
展示字体加载情况


#### Event Listeners 
 [练习demo](https://jd4oz.csb.app/)
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0a6e8bef-7d15-445d-91f3-013bc0c922b3%2Fia_10052.png?table=block&id=2442ce8d-c0fa-45ad-80c8-8eefb555161e&width=1340&cache=v2)
从左到右，分别为
- 刷新
- 是否显示父元素及祖先元素的事件
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/25296b3e-b51e-47f4-a524-54fe08ef7307/ia_10053.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=55d6914627194e3a2173991e2fc55eae7b24047f0cb4f4c78f173f15e752b801&X-Amz-SignedHeaders=host)

- 事件监听类型选择（被动类型和非阻塞类型）

 Passive event listeners:[**提升页面滑动的流畅度**](https://zhuanlan.zhihu.com/p/24555031)

- 框架绑定的事件监听 

resolve event listeners bound with framework是否看到的是原始的代码
![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/13fefdbc-9790-4b93-9ae3-b205285e4744/ia_10054.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=0713760ed0d6d4d93743e6ed99c506b007347fb82d1eb41ec88e287b1ee5b6c6&X-Amz-SignedHeaders=host)


下面就是绑定元素和具体的代码位置，key是绑定事件名,点击remove可以解绑对应的事件。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc0b06af8-617b-40d6-8c58-1de49afc19c5%2Fia_10055.png?table=block&id=f908f270-1246-4d13-ba60-317ecc1e1e21&width=770&cache=v2)

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/73cd58a7-6f8d-444e-bfbc-6c7c1f179897/ia_10056.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=22d750e3d75f5113498278d7c59fe5a13277f30aa5bb9948c41298e290eb477c&X-Amz-SignedHeaders=host)


#### DOM Breakpoints 
展示出在右键菜单中所打的断点

![](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/71ce8ed2-9dd0-4b6d-8168-c62791ad0e0b/ia_10057.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200802%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200802T120613Z&X-Amz-Expires=86400&X-Amz-Signature=acaf0e19e1ebc918939f762d01081a281d1588310aba04bf112e759332fa0d10&X-Amz-SignedHeaders=host)

#### Properties 
展示所选中元素的各种属性
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F45431f4e-b5a5-44b1-b37b-d7ae3620ac0f%2Fia_10058.png?table=block&id=d2cb1394-a07e-464e-ad0d-552886f2b3ad&width=1620&cache=v2)
如图列举出了当前节点的：
- img#hplogo的属性
- [图片元素的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLImageElement)
- [元素的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLElement)
- [Node的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/Node)
- [EventTarget的属性](https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget)
- [Object的属性](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object)

如果有需要就可以展开详细查看
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd0fe2a65-8198-4724-802b-8c55161ba1ca%2Fia_10059.png?table=block&id=8925aad2-04cf-4275-88dd-539ad58c108c&width=1320&cache=v2)


#### Accessibility
可访问性，[计算机辅助功能](https://zh.wikipedia.org/wiki/%E8%AE%A1%E7%AE%97%E6%9C%BA%E8%BE%85%E5%8A%A9%E5%8A%9F%E8%83%BD)、[无障碍访问](https://developer.mozilla.org/zh-CN/docs/Web/Accessibility/ARIA)



![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F01540e2a-37d6-4099-a905-4dbba2e902e0%2Fia_10060.png?table=block&id=b97767e2-1016-42c4-af21-d55eeddfb728&width=3560&cache=v2)

从上往下依次为：
- 可访问树

可访问性树是DOM树的子集。它仅包含DOM树中与在屏幕阅读器中显示页面内容相关且有用的元素。
- 可访问属性

ARIA属性可确保屏幕阅读器拥有他们需要的所有信息，以正确表示页面的内容
- 最终渲染的属性，计算的可访问性属性

### 结语
以上，就是Chrome Elements面板的全部内容，如有错误，还望各位看官斧正。

预告：Chrome Console面板进行中
