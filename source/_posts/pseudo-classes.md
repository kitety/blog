---
title: CSS 伪类合集分享
abbrlink: a54a0322
date: 2020-06-28 10:32:54
tags:
  - CSS
---

<!-- demo的样式 -->
<style>
.demo{
   border:1px dashed #ccc;
   padding:5px;
}
.demo:hover{
   box-shadow: 0 0 11px rgba(33,33,33,.2);
}
</style>

## 引用

分享总结一下现有的伪类和简单的 demo
源地址：[MDN](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Pseudo-classes)

## 伪类

### :active

匹配被用户激活的元素。它让页面能在浏览器监测到激活时给出反馈。当用鼠标交互时，它代表的是用户按下按键和松开按键之间的时间。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
 .demo .active:active{ color:red;}
  </style>
  <div class="active">鼠标按下就变为红色</div>
</div>
```
</details>
<div class="demo">
  <style>
 .demo .active:active{ color:red;}
  </style>
  <div class="active">鼠标按下就变为红色</div>
</div>
<!-- more -->

### :only-child

匹配没有任何兄弟元素的元素。

等效的选择器还可以写成:first-child:last-child 或者:nth-child(1):nth-last-child(1),当然,前者的权重会低一点.

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
.demo .onlyChild :only-child {
  color: red;
}
.demo  .onlyChild .haha::after {
 content:'after伪类不影响';
}
  </style>
  <div class="onlyChild">
  <div>
  直接的文本也不影响选择
    <i>没有兄弟元素</i>
  </div>

  <div>
    <i>有兄弟</i><br>
    <b>有兄弟</b><br>
    <span>有兄弟 <span>没兄弟</span></span>
  </div>
</div>
</div>
```
</details>
<div class="demo">
  <style>
  .demo   .onlyChild :only-child {
      color: red;
    }
  .demo   .onlyChild .haha::after {
      content:'after伪类不影响';
    }
  </style>
  <div class="onlyChild">
    <div class="haha">
      直接的文本也不影响选择
      <i>没有兄弟元素,</i>
    </div>
    <div>
      <i>有兄弟</i><br>
      <b>有兄弟</b><br>
      <span>有兄弟 <span>没兄弟</span></span>
    </div>
</div>
</div>

### :any-link

选择器代表一个有链接锚点的元素，而不管它是否被访问过，也就是说，它会匹配每一个有**href**属性的 `<a>`、`<area>` 或 `<link>` 元素。因此，它会匹配到所有的 :link 或 :visited。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
.demo .anyLink a:any-link {
  color: red;
}
/_ WebKit browsers _/
.demo .anyLink a:-webkit-any-link {
color: red;
}
</style>
<div class="anyLink">
<a href="https://example.com">href为地址</a><br>
<a href="#">href为#</a><br>
<a href="">href为空字符串</a><br>
<div href="#">href为#的div</div><br>
<a>没有 href</a>
</div>

