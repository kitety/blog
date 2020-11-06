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

在 React 15 中，更新主要是由 Class Component 的 setState 执行更新的，然后更新的子元素再依次更新。而更新涉及到 DOM diff，我们将在后面的文章讲述。现在，我们先讲讲 Class Component 的渲染。

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

我们最终渲染的代码如下

```js
const ele = React.createElement(Counter, { name: "haha" });
```

经过 babel 转换和在[CRA 项目中](https://codesandbox.io/s/cool-cloud-vfbkc?file=/src/App.js)打印 Class Component，我们可以看到下面的结果。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604587310842-image.png)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604587472964-image.png)
从上面两张图我们看到，这个组件会经过 React.creareElement 渲染，这个和我们的渲染原生 DOM 的方式的调用是一样的。回忆我们讲的渲染原生 DOM，区别就在于原生 DOM 经 React.creareElement 返回的对象的 type 是字符串，**这次返回的 type 是个函数，其实也就是个类**，类也是函数。

### 步骤理解

我们这次渲染 Class Component，区别就是调用 React.creareElement 返回的对象的 type 属性数个函数（也是个类）。我们拿到这样一个类之后，发现 render 方法返回的就是渲染的元素，因此我们实例化这个类，拿到了我们渲染的元素。拿到的元素之后，他可能是原生 DOM、Class Component 或者字符串数字，因此我们要不断的递归调用，直到渲染出字符串。
除此之外，React 中写类我们要继承 React.Component ，那么我们至少要新建这个类。还有我们在处理人的函数的时候，要注意到还有生命周期，我们要在合适的时候调用。

因此我们可以整理出这幅顺序图

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-11-5/1604589129707-image.png)

我们简单理一下步骤

- 创建 React.Componet 类
- 在 createUnit 添加判断
- 创建 CompositeUnit
- 添加 getMarkup 方法处理 Class Component

  - 实例化类
  - 执行 render 方法拿到子元素
  - 递归渲染子元素
  - 在各个阶段执行生命周期

- 全部挂载，触发 componentDidMount

## 动手实现

### React.Componet 类

我们创建 component.js，然后在里面添加代码

```js
// 初始化这个类
class Component {
  constructor(props) {
    this.props = props;
  }
}
export { Component };
```

然后还要在 react/index.js 引入这个 Component。

### 在 createUnit 判断

我们在渲染 Class 的时候，仍然是经过了 React.createElement 返回，我们可以和原生 DOM 类似来判断。

```js
function createUnit (element) {
  if (['number', 'string'].includes(typeof element)) {
    return new TextUint(element)
  } else if (element instanceof Element && ['string'].includes(typeof element.type)) {
    return new NativeUint(element)
+  } else if (element instanceof Element && ['function'].includes(typeof element.type)) {
+    return new CompositeUnit(element)
+  }
}
```

我们判断 element 是不是 Element 的实例，同时判断 element.type 的类型是不是函数，都满足的话我们就进入创建复合单元 CompositeUnit。

### 创建 CompositeUnit 类

```js
class CompositeUnit extends Unit {}
```

### 添加 getMarkUp 方法

我们添加 getMarkup 方法，接下来我们来讲解代码

```js
class CompositeUnit extends Unit {
  /**
   *
   * @param {*} reactId 传入id
   * @return {*} 返回一个字符串
   */
  getMarkUp(reactId) {
    // this上存id
    this._reactId = reactId;
    // type=Component=Counter props: { name: 'haha' }
    // 取出类和props
    let { type: Component, props } = this._currentElement;
    // 实例化 后面还会用到
    let componentInstance = (this._componentInstance = new Component(props));
    // 让组件的实例的currentUnit等于当前的unit
    componentInstance.currentUnit = this;
    // 渲染前要componentWillMount
    componentInstance.componentWillMount &&
      componentInstance.componentWillMount();
    // 调render方法 得到渲染的元素
    let renderElement = componentInstance.render();
    // 得到render的元素对应的unit
    let renderedInstance = (this._renderedInstance = createUnit(renderElement));
    // 调用方法 返回字符串
    let renderedMarkup = renderedInstance.getMarkUp(reactId);
    // 绑定componentDidMount事件
    $(document).on("mounted", () => {
      componentInstance.componentDidMount &&
        componentInstance.componentDidMount();
    });
    // 最后返回字符串
    return renderedMarkup;
  }
}
```

### 最后渲染

```js
// 最后在render中完成使命
let unit = createUnit(element);
let markUp = unit.getMarkUp(React.rootIndex); // 返回HTML标记
$(container).html(markUp);
// 触发在document上的事件
$(document).trigger("mounted");
```

### 渲染结果

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201106234204.png)

## 结语

我们现在实现了 Class Componet 组件的渲染，结合以前的文章实现了字符串、数字、原生 DOM、Class 的渲染了。可能有人想问不是还有函数是组件吗？我们来做个简单的分析。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201106234658.png)
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201106234750.png)

从上面的两张图可以看到，你会发现函数式组件和 class 组件很像甚至更为简单，拿到函数之后传递参数执行即可。主要就是判断是 class 还是是函数，这里的函数指的是仅仅是函数。我们可以简单使用[这个答案](https://stackoverflow.com/a/29094209)，来判断，这里就不详细书写了。

我们点击按钮想触发事件，发现会报错。这也正常我们还没有写更新。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20201106235140.png)

在下面的文章我们会写 diff 更新，大家一起期待吧！
