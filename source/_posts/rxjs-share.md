---
title: RXJS入门分享之Observable、Operators
abbrlink: 54f05674
date: 2022-08-29 23:25:25
translate_title: observable-and-operators-shared-by-rxjs-entry
tags:
- RXJS
- 前端
---


### **RX的发展**

源自微软，火于**Netflix**(奈飞)公司。2011年微软开发出RX框架(开发的LinQ扩展出来的开源方案)，由于当时的**Netflix**公司发展太快，旧有的一些架构问题加上新增长的一些问题，导致架构特别复杂，一直在寻找一套能够梳理清楚这种复杂架构的框架或模式。**Netflix**公司借鉴了RX的设计理念，基于JAVA语言开发出了RxJava。从此RX这种理念迎来了爆发。发展至今，RX已经形成了一个开源集合，支持多种语言。

> RX支持的语言：[http://reactivex.io/languages.html](http://reactivex.io/languages.html)
> 
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20220829233509.png)
<!-- more -->
### **RX的优势？**

- 三大统一，异步与同步，获取与订阅，现在与未来
- 可组合的数据变更过程

在实际应用中，很多问题可以抽象成数据流，网页的DOM事件、Ajax获取数据资源等操作都可以看成(抽象)是一个数据流。

### **认识 Rxjs**

Rxjs是一套由Observable sequences (可观察的对象序列)来组合异步行为和事件流的library。

Rxjs中的数据流可能包含复杂的功能，但是可以分解成一个个单体来实现，实现某个小功能就是**操作符**，学习RxJS就是学习如何组合操作符来解决复杂问题。

> 简单的说，可以把Rxjs看成是异步的lodash
> 

这也被称为Functional Reactive Programming，更切确地说是指Functional Programming 及Reactive Programming 两个编程思想的结合。

Reactive Programming 简单来说就是 **当变量或资源发生变动时，由变量或资源自动告诉我发生变动了。想想Vue**

丰富多彩的前端界：**Angular**、**Nestjs**、vue-rx、redux-observable

### **RxJS 核心概念与内容概览**

- **Observable (可观察对象):** 表示一个概念，这个概念是一个可调用的未来值或事件的集合。
- **Observer (观察者):** 一个回调函数的集合，它知道如何去监听由 Observable 提供的值。
- **Subscription (订阅):** 表示 Observable 的执行，具体应该做何操作。
- **Operators (操作符):** 采用函数式编程风格的纯函数 (pure function)，使用像 `map`、`filter`、`concat`、`flatMap` 等这样的操作符来处理集合。
- **Subject (主体):** 相当于 EventEmitter，并且是将值或事件多路推送给多个 Observer 的唯一方式。
- **Schedulers (调度器):** 用来控制并发并且是中央集权的调度员，允许我们在发生计算时进行协调，例如 `setTimeout` 或 `requestAnimationFrame` 或其他。

> 让我们来看个小例子，假设我们想要监听点击事件，但点击一次之后不再监听
> 
- Javascript

```jsx
var handler = (e) => {
	console.log(e);
	// 取消监听
	document.body.removeEventListener('click', handler); 
}
// 监听
document.body.addEventListener('click', handler);
```

- 使用Rxjs

```jsx
Rx.Observable
	.fromEvent(document.body, 'click') // 注册
	.take(1) // 只取一次，是不是很像lodash的once
	.subscribe(console.log);
```

什么是**Observable**

看点其他的

观察者

```jsx
class Producer {
	constructor() {
		this.listeners = [];
	}
	addListener(listener) {
		if(typeof listener === 'function') {
			this.listeners.push(listener)
		} else {
			throw new Error('listener must be function')
		}
	}
	removeListener(listener) {
		this.listeners.splice(this.listeners.indexOf(listener), 1)
	}
	notify(message) {
		this.listeners.forEach(listener => {
			listener(message);
		})
	}
}
```

```jsx
var egghead = new Producer(); 
// new egghead
function listener1(message) {
	console.log(message + 'from listener1');
}
function listener2(message) {
	console.log(message + 'from listener2');
}
egghead.addListener(listener1); // 注册
egghead.addListener(listener2);
egghead.notify('A new course!!') // 执行
```

iterator可迭代，渐进取值

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

Observable 的字面意思是「可观察的」，Observable 就像是一个序列，里面的元素会随着时间推送。

在 RxJS 里你其实可以理解为「**把任何数据封装成，具备可观察、可处理、可订阅能力的类**」。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20220829233153.png)


