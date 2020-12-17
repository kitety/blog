---
title: VSCODE JS调试技巧
tags:
  - 调试
  - VSCODE
abbrlink: cc3b8a8b
translate_title: vscode-js-debugging-skills
date: 2020-12-16 11:46:52
---

## 前言

我们在编码过程中，会经常遇到调试的场景。VSCODE 是我经常使用的编辑器，接下来我就将简单记录几种 VSCODE 调试的方式，如果想看完整的 VSCODE 调试内容请前往[官方地址](https://code.visualstudio.com/docs/editor/debugging)。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608099048983-image.png)

<!-- more -->

## 场景

### 单文件 JS 调试

#### 直接调试

假如我有个单文件，我们在左侧可以打好断点，我们想直接调试，我们直接`F5`就会让选择调试环境，这里我们选择`NODE`环境就可以开始调试。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608099600518-image.png)

然后在左侧侧边栏可以查看运行变量，watch 值，调用栈，执行的脚本，断点信息等等；在底部的 `debug console` 也可以查看输出信息。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608099760624-image.png)

#### 配置文件方式

对于一些项目文件，我们有固定的入口，我们可以将其写入配置文件，省去每次都打开指定文件和选择环境等操作。

选择 debug 侧边栏，点击`create a launch.json file`即可，生成文件的详细信息可以去[官方文档指定章节](https://go.microsoft.com/fwlink/?linkid=830387)查看。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608100220601-image.png)
简单的配置文件如下：

```json
{
  // 更多信息: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch", // launch 新进程 attach 附加到当前进程
      "name": "Launch Program",
      "skipFiles": ["<node_internals>/**"],
      "program": "${workspaceFolder}\\mdlint.js" // 运行文件
    }
  ]
}
```

关于`program`这个字段，我们可以如下变量字段：

- workspaceFolder 工作目录，可以自己拼接路径，默认寻找 index.\*等文件
- file 当前打开并且激活的文件

### 项目调试

上述为单文件，但是一些脚手架该怎么调试呢，比如`webpack`等。比如现在我有一个[umi 的项目](https://github.com/kitety/Actual_Combat_Demos/tree/master/15-umi3)，我想调试 umi 的运行过程这要怎么做呢。

### npm script 脚本方式

比如在项目中我们想使用`umi dev`进行开发，我们可以在 npm scripts 中添加命令：

```bash
  "scripts": {
    "dev": "umi dev",
  }
```

而我们就可以利用这个脚本开始调试。

#### 打断点

开始调试之前我们就需要先打好断点，我们在执行 npm 脚本的时候，先会查看当前目录的`node_modules`的 bin 中得命令（当前找不到会往上面找，直到全局），再找到对应的文件执行。我们就可以用这种方式去打断点。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608104025324-image.png)

#### launch.json

我们生成 `launch.json`，点击添加配置，选择`Launch via NPM`就可以生成对应的配置，
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608104176834-image.png)
点击生成模板代码，我们更改 runtimeArgs 第二个参数为定义在 scripts 中对应的脚本就可以了。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608104265528-image.png)

修改保存之后直接 F5 就可以运行并且进入断点了。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608104411921-image.png)

### 命令行方式

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608104823254-image.png)

上述的方式也有一定的局限性，比如我们这个 umi 的例子，他会在运行的时候会产生**子进程**，这样我们无法断点调试子进程了，因此就有了命令行的方式。

#### --inspect-brk [详细](https://nodejs.org/en/docs/guides/debugging-getting-started/)

简单理解可以为审查断点，他会启用一个代理，默认为 9229 端口，也可以设置端口，他会在代码的开始位置进行断点。

#### 设置脚本

```json
"scripts": {
//默认9229端口，指定执行文件位置和传入的参数
    "debug": "node --inspect-brk=9229 ./node_modules/umi/bin/umi.js dev"
  },
```

#### 修改 launhc.json

我们选择`Attach to Remote Program`
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608105497851-image.png)
选择之后生成的字段比较多，我们保留`name`,`port`,`request`,`type`几个字段即可,其中 port 设置为脚本中设置的端口号。

```bash
{

  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to Remote",
      "port": 9229,
      "request": "attach",
      "type": "node"
    }
  ]
}

```

#### 开始调试

步骤如下：

- yarn debug 开放监听端口
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608105771810-image.png)
- F5 启用调试进入断点
  ![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608105814771-image.png)

我们这次使用的是命令行的方式，umi 在开启子进程的时候也会暴露对应的端口以便调试。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608106070629-image.png)
执行结束之后，发现子进程已经开启了，我们就要连接到这个新开的 9230 子进程。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608106336580-image.png)

#### 修改端口

我们此时点击调试栏的最右侧的断开连接，修改 launch.json 的 port 为新的端口号 9230，开启调试。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-12-16/1608106437374-image.png)
而此时，我们才算正式进入到了子进程的断点调试之中。

## 结语

以上，简单总结了使用 VSCODE 调试文件、项目方式，具体情况可以根据实际的环境来选择。
