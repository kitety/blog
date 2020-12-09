---
title: 实现自己的React之渲染原生DOM
tags:
  - React
abbrlink: a72c43c
translate_title: realize-your-own-react-rendering-native-dom
date: 2020-10-29 20:27:21
---

## 前言

之前我们已经用比较规范的方式实现了字符串和数字的渲染，接下来我们将渲染原生 DOM。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-11-3/1604368409871-image.png)

<!-- more -->

## 预备知识

### 正则

我们在匹配事件和 style 属性的时候，我们需要用到简单的正则知识点

- [A-Z] 大写字母
- ^ 以\*\*开头

除了使用正则的 test 判断以外，我们还可以和[String.place](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)搭配使用。**注意：这个方法不会改变原字符串。**

### jquery 事件的命名空间和事件代理

在元素创建的时候，我们会在 document 上采用事件委托绑定事件（后面会解释原因），元素移除的时候我们还要移除事件。为了简便操作我们会用命名空间来实现。

## 原理分析

我们在写 React 的代码的时候，我们一般会写 JSX.而在我们的现在开发中，会经过 babel 等转换为 React.createElement 代码。这也就是 JSX 的作用，简单可以理解为 React.createElement 的语法糖。

我们用下面的代码示例

```jsx
<div
  onClick={() => {
    console.log(1);
  }}
  style={{ backgroundColor: "red" }}
>
  你好
  <span className="test" id="thisisaspan">
    hehe
  </span>
</div>
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102210123.png)

而如果我们直接在代码中打印这个 `element` 会是什么样子呢？代码可以[看这里](https://codesandbox.io/s/cool-cloud-vfbkc?file=/src/App.js)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102210351.png)

可以看到，打印出来是一个对象，里面有`$$typeof、key、type、props` 等等很多属性。而我们需要关注的是 `type` 属性和 `props` 属性，甚至可以可以看到，`props` 里面有个 `children` 属性，而且可以继续展开，里面就是层层递进的 `children` 子元素。其实这个对象就是**虚拟 DOM**，在后面更新的时候我们也会说到。

至此我们也有了一个大概的流程。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102211725.png)

和之前的字符串的渲染对比得知，我们这次渲染的是 `React.createElement` 的返回值，它的返回值是一个实例，我们现在称为 `Element` 实例。

## 动手实现

经过上述的分析，我们得到此次渲染原生 DOM 我们需要做的事情后大致如下
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102212917.png)
我们这次渲染的代码为

```js
//src/index,js
const ele =
  /*#__PURE__*/
  React.createElement(
    "div",
    {
      onClick: () => {
        console.log(1);
      },
      style: {
        backgroundColor: "red",
      },
    },
    "\u4F60\u597D",
    /*#__PURE__*/ React.createElement(
      "span",
      {
        className: "test",
        id: "thisisaspan",
      },
      "hehe"
    )
  );
React.render(ele, document.getElementById("root"));
```

### createElement

我们在 react 文件夹新建 element.js，这个函数的作用就是根据将所有传入的参数实例化，返回一个对象
代码如下：

```js
class Element {
  constructor(type, props) {
    // 存一遍
    this.type = type;
    this.props = props;
  }
}

/*
// 
React.createElement("div", {
  onClick: () => {
    console.log(1);
  },
  style: {
    backgroundColor: 'red'
  }
}, "\u4F60\u597D",React.createElement("span", {
  className: "test",
  id: "thisisaspan"
}, "hehe"));
*/
// 从第三项开始,后面的都是children,因此用了reset的方式存入数组
function createElement(type, props = {}, ...children) {
  // 存入props
  props.children = children;
  // 返回的element实例
  // 后面也可以用instanceof来辅助判断
  return new Element(type, props);
}