</div>
```
</details>
<div class="demo">
  <style>
.demo .anyLink a:any-link {
  color: red;
}
/_ WebKit browsers _/
.demo .anyLink a:-webkit-any-link {
color: red;
}
</style>
<div class="anyLink">
<a href="https://example.com">href为地址</a><br>
<a href="#">href为#</a><br>
<a href="">href为空字符串</a><br>
<div href="#">href为#的div</div><br>
<a>没有 href</a>
</div>

</div>

### :only-of-type

代表了任意一个元素，这个元素没有其他相同类型的兄弟元素。(子元素中唯一的标签)

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
 .demo  .onlyoftype :only-of-type {
    color: red;
  }
  </style>
  <div class="onlyoftype">
    <div>I am `div` #1.</div>
    <p>I am the only `p` among my siblings.</p>
    <div>I am `div` #2.</div>
    <div>I am `div` #3.
      <i>I am the only `i` child.</i>
      <em>I am `em` #1.</em>
      <b>I am `b` #2.</b>
    </div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
  .demo .onlyoftype :only-of-type {
    color: red;
  }
  </style>
  <div class="onlyoftype">
    <div>I am `div` #1.</div>
    <p>I am the only `p` among my siblings.</p>
    <div>I am `div` #2.</div>
    <div>I am `div` #3.
      <i>I am the only `i` child.</i>
      <em>I am `em` #1.</em>
      <b>I am `b` #2.</b>
    </div>
  </div>
</div>

### :blank 火狐验证

没有子节点；仅有空的文本节点；仅有空白符的文本节点。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
.demo .blanks p {
  min-height: 30px;
  width: 250px;
  background-color: lightblue;
}
.demo .blanks p:blank { display: none; }
.demo .blanks p:-moz-only-whitespace { display: none; } /* Mozilla-only pseudo-class that works like :blank will */
</style>

  <div class="blanks">
  <p>This paragraph is not empty or blank.</p>
  <p><!--this is empty and blank --></p>
  <p>
    
    <!-- this is not empty, because it has whitespace. But it is blank.-->
    
  </p>
  <p>This paragraph is not empty or blank.</p>
</div>
</div>
```
</details>
<div class="demo">
  <style>
.demo .blanks p {
  min-height: 30px;
  width: 250px;
  background-color: lightblue;
}
.demo .blanks p:blank { display: none; }
.demo .blanks p:-moz-only-whitespace { display: none; } /* Mozilla-only pseudo-class that works like :blank will */
</style>

  <div class="blanks">
  <p>This paragraph is not empty or blank.</p>
  <p><!--this is empty and blank --></p>
  <p>
    
    <!-- this is not empty, because it has whitespace. But it is blank.-->
    
  </p>
  <p>This paragraph is not empty or blank.</p>
</div>
</div>

### :empty

代表没有子元素的元素。子元素只可以是元素节点或文本（包括空格）。注释或处理指令都不会产生影响。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
   .demo  .empty .box {
        background: pink;
        height: 80px;
        width: 80px;
    }
   .demo  .empty .box:empty {
      background: lime;
    }
</style>

  <div class="empty">
    <div class="box"><!-- I will be lime --></div>
    <div class="box">I will be pink</div>
    <div class="box">
        <!-- I will be red because of the whitespace around this comment -->
    </div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .empty .box {
        background: pink;
        height: 80px;
        width: 80px;
    }
   .demo  .empty .box:empty {
      background: lime;
    }
</style>

  <div class="empty">
    <div class="box"><!-- I will be lime --></div>
    <div class="box">I will be pink</div>
    <div class="box">
        <!-- I will be red because of the whitespace around this comment -->
    </div>
  </div>
</div>

### :optional

任意没有 required 属性的 `<input>`，`<select>` 或 `<textarea>` 元素使用它。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
 .demo  .optional input:optional {
  border: 1px dashed red;
}
  </style>
  <div class="optional">
  <input type="text"/>
  <input type="text" required placeholder="有required的input"/>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
 .demo  .optional input:optional {
  border: 1px dashed red;
}
  </style>
  <div class="optional">
  <input type="text"/>
  <input type="text" required placeholder="有required的input"/>
  </div>
</div>

### :checked

选择器表示任何处于选中状态的 radio(`<input type="radio">`), checkbox (`<input type="checkbox">`) 或("select") 元素中的 option HTML 元素("option")

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
 .demo  .checked :checked {
    background:red;
    margin-left:20px;
    margin-right:20px;
  }
  </style>
  <div class="checked">
  <input type="radio" name="my-input" id="yes">
  <label for="yes">Yes</label>

  <input type="radio" name="my-input" id="no">
  <label for="no">No</label>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
  .demo .checked :checked {
    background:red;
    margin-left:20px;
    margin-right:20px;
  }
  </style>
  <div class="checked">
  <input type="radio" name="my-input" id="yes">
  <label for="yes">Yes</label>

  <input type="radio" name="my-input" id="no">
  <label for="no">No</label>
  </div>
