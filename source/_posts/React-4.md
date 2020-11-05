---
title: 实现自己的React之渲染Class Component
abbrlink: 9d7d5067
translate_title: realize-your-own-react-rendering-class-component
date: 2020-11-05 22:25:17
tags:
---

## 前言

之前我们已经实现了字符串和数字、原生 DOM 的渲染，接下来我们将渲染 Class Component。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604586613544-image.png)

<!-- more -->

## 原理分析

在 React 15 中，更新主要是有 Class Component 的 setState 执行更新的，然后更新的子元素再依次更新。而更新涉及到 DOM diff，我们将在后面的文章讲述，现在，我们先讲讲 Class Component 的渲染。

### 思路分析

在 React 中我们会这样写一个类。其中包含了一个 componentWillMount 等生命周期，handleClick 等内部方法，render 函数等，其中 render 函数 return 的才是我们真正渲染的元素，handleClick 函数调用会触发 setState 更新。

```jsx
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { number: 1 };
  }
  componentWillMount() {
    console.log("Counter componentWillMount");
  }
  componentDidMount() {
    console.log("Counter componentDidMount");
  }
  handleClick = () => {
    this.setState({ number: this.state.number + 1 });
  };

  render() {
    return (
      <div
        onClick={() => {
          console.log(1);
        }}
        style={{ backgroundColor: "red" }}
      >
        你好{this.props.name}
        <span class="test" id="thisisaspan">
          数字是：{this.state.number}
        </span>
        <button onClick={this.handleClick}>+</button>
      </div>
    );
  }
}
```

经过 babel 转换，和在[CRA 项目中](https://codesandbox.io/s/cool-cloud-vfbkc?file=/src/App.js)打印 Class Component，我们可以看到下面的结果。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604587310842-image.png)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604587472964-image.png)
从上面两张图我们看到，这个组件会经过 React.creareElement 渲染，这个我们的渲染原生 DOM 的方式的调用是一样的。回忆我们讲的渲染原生 DOM，区别就在于原生 DOM 经 React.creareElement 返回的对象的 type 是字符串，**这次返回的 type 是个函数，其实也就是个类**，类也是函数。

### 步骤理解

我们这次渲染 Class Component，区别就是调用 React.creareElement 返回的对象的 type 属性数个函数（也是个类）。我们拿到这样一个类之后，发现 render 方法返回的就是渲染的元素，因此我们实例化这个类，拿到了我们渲染的元素。拿到的元素之后，他可能是原生 DOM、Class Component 或者字符串数字，因此我们要不断的递归调用，直到渲染出字符串。
除此之外，React 中写类我们要继承 React.Component ，那么我们至少要新建这个类。还有我们在处理人的函数的时候，要注意到还有生命周期，我们要在合适的时候调用。

因此我们可以整理出这幅顺序图

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604589129707-image.png)

未完待续
