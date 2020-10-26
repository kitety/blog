---
title: 再学一次JS原型
abbrlink: 982386de
tags:
  - JS
translate_title: learn-js-prototype-again
date: 2020-08-23 16:09:51
---

## 忘却的知识需要复习

看到这张图的时候感觉很乱，心中已经忘却的原型知识明显招架不住，因此就需要重新整理一下了。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200823161711.png)

<!-- more -->

## 单例模式

![image-20200823162649747](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/image-20200823162649747.png)

单例模式解决的问题：把描述同一件事物的属性和特征进行归类，存储在同一个内存空间中，因此避免了全局变量之间的冲突、污染。

其中 person1 等就是为命名空间。每一个命名空间都是 JS 的 Object 这个内置基类的实例，单独的实例。

### 高级单例模式

```js
var nameSpace=(function(){
  var n = 12;
  function fn(){
    ...
  }
  return {
    fn:fn
  }
})()
```

在给命名空间赋值的时候不是直接返回对象，先执行匿名函数，形成一个私有作用域，不销毁的栈内存。在这个私有作用域中创建堆内存，把堆内存的地址赋值给命名空间。

优点: 可以在命名空间中创建很多的内容，比如变量、函数，哪些需要提供给外面调取使用，我们才返回到最终的对象中，这也是模块化实现的一种思想。

### this 作用域（浏览器中）

- 可以根据函数调用前面的对象来判断。例如`a.b()`的话 this 就指向 a，没有的话就指向全局。
- 在事件中指向触发事件的`target`
- 立即执行函数的this指向全局

### 题目

## 工厂模式

把实现相同功能的代码封装，批量生产。低耦合高内聚，减少页面中的冗余代码，提高代码的重复使用率。

```js
function createPerson(name, age) {
  var obj = {};
  obj.name = name;
  obj.age = age;
  return obj;
}
var p1 = new Person('x', 12);
var p2 = new Person('y', 12);
```

## 面向对象

简单的定义

- 对象：万物皆对象；
- 类：对象的具体细分（功能特点分类）
- 实例：类中具体的一个事物。
- JS 就是基于面向对象设计和开发出来的语言

### 实例和类型的判断
- typeof
- instanceof
- Object.prototype.toString.call(X)

### 原型链的查找原则
- 所有的函数数据类型都天生自带一个属性：prototype（原型），这个属性是一个对象，浏览器会默认开辟一个堆内存
- 在浏览器给prototype开辟的堆内存中有一个天生自带的属性：constructor，这个属性指向当前函数本身。
- 每一个对象都有一个`__proto__`属性，这个属性指向当前实例所属类的prototype（如果不能确定他是谁的实例，都是object的实例）。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200823232308.png)
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200823232322.png)