</div>

### :hover

光标（鼠标指针）悬停在元素上时提供关联的样式,按照 LVHA 的循顺序声明:link－:visited－:hover－:active。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
 .demo  .hover:hover {
   color:red;
  }
  </style>
  <div class="hover">
hover
  </div>
</div>
```
</details>
<div class="demo">
  <style>
 .demo  .hover:hover {
   color:red;
  }
  </style>
  <div class="hover">
hover
  </div>
</div>

### :out-of-range 和:in-range

- out-of-range:表示一个 `<input>` 元素，其当前值处于属性 min 和 max 限定的范围外
- in-range：表一个 `<input>` 元素，其当前值处于属性 min 和 max 限定的范围之内

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  input {
    border: 1px solid black;
  }
 .demo  .outofrange input:in-range {
    background-color: rgba(0, 255, 0, 0.25);
  }
 .demo  .outofrange input:out-of-range {
    background-color: rgba(255, 0, 0, 0.25);
    border: 2px solid red;
  }
 .demo  .outofrange input:in-range + label::after {
    content: 'okay.';
  }
 .demo  .outofrange input:out-of-range + label::after {
    content: 'out of range!';
  }
  </style>
  <div class="outofrange">
    <form action="" id="form1">
      <ul>Values between 1 and 10 are valid.
        <li>
          <input id="value1" name="value1" type="number" placeholder="1 to 10" min="1" max="10" value="12">
          <label for="value1">Your value is </label>
        </li>
      </ul>
    </form>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
  input {
    border: 1px solid black;
  }
 .demo  .outofrange input:in-range {
    background-color: rgba(0, 255, 0, 0.25);
  }
 .demo  .outofrange input:out-of-range {
    background-color: rgba(255, 0, 0, 0.25);
    border: 2px solid red;
  }
  .demo .outofrange input:in-range + label::after {
    content: 'okay.';
  }
  .demo .outofrange input:out-of-range + label::after {
    content: 'out of range!';
  }
  </style>
  <div class="outofrange">
    <form action="" id="form1">
      <ul>Values between 1 and 10 are valid.
        <li>
          <input id="value1" name="value1" type="number" placeholder="1 to 10" min="1" max="10" value="12">
          <label for="value1">Your value is </label>
        </li>
      </ul>
    </form>
  </div>
</div>

### :indeterminate

表示状态不确定的表单元素。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .demo .indeterminate input:indeterminate, .indeterminate input:indeterminate + label {
    background: red;
  }
  </style>
  <div class="indeterminate">
    <input type="checkbox" id="checkbox">
    <label for="checkbox">Background should be green</label></br>
    <input type="radio" id="radio">
    <label for="radio">Background should be green</label>
  </div>
  <script>
  var inputs = document.querySelector('.indeterminate').getElementsByTagName("input");
  for(var i = 0; i < inputs.length; i++) {
    inputs[i].indeterminate = true;
  }
  </script>
</div>
```
</details>
<div class="demo">
  <style>
  .demo .indeterminate input:indeterminate, .indeterminate input:indeterminate + label {
    background: red;
  }
  </style>
  <div class="indeterminate">
    <input type="checkbox" id="checkbox">
    <label for="checkbox">Background should be green</label></br>
    <input type="radio" id="radio">
    <label for="radio">Background should be green</label>
  </div>
  <script>
  var inputs = document.querySelector('.indeterminate').getElementsByTagName("input");
  for(var i = 0; i < inputs.length; i++) {
    inputs[i].indeterminate = true;
  }
  </script>
</div>

### :default