直接来吧

创建**Observable**

```jsx
var observable = Rx.Observable
	.create(function(observer) {
		observer.next('Jerry');
		observer.next('Anna');
	})
	
// 订阅observable	
observable.subscribe(function(value) {
	console.log(value);
})
```

[https://codesandbox.io/s/holy-voice-htnno4?file=/index.html](https://codesandbox.io/s/holy-voice-htnno4?file=/index.html)

```jsx
var observable = Rx.Observable.create(function (observer) {
        observer.next("Jerry");
        observer.next("Anna");
        setTimeout(() => {
          observer.next("RxJS learning");
        }, 30);
      });
      console.log("start");

      // 订阅observable
      observable.subscribe(function (value) {
        console.log(value);
      });
      console.log("end");
```

[https://codesandbox.io/s/xenodochial-almeida-81xjmj?file=/index.html](https://codesandbox.io/s/xenodochial-almeida-81xjmj?file=/index.html)

```jsx
var observable = Rx.Observable
	.create(function(observer) {
		observer.next('Jerry');
		observer.next('Anna');
	})
observable.subscribe(
    value => { console.log(value); },// 正常
    error => { console.log('Error: ', error); },//错误
    () => { console.log('complete') } // 结束
)
```

[https://codesandbox.io/s/damp-waterfall-zzj0i1?file=/index.html](https://codesandbox.io/s/damp-waterfall-zzj0i1?file=/index.html)

```jsx
var observable = Rx.Observable.create(function (observer) {
        observer.next("Jerry");
        observer.next("Anna");
				observer.complete();// 结束
      });
      observable.subscribe({
				// 正常
        next: (v) => {
          console.log(v);
        },
				// 错误
        error: (v) => {
          console.log("error", v);
        },
				// 结束
        complete: (v) => {
          console.log("complete");
        }
      });
```

[https://codesandbox.io/s/interesting-bogdan-bzibtu?file=/index.html](https://codesandbox.io/s/interesting-bogdan-bzibtu?file=/index.html)

除了基本的创建之外，还有许多 **Creation Operator**

| of | Rx.Observable.of('Jerry', 'Anna') | https://codesandbox.io/s/floral-sunset-8cv5fb?file=/index.html |
| --- | --- | --- |
| from | 和of类似，参数是一个数组或者类数组，或者 promise | https://codesandbox.io/s/peaceful-water-6bhrun?file=/index.html<br>https://codesandbox.io/s/dreamy-lichterman-gcxh9b?file=/index.html  promise |
| fromEvent | 来自一个事件 | https://codesandbox.io/s/immutable-https-hpctyh?file=/index.html |
| fromPromise | 传入一个promise | https://codesandbox.io/s/dreamy-lichterman-gcxh9b?file=/index.html  promise |
| never | ∞无穷，永远不会完成 | https://codesandbox.io/s/quirky-panna-1tz6sl?file=/index.html |
| empty | 空的，直接完成 | https://codesandbox.io/s/green-lake-mdep1g?file=/index.html |
| throw | promise.reject() 类似的意思，立马执行error | https://codesandbox.io/s/intelligent-field-bekvj9?file=/index.html |
| interval | 和setInterval触发next类似，就是多次触发next的简单写法
参数时间间隔 | https://codesandbox.io/s/busy-robinson-y4pqet?file=/index.html |
| timer | 当 timer 有两个参数时，第一个参数的时间间隔，之后参数的时间间隔 | https://codesandbox.io/s/loving-sound-xb4rtz?file=/index.html |

取消订阅

```jsx
subscriptionA.unsubscribe()
```

## 什么是Operator？

[学习 RxJS 操作符](https://rxjs-cn.github.io/learn-rxjs-operators/)

Operators 就是一个个被附加到Observable 工具函数，例如像是map, filter, contactAll…等等，所有这些函数都会拿到原本的observable 并回传一个新的observable。

### 弹珠图（marble diagrams）

学习网址：[https://rxmarbles.com/](https://rxmarbles.com/)

弹珠图（Marble diagrams）就是用图例形象地表示 Observable 和各种操作符的一种方法。
用 - 表示一小段时间，X 代表有错误发生， | 表示结束，() 表示同步发生。

```jsx
var source = Rx.Observable.interval(1000);
-----0-----1-----2-----3--...
```

```jsx
var source = Rx.Observable.of(1,2,3,4);
(1234)|
```

| map | array map | https://codesandbox.io/s/muddy-cookies-yr7kld?file=/index.html |
| --- | --- | --- |
| filter | array filter，过滤出结果为真的  | https://codesandbox.io/s/youthful-bas-xy70pv?file=/index.html |
| mapTo | 可以把传进来的值改成一个固定的值 | https://codesandbox.io/s/mystifying-turing-0op67y?file=/index.html |
| take | 取前几个元素后就结束,array slice? | https://codesandbox.io/s/happy-brook-o4rwpe?file=/index.html |
| takeLast | 取后面几个 | https://codesandbox.io/s/practical-turing-5zx90z?file=/index.html |
| first | 取第一个 | https://codesandbox.io/s/adoring-breeze-9s4qk7?file=/index.html |
| last | 取最后一个 | https://codesandbox.io/s/quizzical-tdd-twhll9?file=/index.html |
| takeUntil | 他可以在某件事情发生时，让一个observable 直送出完成(complete)讯息 | https://codesandbox.io/s/eloquent-elbakyan-zlfkmf?file=/index.html |
| concatAll | 二维数组转以为数组 | https://codesandbox.io/s/icy-darkness-pmrnfr?file=/index.html |
| skip | 跳过n个 | https://codesandbox.io/s/serene-mendel-ovy5zh?file=/index.html |
| concat | 可以把多个observable 实例合并成一个,有先后顺序 | https://codesandbox.io/s/strange-euclid-b2vw9o?file=/index.html |
| startWith | 可以在observable 的一开始塞要发送的元素 | https://codesandbox.io/s/intelligent-dream-vdwcs8?file=/index.html |
| merge | merge把多个observable 同时处理，这跟 concat 一次处理一个observable 是完全不一样的，OR 语法 | https://codesandbox.io/s/inspiring-thompson-eivrys?file=/index.html |
| zip | zip 会取每个observable 相同顺序的元素并传入callback | https://codesandbox.io/s/adoring-mestorf-znmkzp?file=/index.html |
| combineLatest | 取得各个observable 最后送出的值，再输出成一个值 | https://codesandbox.io/s/gallant-hopper-w7hhfh?file=/index.html |
| withLatestFrom | 只有在主要的observable 送出新的值时，才会执行callback。<br/>**主的订阅时候取最新的从的状态** | https://codesandbox.io/s/rough-mountain-2gwsio?file=/index.html |
| scan | array reduce | https://codesandbox.io/s/angry-dust-pudel1?file=/index.html |
| buffer | source.buffer(source2)，根据source2的触发去触发source | https://codesandbox.io/s/dazzling-bird-mlibg4?file=/index.html:0-736 |
| bufferTime |  指定时间去触发 |  |
| bufferCount | 指定数量去触发 |  |
| delay | 整体延迟触发 | https://codesandbox.io/s/blissful-murdock-719bir?file=/index.html |
| delayWhen | 每个元素延迟触发 | https://codesandbox.io/s/stoic-volhard-7ycxg0?file=/index.html |

 map

```jsx
var source = Rx.Observable.interval(1000);
var newest = source.map(x => x + 1);

source: -----0-----1-----2-----3--...
            map(x => x + 1)
newest: -----1-----2-----3-----4--...
```

mapTo

```jsx
source: -----0-----1-----2-----3--...
                mapTo(2)
newest: -----2-----2-----2-----2--...
```

filter

```jsx
source: -----0-----1-----2-----3-----4-...
            filter(x => x % 2 === 0)
newest: -----0-----------2-----------4-...
```

**concatAll**

就像数组的map一样，map后面返回都是要是一个和原数组元素的一样的类型，你返回一个不一样的就需要转换了，这里的observeable是一样的道理

```jsx
[1,2].map(i=>i+1)// [1,2]
[1,2].map(i=>[i+1]) // [[1],[2]] ??  concatAll [1,2]

Rx.Observable.interval(1000).map(i=>i+1) // 1,2,3...
Rx.Observable.interval(1000).map(i=>Rx.Observable.of(i+1))
 // Observable<Observable>  ?? 就不是了，需要拍平
```

rxjs更多的是一种思维的转变，小demo

[https://codesandbox.io/s/magical-williamson-if3w30?file=/index.html:652-1233](https://codesandbox.io/s/magical-williamson-if3w30?file=/index.html:652-1233)

过程

1. 选择元素
2. 绑定事件
3. 按下的时候开始
4. 监听移动，同步修改位置
5. 弹起取消

```jsx
const dragDOM = document.getElementById("drag");
const body = document.body;
const mouseDown = Rx.Observable.fromEvent(dragDOM, "mousedown");
const mouseUp = Rx.Observable.fromEvent(body, "mouseup");
const mouseMove = Rx.Observable.fromEvent(body, "mousemove");
let x = 0;
let y = 0;
mouseDown
  .map((event) => {
    x = event.offsetX;
    y = event.offsetY;
    return mouseMove.takeUntil(mouseUp);
  })
  .concatAll()
  .map((event) => ({ x: event.clientX, y: event.clientY }))
  .subscribe((pos) => {
    dragDOM.style.left = pos.x - x + "px";
    dragDOM.style.top = pos.y - y + "px";
```

**takeLast**

原来的是需要先执行的，不然我怎么知道后面几个是是什么

```jsx
var source = Rx.Observable.interval(1000).take(6);
var example = source.takeLast(2);
example.subscribe({
    next: (value) => { console.log(value); },
    error: (err) => { console.log('Error: ' + err); },
    complete: () => { console.log('complete'); }
});

source : ----0----1----2----3----4----5|
                takeLast(2)
example: ------------------------------(45)|
```

merge 

```jsx
source : ----0----1----2|
source2: --0--1--2--3--4--5|
            merge()
example: --0-01--21-3--(24)--5|

OR 语法
```

**[combineLatest](https://codesandbox.io/s/gallant-hopper-w7hhfh?file=/index.html)**

```jsx
source : ----0----1----2|
newest : --0--1--2--3--4--5|
    combineLatest(newest, (x, y) => x + y);
example: ----01--23-4--(56)--7|
00-01-02-12-13-14-24-25
```

zip

```jsx
source : ----0----1----2|
newest : --0--1--2--3--4--5|
    zip(newest, (x, y) => x + y)
example: ----0----2----4|
```

withLatestFrom

```jsx
main   : ----h----e----l----l----o|
some   : --0--1--0--0--0--1|
withLatestFrom(some, (x, y) =>  y === 1 ? x.toUpperCase() : x);
example: ----h----e----l----L----O|

main 送出了h，此时some 上一次送出的值为0，把这两个参数传入callback 得到h。
main 送出了e，此时some 上一次送出的值为0，把这两个参数传入callback 得到e。
main 送出了l，此时some 上一次送出的值为0，把这两个参数传入callback 得到l。
main 送出了l，此时some 上一次送出的值为1，把这两个参数传入callback 得到L。
main 送出了o，此时some 上一次送出的值为1，把这两个参数传入callback 得到O。

withLatestFrom 很常用在一些checkbox 型的功能，例如说一个编辑器，我们开启粗体后，
打出来的字就都要变粗体，粗体就像是some observable，而我们打字就是main observable。
```

小demo2

[https://codesandbox.io/s/wonderful-pasteur-s9ebp3](https://codesandbox.io/s/wonderful-pasteur-s9ebp3)

scan 

```jsx
source : ----h----e----l----l----o|
    scan((origin, next) => origin + next, '')
example: ----h----(he)----(hel)----(hell)----(hello)|
```

加法减法demo3 [https://codesandbox.io/s/recursing-shaw-d1ubvq?file=/index.html](https://codesandbox.io/s/recursing-shaw-d1ubvq?file=/index.html)

buffer

```jsx
source : --0--1--2--3--4--5--6--7..
source2: ---------0---------1--------...
            buffer(source2)
example: ---------([0,1,2])---------([3,4,5])
```

delay

```jsx
source : --0--1--2--3--4|
        delay(500)
example: -------0--1--2--3--4|
```

delayWhen

```jsx
source : --0--1--2--3--4|
    .delayWhen(x => Rx.Observable.empty().delay(100 * x * x));
example: --0---1----2-----3-----4|
```

demo4 [https://codesandbox.io/s/hopeful-hoover-yf6m29?file=/index.html](https://codesandbox.io/s/hopeful-hoover-yf6m29?file=/index.html)

学习资料

[https://rxjs.dev/](https://rxjs.dev/)

[https://cn.rx.js.org/](https://cn.rx.js.org/)

[https://rxmarbles.com/](https://rxmarbles.com/)

[https://rxjs-cn.github.io/RxJS-Ultimate-CN/](https://rxjs-cn.github.io/RxJS-Ultimate-CN/)

[https://blog.jerry-hong.com/series/rxjs](https://blog.jerry-hong.com/series/rxjs)
