---
title: 实现自己的React之基础准备
tags:
  - React
abbrlink: a222758f
translate_title: basic-preparation-for-implementing-your-own-react
date: 2020-10-27 20:54:36
---

## 前言

现在的工作中已经用过[React](https://reactjs.org/)一段时间了，然后就想好好深入学习一下，尝试着写一个简单的 demo 来体验一下。
学习事物都有个过程，大概是了解、熟悉、深入。自己做到理解只是第一步，**真正的掌握是能够完全向别人讲清楚**。因此我就想写下笔记，争取向别人讲清楚，也激励自己学习。
**注意，本次会先实现简单的 React 15.x 版本，React Fiber 版本会在后面推出**
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201027205937.png)

<!-- more -->

## 预备知识

### JSX 的了解

在实际的编写代码中，我们使用最多的就是`JSX`。实际上根据中文官网的解释：

> JSX 仅仅只是 React.createElement(component, props, ...children) 函数的语法糖

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201027211058.png)
由图可知，JSX 会经过 babel 转换为 React.createElement 的语句，它只是个语法糖。在后续的过程中，我们实现了自己的 React.createElement，我们也可以写`JSX`语句来调试。

### jquery 的使用

为了方便开发，我们将采用 Jquery 来代替频繁的原生 DOM 的增删改查和事件绑定和解绑。主要用到了 jquery 的属性选择器和事件的绑定解绑、命名空间。

<!-- 事件的绑定和解绑简单的 demo 可以看下面的 demo。 -->

### DOM 的属性

我们的网页将会被浏览器解析为各种 Tree，我们比较熟悉的就是 DOM Tree。在我们的这个简单的 React 中也是一样。将为每个 DOM 节点都添加一个唯一的 data-reactid 属性，方便的后续的更新。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201028193346.png)

如图所示，第一个为 0，递进一级，就添加一个`.`,像数组下标一样从 0 开始逐渐增加。

## 环境搭建

我们将使用`create react app`快捷创建项目，然后将代码替换为我们的就可以了，简单快捷就可以使用现有的开发环境。

### 项目创建

```bash
npx create-react-app my-react-15
# 项目中有jquery
yarn add jquery
```

### 文件操作

删除 src 里面的文件，创建 index.js 修改文件的引入方式，我们简单渲染一个字符串，挂在在 root 上。

#### 目录结构

```
E:\study\my-react-15.x
├── package.json
├── public
├── README.md
├── src
|  ├── index.js
|  └── react
|     └── index.js
└── yarn.lock
```

#### 代码

```tsx
//  src/index.js
import React from "./react";
React.render("hello", document.getElementById("root"));
```

新建 react 文件夹，创建 index.js。暴露一个 react 对象，里面有个 render 方法。

```tsx
//  src/react/index.js
const React = {
  render,
};
function render(element, container) {
  container.innerHTML = element;
}
export default React;
```

简单跑起来，渲染正常。

## 结语

在这一节，我们搭建了基本的开发环境，在后面的文章中会逐渐深入，渲染原生 dom 和 class 组件，一起学习吧！