选择设置默认值的元素，该选择器可以在 `<button>`, `<input type="checkbox">`, `<input type="radio">`, 以及 `<option>` 上使用。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
   .demo  .default1 input:default {
      box-shadow: 0 0 2px 1px red;
    }
   .demo  .default1 input:default + label {
      color: red;
    }
  </style>

  <div class="default1">
    <input type="radio" name="season" id="spring" >
    <label for="spring">1</label>
    <input type="radio" name="season" id="summer" checked>
    <label for="summer">2</label>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .default1 input:default {
      box-shadow: 0 0 2px 1px red;
    }
   .demo  .default1 input:default + label {
      color: red;
    }
  </style>

  <div class="default1">
    <input type="radio" name="season" id="spring" >
    <label for="spring">1</label>
    <input type="radio" name="season" id="summer" checked>
    <label for="summer">2</label>
  </div>
</div>

### :placeholder-shown

在 placeholader 显示的时候被选择

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
   .demo  .placeholader input:placeholder-shown {
      border-color: red;
    }
  </style>

  <div class="placeholader">
    <input placeholder="Type something here!">
    </br>
    空placeholder<input placeholder="" >
    </br>
    无placeholder<input>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .placeholader input:placeholder-shown {
      border-color: red;
    }
  </style>

  <div class="placeholader">
    <input placeholder="Type something here!">
    </br>
    空placeholder<input placeholder="" >
    </br>
    无placeholder<input>
  </div>
</div>

### :invalid

表示任意内容未通过验证的 `<input>` 或其他 `<form>` 元素

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .demo   .invalid input:invalid {
      background-color: red;
    }
  </style>

  <div class="invalid">
    <form>
      <label for="url_input">Enter a URL:</label>
      <input type="url" id="url_input" />
      <br />
      <br />
      <label for="email_input">Enter an email address:</label>
      <input type="email" id="email_input" required/>
    </form>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .invalid input:invalid {
      background-color: red;
    }
  </style>

  <div class="invalid">
    <form>
      <label for="url_input">Enter a URL:</label>
      <input type="url" id="url_input" />
      <br />
      <br />
      <label for="email_input">Enter an email address:</label>
      <input type="email" id="email_input" required/>
    </form>
  </div>
</div>

### :read-only

选择只读的元素

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
   .demo  .readonly input:-moz-read-only {
      background-color: #ccc;
    }
    /* Supported in Blink/WebKit/Edge without a prefix */
  .demo .readonly input:read-only {
      background-color: #ccc;
    }
 .demo  .readonly p:-moz-read-only { background: lightgray; }
 .demo  .readonly p:read-only { background: lightgray; }
 .demo  .readonly .div:read-only { background: lightgray; }
  </style>

  <div class="readonly">
    <input type="text" value="This is a read-only field." readonly>
    <p>不可以编辑的都可以被选中</p>
    <p contenteditable="true">可以编辑的p标签就不行</p>
    <div class="div">div也一样</div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .readonly input:-moz-read-only {
      background-color: #ccc;
    }
    /* Supported in Blink/WebKit/Edge without a prefix */
 .demo  .readonly input:read-only {
      background-color: #ccc;
    }
.demo  .readonly p:-moz-read-only { background: lightgray; }
.demo  .readonly p:read-only { background: lightgray; }
.demo  .readonly .div:read-only { background: lightgray; }
  </style>

  <div class="readonly">
    <input type="text" value="This is a read-only field." readonly>
    <p>不可以编辑的都可以被选中</p>
    <p contenteditable="true">可以编辑的p标签就不行</p>
    <div class="div">div也一样</div>
  </div>
</div>

### :read-write

选择可以被用户编辑的元素

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .demo   .readwrite input:read-write {
      background-color: #ccc;
    }
    /* Supported in Blink/WebKit/Edge without a prefix */
  .demo .readwrite input:read-write {
      background-color: #ccc;
    }
  .demo .readwrite p:read-write { background: lightgray; }
  .demo .readwrite .div:read-write { background: lightgray; }
  </style>

  <div class="readwrite">
    <input type="text" value="This is a read-only field." >
    <p contenteditable="true">可以编辑的p标签也行</p>
    <p>不可以编辑的不可以被选中</p>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .readwrite input:read-write {
      background-color: #ccc;
    }
    /* Supported in Blink/WebKit/Edge without a prefix */