export { Element, createElement };
```

再在 react/index.js 引入 createElement，方便调用。

### createUnit

createElement 函数调用完成之后，我们就要进入 createUnit 工厂函数来进行判断生成实例

这个地方我们要注意，这个时候的 element 是 Element 的实例，因此我们可以用 instanceof，而且渲染的都是原生的 DOM，因此 tag 名称都是字符串，我们可以使用 element.type 辅助判断。

```js
function createUnit(element) {
  if (["number", "string"].includes(typeof element)) {
    return new TextUint(element);
  } else if (
+    element instanceof Element &&
+    ["string"].includes(typeof element.type)
+  ) {
+    return new NativeUint(element);
+  }
}
```

### NativeUint

经过 createUnit 工厂函数之后我们就要生成 NativeUint 了，我们写一个 NativeUint 的 class。我们仍然是继承了 Unit，将元素存到了 `this._currentElement`

```js
class NativeUint extends Unit {}
```

### 调用实例 getMarkUp

在这一步我们需要调用 getMarkUp。我们先想想我们这个步骤的大概流程。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102214813.png)
我们之前说过，我们的 getMarkup 函数需要传入一个**key**，然后返回一个**字符串**。对这就是最直观的理解，而返回的字符串可能就是下面的样子。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102215219.png)
我们最终需要的字符串大概为：`<span data-reactid="0.1" class="test" id="thisisaspan"><span data-reactid="0.1.0">hehe</span></span>`，包含了一个闭合的 tag，上面还有一些属性，我们就需要遍历添加属性，还要添加对应的唯一 id，还要对 children 子元素做处理。

我们理一下：

- 原生 DOM,要根据渲染对应的 tag
- style 等 css 处理
- class 等属性梳理
- 事件绑定 **为什么要事件委托，因为开始的时候元素还只是个字符串，无法绑定事件**
- children 的处理
- 其他属性

我们添加 getMarkup 函数，现在我们讲解这部分代码。

```js
  /**
   *
   * @param {*} reactId
   * 传入id 返回数组
   */
  getMarkUp (reactId) {
    // 实例存一下id
    this._reactId = reactId
    // this._currentElement为Element的实例 我们取出type和props
    // 而type就是标签的tag
    const { type, props } = this._currentElement
    // tag的开头
    let tagStart = `<${type} data-reactid="${reactId}" `
    // 中间的children字符串
    let childString = ''
    // 结尾的tag
    let tagEnd = `</${type}>`
    // 对props进行遍历
    for (let propName in props) {
      // 这种就是事件类型
      if (/^on[A-Z]/.test(propName)) {
        // 需要绑定事件，取出真实的事件，
        let eventName = propName.slice(2).toLowerCase()
        // 委托到的document上面 元素还只是个字符串，无法绑定事件
        $(document).on(`${eventName}.${reactId}`, `[data-reactid="${reactId}"]`, props[propName])
      } else if (propName === 'style') {
        // 样式，取出样式的对象
        const styleObj = props[propName]
        // 样式对象 backgroundColor====backgropund-color
        // 将对象先转换为key-value的数组，在yongmap转换为字符串
        let styles = Object.entries(styleObj).map(([attr, value]) => {
          // 正则+replace处理大写字母
          attr = attr.replace(/[A-Z]/g, (m) => `-${m.toLocaleLowerCase()}`)
          return `${attr}:${value}`
        }).join(';')
        // 依次添加到 开始的tag后面 注意要加空格
        tagStart += ` style="${styles}"`

      } else if (propName === 'children') {
        // children 子元素，徐亚将他们遍历，并且传入索引，搭配reactid作为id
        let children = props[propName]
        // map返回字符串，再转换为数组 复制给childString
        childString = children.map((child, index) => {
          // 通过工程函数生成实例
          let unit = createUnit(child)
          // 传入id返回字符串
          let str = unit.getMarkUp(`${reactId}.${index}`)
          return str
        }).join('')
      } else if (propName === 'className') {
        // className 类名，不使用class是因为和js的class冲突
        tagStart += ` class="${props[propName]}"`
      } else {
        // 其他的属性直接添加到html上面 如id等等
        tagStart += ` ${propName}=${props[propName]} `
      }
    }
    // forin循环结束，将所欲的字符串拼接到一起 getMarkUp的使命完成
    return tagStart + '>' + childString + tagEnd
  }
```

### 最后渲染

```js
// 最后在render中完成使命
let unit = createUnit(element);
let markUp = unit.getMarkUp(React.rootIndex); // 返回HTML标记
$(container).html(markUp);
```

## 结语

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102220641.png)
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20201102220726.png)
顺着以上的思路，我们成功渲染了原生 DOM,事件、样式、类名等等都一一成功渲染出来。而原生 DOM 的渲染看起来还是有点点复杂，就是深度优先，直接递归，直到没有元素方才完成使命。

本节代码地址：**[代码地址](https://github.com/kitety/my-react-15.x/tree/c772a7af8a909e21ff2ba280ee1cea69ced95b13)**

今天，我们成功完成了原生 DOM 的渲染，接下来我们将处理 Class Component，敬请期待吧！
