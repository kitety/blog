---
title: 实现自己的React之渲染字符串和数字
abbrlink: 8bb7b5c2
translate_title: realize-your-own-react-rendering-strings-and-numbers
date: 2020-10-28 19:59:23
tags:
---

## 前言

在上一篇文章中我们已经渲染了我们的字符串到 id 为 root 的元素上，但是用的是直接操作 DOM，我们会在后面逐渐的完善它。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201028205234.png)

<!-- more -->

## 问题和解决方案

### 遇到的问题

我们上次的操作是直接操作 DOM 来放入字符串或者数字，但是后面我们还会传入 DOM 元素和 class，因此不能够统一处理，**我们需要根据不同的类型来做与之对应的处理**。

除此之外，我们还提到了要为每个 DOM 元素添加属性增加唯一值，以便后续查找和更新。

### 解决办法

- 我们会将传入的元素传入一个工厂函数
- 这个工厂函数里面会根据类型的不同而返回对应的实例 unit
- 实例上面有个属性 getMarkup，我们可以传入唯一的 key 用来放在属性上，返回一个字符串。
- 最后将字符串放入到 container（比如之前 id 为 root 的元素）。

大体示意图如下

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201028202228.png)

## 渲染字符串和数字

**字符串和数字是一样的逻辑，因此我就用字符串举例**

修改目录结构

```
▇
E:\study\my-react-15.x
├── package.json
├── public
├── README.md
├── src
|  ├── index.js
|  └── react
|     ├── index.js
|     └── unit.js //新增的文件
└── yarn.lock
```

#### index.js

我们先修改 react/index.jsx 下面的 render 方法

```js
function render(element, container) {
  // 最重要的形式container.innerHTML = `<span data-reactid="xxx-id">${element}</span>`
  // 传入元素 返回对应的unit(对象实例),上面有个getMarkUp方法，传入id可以获得字符串

  // unit 负责渲染 主要用来将元素转换为html字符串
  let unit = createUnit(element); // createUnit就是要引入的工厂函数
  let markUp = unit.getMarkUp(0); // 返回HTML标记 简单示例，从0开始
  $(container).html(markUp);
}
```

#### unit.js

我们这个文件就是根据传入的 element，根据类型返回对象实例。

##### 工厂函数

首先我们创建 createUnit 工厂函数

```js
function createUnit(element) {
  // 先是处理字符串和数字 根绝typeof
  if (["number", "string"].includes(typeof element)) {
    return new TextUint(element);
  }
}
```

##### TextUint

我们是要根据不同的类型来处理，因此最少有三种类型，我们在这里用一个 Unit 的 class 作为基类，有点像 TS 的抽象类，具体的实现用具体的类去继承。

```js
// 基类 不可以实例化
class Unit {
  constructor(element) {
    // 挂载在下划线 私有属性
    // 实例存一份
    this._currentElement = element;
  }
}
```

接下来我们来写具体操作文本的 class

```js
// 文本的类 处理字符串和数字
class TextUint extends Unit {
  // 传入id 返回字符串
  getMarkUp(reactId) {
    // id存一份在示例上
    this._reactId = reactId;
    // 因为要添加属性，所以用span包装一下，上面添加data-reactid属性，值为reactId，里面的元素就是实例的时候element，可以从this上面获取
    return `<span data-reactid="${reactId}">${this._currentElement}</span>`;
  }
}
```

然后再暴露出这个工厂函数，在 index.js 引入就可以跑起来了。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-29/1603947047283-image.png)

[代码地址](https://github.com/kitety/my-react-15.x/tree/9ee49e3356fe330cebecd7b189efddc8db1bca19)

## 结语

至此，我们用比较规整的方式实现了渲染字符串和数字，接下来我们将渲染原生 DOM。