.demo   .readwrite input:read-write {
      background-color: #ccc;
    }
  .demo .readwrite p:read-write { background: lightgray; }
  .demo .readwrite .div:read-write { background: lightgray; }
  </style>

  <div class="readwrite">
    <input type="text" value="This is a read-only field." >
    <p contenteditable="true">可以编辑的p标签也行</p>
    <p>不可以编辑的不可以被选中</p>
  </div>
</div>

### :disabled

选择禁用的元素(表单元素)。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .demo   .disabled1 input:disabled {
      background-color: #ccc;
      cursor:not-allowed;
    }
  .demo   .disabled1 div:disabled {
      background-color: #ccc;
      cursor:not-allowed;
    }
  
  </style>
  <div class="disabled1">
    <input type="text" value="我被禁用了，尴尬" disabled >
    <div disabled >禁用的div</div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .disabled1 input:disabled {
      background-color: #ccc;
      cursor:not-allowed;
    }
   .demo  .disabled1 div:disabled {
      background-color: #ccc;
      cursor:not-allowed;
    }
  
  </style>
  <div class="disabled1">
    <input type="text" value="我被禁用了，尴尬" disabled >
    <div disabled >禁用的div</div>
  </div>
</div>

### :enabled

表示任何被启用的（enabled）元素。如果一个元素能够被激活（如选择、点击或接受文本输入），或者能够获取焦点，则该元素是启用的。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .demo   .enabled input:enabled {
      background-color: red;
    }
  .demo   .enabled div:enabled {
      background-color: red;
    }
  
  </style>
  <div class="enabled">
    <input type="text" value="我可以输入，尴尬"  >
    <div  >禁用的div</div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
   .demo  .enabled input:enabled {
      background-color: red;
    }
   .demo  .enabled div:enabled {
      background-color: red;
    }
  
  </style>
  <div class="enabled">
    <input type="text" value="我可以输入，尴尬"  >
    <div  >禁用的div</div>
  </div>
</div>

### :lang()

基于元素语言来匹配页面元素。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
   .demo .lang div:lang(en) > q { background:red; }
  .demo  .lang div:lang(fr) > q {background:green;}
  </style>
  <div class="lang">
    <div lang="en"><q>英语语言</q></div>
    <div lang="fr"><q>法语语言</div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
 .demo   .lang div:lang(en) > q { background:red; }
 .demo   .lang div:lang(fr) > q {background:green;}
  </style>
  <div class="lang">
    <div lang="en"><q>英语语言</q></div>
    <div lang="fr"><q>法语语言</div>
  </div>
</div>

### :not()

用来匹配不符合一组选择器的元素。由于它的作用是防止特定的元素被选中，它也被称为反选伪类（negation pseudo-class）。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .demo  .not .fancy {
      text-shadow: 2px 2px 3px gold;
    }
    /* 类名不是 `.fancy` 的 <p> 元素 */
   .demo  .not p:not(.fancy) {
      color: green;
    }
    /* 非 <p> 元素 */ 
  .demo   .not  :not(p) {
      text-decoration: underline;
    }
    /* 既不是 <div> 也不是 <span> 的元素 */
  .demo   .not  :not(div):not(span) {
      font-weight: bold;
    }
    /* 类名不是 `.crazy` 或 `.fancy` 的元素 */
    /* 注意，此语法尚未获广泛支持。 */
  .demo   .not  :not(.crazy, .fancy) {
      color:red;
    }
  </style>
  <div class="not">
    <p>我是一个段落。</p>
    <p class="fancy">我好看极了！</p>
    <div>我「不是」一个段落。</div>
  </div>
