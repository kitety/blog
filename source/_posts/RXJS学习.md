---
title: RXJS学习
tags:
  - RXJS
abbrlink: d685a9c8
translate_title: rxjs-learning
date: 2022-04-11 19:30:35
---

# RxJS 学习

Reactive 响应式编程是一种思维模式，并且针对各种语言都有其各自的实现，如：RxJava、RxGo、RxJS 等等。

在前端领域 Reactive 响应式使用的比较多的 RxJS，比如在**Angular**和**Nestjs**等框架中就有内置 RxJS。

RxJS 是 Reactive Extensions for JavaScript 的缩写，起源于 Reactive Extensions，是一个基于可观测数据流 Stream 结合观察者模式和迭代器模式的一种异步编程的应用库。

官网声称可以讲 Rxjs 理解为处理事件的“Lodash”
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20220411193345.png)

<!-- more -->

## **认识 Observable 和 Observe**

首先我们需要说一下简单的观察者模式 Observe

其实我们最简单的点击事件就是一种观察者模式

```jsx
function clickHandler(event) {
  console.log("user click!");
}

document.body.addEventListener("click", clickHandler);
```

我们也可以简单的手写一个类来模拟。

```jsx
class Producer {
  constructor() {
    this.listeners = [];
  }
  addListener(listener) {
    if (typeof listener === "function") {
      this.listeners.push(listener);
    } else {
      throw new Error("listener 必須是 function");
    }
  }
  removeListener(listener) {
    this.listeners.splice(this.listeners.indexOf(listener), 1);
  }
  notify(message) {
    this.listeners.forEach((listener) => {
      listener(message);
    });
  }
}
```

我们将数据放在数组中，需要的时候在遍历调用

还有一种是迭代器模式

```jsx
var arr = [1, 2, 3];

var iterator = arr[Symbol.iterator]();

iterator.next();
// { value: 1, done: false }
iterator.next();
// { value: 2, done: false }
iterator.next();
// { value: 3, done: false }
iterator.next();
// { value: undefined, done: true }
```

而**Observable**具有以上两者的通性，都是渐进式的获取值
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20220411193200.png)

**Observable 就像是一个序列，里面的元素会随着时间推送**

## **创建 Observable**

create

- create

  ```jsx
  var observable = Rx.Observable.create(function (observer) {
    observer.next("Jerry");
    observer.next("anna");
    setTimeout(() => {
      observer.next("RxJS 30 Days!");
    }, 30);
  });

  console.log("observable: ", observable);
  console.log("start");
  observable.subscribe({
    next: function (value) {
      console.log(value);
    },
    complete: function () {
      console.log("complete!");
    },
    error: function (error) {
      console.log(error);
    },
  });
  console.log("end");
  ```

of

- of
  ```jsx
  var source = Rx.Observable.of("jerry", "Anna");
  ```

from 把类数组的值转换为 observable

- from
  ```jsx
  // Set, WeakSet, Iterator
  var arr = ["jerry", "Anna", 2017, 2016, "30 days"];
  var source = Rx.Observable.from(arr);
  ```

empty 没有做任何事

- empty
  ```jsx
  var source = Rx.Observable.empty();
  ```

_never_

- never 都不会发生，它只是一个可以观察到的存在
  ```jsx
  var source = Rx.Observable.never();
  ```

throw 抛出错误

- throw
  ```jsx
  var source = Rx.Observable.throw("Oop!");
  ```

timer 间隔输出数字

- timer
  两个参数，第一个参数表示第一个输出的延迟时间；第二个参数表示后序输出的间隔时间，没有的话就只输出一个数字

interval 间隔输出数字

fromEvent 将事件转换成 observable 序列

fromPromise 将\***\*promise\*\***转换成 observable 序列

Rxjs 提供了一些纯函数作为工具函数，叫做 Operator。

Rxjs 的 operator 可以和数组的一些方法类比起来学习

| RxJS                 | 类比学习                                                |
| -------------------- | ------------------------------------------------------- |
| map                  | 和数组 map 一样，对每一项执行函数并返回                 |
| concat               | 和数组 concat 类似，做 observable 的拼接                |
| take                 | 和数组 slice 类似，去除 n 个，直接输入数字              |
| skip                 | 跳过 n 个                                               |
| takeLast             | 取后面 n 个                                             |
| last                 | 最后一个                                                |
| merge                | 对各个 observable 送出的值做”或“处理                    |
| combineLatest        | 取得各个 observable 最后送出的值                        |
| zip                  | 分别在推出第 n 个数的时候触发 同时                      |
| scan                 | 逐次的从 observable 获取订阅的值，执行函数              |
| debounceTime         | 消抖时间                                                |
| distinct             | 去重                                                    |
| distinctUntilChanged | 去重，只和最近的上一个的值进行比较                      |
| repeat               | 重复次数或者无限                                        |
| retryWhen            | 一个回调，接受一个由 error 组成的 Observable 并且会循环 |
| switch               | 数组的 flatten                                          |