</div>
```
</details>
<div class="demo">
  <style>
 .demo   .not .fancy {
      text-shadow: 2px 2px 3px gold;
    }
    /* 类名不是 `.fancy` 的 <p> 元素 */
 .demo    .not p:not(.fancy) {
      color: green;
    }
    /* 非 <p> 元素 */ 
  .demo   .not  :not(p) {
      text-decoration: underline;
    }
    /* 既不是 <div> 也不是 <span> 的元素 */
  .demo   .not  :not(div):not(span) {
      font-weight: bold;
    }
    /* 类名不是 `.crazy` 或 `.fancy` 的元素 */
    /* 注意，此语法尚未获广泛支持。 */
   .demo  .not  :not(.crazy, .fancy) {
      color:red;
    }
  </style>
  <div class="not">
    <p>我是一个段落。</p>
    <p class="fancy">我好看极了！</p>
    <div>我「不是」一个段落。</div>
  </div>
</div>

### :focus

:focus 表示获得焦点的元素（如表单输入）。当用户点击或触摸元素或通过键盘的 “tab” 键选择它时会被触发。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
.demo   .focus input:focus {
    background: red;
  }
  </style>
  <div class="focus">
   <input />
  </div>
</div>

````
</details>
<div class="demo">
  <style>
 .demo  .focus input:focus {
    background: red;
  }
  </style>
  <div class="focus">
   <input />
  </div>
</div>

### :focus-within

表示一个元素获得焦点，或，该元素的后代元素获得焦点。换句话说，元素自身或者它的某个后代匹配 :focus 伪类。（shadow DOM 树中的后代也包括在内）

子元素获得焦点，父元素改变样式

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
  .focusWithin:focus-within {
    background: red;
  }
  </style>
  <div class="focusWithin">
   <input />
  </div>
</div>
````

</details>
<div class="demo">
  <style>
 .demo  .focusWithin:focus-within {
    background: red;
  }
  </style>
  <div class="focusWithin">
   <input />
  </div>
</div>

### :fullscreen

应用于当前处于全屏显示模式的元素。

<details>
<summary>展开查看</summary>
```html
<div class="demo">
  <style>
 .demo  .top {
  margin: 15px;
}
.demo .main {
  width: 100%;
  display: flex;
}
.demo .right:fullscreen{
  background:green;
}
.demo .right {
  width: 100%;
  height: 300px;
  background: #dddddd;
}
.demo .right:fullscreen {
  background: green;
  color:red;
  font-size:20px;
}
</style>

<div class="top">
  <button onclick="rightScreen()">全屏</button>
</div>
<div class="main">
  <div class="right">内容</div>
</div>
<script>
class fullScreen {
  /**
   * @description: 全屏初始化
   * @param {Function} fn 用户浏览器不支持全屏的回调
   */
  constructor(fn) {
    this.prefixName = ""; // 浏览器前缀
    this.isFullscreenData = true; // 浏览器是否支持全屏
    this.isFullscreen(fn);
  }
  /**
   * @description: 将传进来的元素全屏
   * @param {String} domName 要全屏的dom名称
   */
  Fullscreen(domName) {
    const element = document.querySelector(domName);
    const methodName =
      this.prefixName === ""
        ? "requestFullscreen"
        : `${this.prefixName}RequestFullScreen`;
    element[methodName]();
  }
  // 退出全屏
  exitFullscreen() {
    const methodName =
      this.prefixName === ""
        ? "exitFullscreen"
        : `${this.prefixName}ExitFullscreen`;
    document[methodName]();
  }
  /**
   * @description: 监听进入/离开全屏
   * @param {Function} enter 进入全屏的回调
   *  @param {Function} quit 离开全屏的回调
   */
  screenChange(enter, quit) {
    if (!this.isFullscreenData) return;
    const methodName = `on${this.prefixName}fullscreenchange`;
    document[methodName] = e => {
      if (this.isElementFullScreen()) {
        enter && enter(e); // 进入全屏回调
      } else {
        quit && quit(e); // 离开全屏的回调
      }
    };
  }
  /**
   * @description: 浏览器无法进入全屏时触发,可能是技术原因，也可能是用户拒绝：比如全屏请求不是在事件处理函数中调用,会在这里拦截到错误
   * @param {Function} enterErrorFn 回调
   */
  screenError(enterErrorFn) {
    const methodName = `on${this.prefixName}fullscreenerror`;
    document[methodName] = e => {
      enterErrorFn && enterErrorFn(e);
    };
  }
  /**
   * @description: 是否支持全屏+判断浏览器前缀
   * @param {Function} fn 不支持全屏的回调函数 这里设了一个默认值
   */
  isFullscreen(fn) {
    let fullscreenEnabled;
    // 判断浏览器前缀
    if (document.fullscreenEnabled) {
      fullscreenEnabled = document.fullscreenEnabled;
    } else if (document.webkitFullscreenEnabled) {
      fullscreenEnabled = document.webkitFullscreenEnabled;
      this.prefixName = "webkit";
    } else if (document.mozFullScreenEnabled) {
      fullscreenEnabled = document.mozFullScreenEnabled;
      this.prefixName = "moz";
    } else if (document.msFullscreenEnabled) {
      fullscreenEnabled = document.msFullscreenEnabled;
      this.prefixName = "ms";
    }
    if (!fullscreenEnabled) {
      this.isFullscreenData = false;
      fn && fn(); // 执行不支持全屏的回调
    }
  }
  /**
   * @description: 检测有没有元素处于全屏状态
   * @return 布尔值
   */
  isElementFullScreen() {
    const fullscreenElement =
      document.fullscreenElement ||
      document.msFullscreenElement ||
      document.mozFullScreenElement ||
      document.webkitFullscreenElement;
    if (fullscreenElement === null) {
      return false; // 当前没有元素在全屏状态
    } else {
      return true; // 有元素在全屏状态
    }
  }
}
let full = new fullScreen(() => {
  console.log("不支持");
});
full.screenError(e => {
  console.log("进去全屏失败:", e);
});
// 全屏请求必须在事件处理函数中调用，否则将会被拒绝。
// full.Fullscreen(".left"); // 触发进去全屏失败回调
const obj = {
  enter: e => {
    // 如果退出全屏 退出的还是全屏状态，将会触发进入全屏的回调，这种情况比较少 注意一下
    console.log("进入全屏", e);
  },
  quit: e => {
    console.log("退出全屏", e);
    // 通常不会出现嵌套的情况
  }
};
full.screenChange(obj.enter, obj.quit);
function leftScreen() {
  full.Fullscreen(".left");
}
function rightScreen() {
  full.Fullscreen(".right");
}
function redScreen() {
  full.Fullscreen(".left-son");
}
// 退出全屏 退出到上次的状态
function exitScreen() {
  full.exitFullscreen();
}
</script>
</div>
```
</details>
<div class="demo">
<style>
.demo .top {
  margin: 15px;
}
.demo .main {
  width: 100%;
  display: flex;
}
.demo .right:fullscreen{
  background:green;
}
.demo .right {
  width: 100%;
  height: 300px;
  background: #dddddd;
}
.demo .right:fullscreen {
  background: green;
  color:red;
  font-size:20px;
}
</style>

<div class="top">
  <button onclick="rightScreen()">全屏</button>
</div>
<div class="main">
  <div class="right">内容</div>
</div>
<script>
class fullScreen {
  /**
   * @description: 全屏初始化
   * @param {Function} fn 用户浏览器不支持全屏的回调
   */
  constructor(fn) {
    this.prefixName = ""; // 浏览器前缀
    this.isFullscreenData = true; // 浏览器是否支持全屏
    this.isFullscreen(fn);
  }
  /**
   * @description: 将传进来的元素全屏
   * @param {String} domName 要全屏的dom名称
   */
  Fullscreen(domName) {
    const element = document.querySelector(domName);
    const methodName =
      this.prefixName === ""
        ? "requestFullscreen"
        : `${this.prefixName}RequestFullScreen`;
    element[methodName]();
  }
  // 退出全屏
  exitFullscreen() {
    const methodName =
      this.prefixName === ""
        ? "exitFullscreen"
        : `${this.prefixName}ExitFullscreen`;
    document[methodName]();
  }
  /**
   * @description: 监听进入/离开全屏
   * @param {Function} enter 进入全屏的回调
   *  @param {Function} quit 离开全屏的回调
   */
  screenChange(enter, quit) {
    if (!this.isFullscreenData) return;
    const methodName = `on${this.prefixName}fullscreenchange`;
    document[methodName] = e => {
      if (this.isElementFullScreen()) {
        enter && enter(e); // 进入全屏回调
      } else {
        quit && quit(e); // 离开全屏的回调
      }
    };
  }
  /**
   * @description: 浏览器无法进入全屏时触发,可能是技术原因，也可能是用户拒绝：比如全屏请求不是在事件处理函数中调用,会在这里拦截到错误
   * @param {Function} enterErrorFn 回调
   */
  screenError(enterErrorFn) {
    const methodName = `on${this.prefixName}fullscreenerror`;
    document[methodName] = e => {
      enterErrorFn && enterErrorFn(e);
    };
  }
  /**
   * @description: 是否支持全屏+判断浏览器前缀
   * @param {Function} fn 不支持全屏的回调函数 这里设了一个默认值
   */
  isFullscreen(fn) {
    let fullscreenEnabled;
    // 判断浏览器前缀
    if (document.fullscreenEnabled) {
      fullscreenEnabled = document.fullscreenEnabled;
    } else if (document.webkitFullscreenEnabled) {
      fullscreenEnabled = document.webkitFullscreenEnabled;
      this.prefixName = "webkit";
    } else if (document.mozFullScreenEnabled) {
      fullscreenEnabled = document.mozFullScreenEnabled;
      this.prefixName = "moz";
    } else if (document.msFullscreenEnabled) {
      fullscreenEnabled = document.msFullscreenEnabled;
      this.prefixName = "ms";
    }
    if (!fullscreenEnabled) {
      this.isFullscreenData = false;
      fn && fn(); // 执行不支持全屏的回调
    }
  }
  /**
   * @description: 检测有没有元素处于全屏状态
   * @return 布尔值
   */
  isElementFullScreen() {
    const fullscreenElement =
      document.fullscreenElement ||
      document.msFullscreenElement ||
      document.mozFullScreenElement ||
      document.webkitFullscreenElement;
    if (fullscreenElement === null) {
      return false; // 当前没有元素在全屏状态
    } else {
      return true; // 有元素在全屏状态
    }
  }
}
let full = new fullScreen(() => {
  console.log("不支持");
});
full.screenError(e => {
  console.log("进去全屏失败:", e);
});
// 全屏请求必须在事件处理函数中调用，否则将会被拒绝。
// full.Fullscreen(".left"); // 触发进去全屏失败回调
const obj = {
  enter: e => {
    // 如果退出全屏 退出的还是全屏状态，将会触发进入全屏的回调，这种情况比较少 注意一下
    console.log("进入全屏", e);
  },
  quit: e => {
    console.log("退出全屏", e);
    // 通常不会出现嵌套的情况
  }
};
full.screenChange(obj.enter, obj.quit);
function leftScreen() {
  full.Fullscreen(".left");
}
function rightScreen() {
  full.Fullscreen(".right");
}
function redScreen() {
  full.Fullscreen(".left-son");
}
// 退出全屏 退出到上次的状态
function exitScreen() {
  full.exitFullscreen();
}
</script>
</div>

## 结语

以上就是本次的全部分享内容，合理的利用伪类可以比较巧妙的实现一些特殊效果。但是部分伪类还是涉及到浏览器的兼容问题，或者还在草案之中，具体的兼容性可以为[Can I Use](https://caniuse.com/)查看
