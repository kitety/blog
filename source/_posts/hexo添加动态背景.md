---
title: hexo添加动态背景
abbrlink: 8201a32f
tags:
  - Hexo
translate_title: hexo-add-dynamic-background
date: 2020-09-04 15:07:33
---

## 发现

本来想为 hexo 设置背景图片，又不想单调的只有一张图，碰巧发现知乎有个问题：[哪里有获取随机图片的服务接口？](https://www.zhihu.com/question/21168322)，因此就准备加到博客里面，这样也好看一些。

注意这张图的地址是`api`，返回是随机的。
![](https://unsplash.it/1920/1080/?random)

<!-- more -->

## 资源整理

### 免费的 api

如果有兴趣可以右键打开试试呢

- https://unsplash.it/1920/1080/?random
- https://api.ixiaowai.cn/gqapi/gqapi.php
- https://img.xjh.me/random_img.php?type=bg&ctype=nature
- https://source.unsplash.com/user/erondu/1920x1080
- http://lorempixel.com/1920/1080/
- https://picsum.photos/1920/1080
- https://uploadbeta.com/api/pictures/random/
- [https://uploadbeta.com/api/pictures/random/?key...](https://uploadbeta.com/api/pictures/random/?key=BingEverydayWallpaperPicture)
- [https://img.xjh.me/random_img.php](https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302&device=pc)

### CSS 设置
我的主题是Hexo的Next主题，我是在`themes\next\layout\_layout.swig`的_layout.swig的body上加了个样式`bosy-class`

然后在`themes\next\source\css\main.styl`中添加如下样式：
```CSS
/* 媒体查询，屏幕太窄了显示背景图片也无用 */
@media (min-width: 992px){
  // body 处理
  .body-class{
    /* 背景图片的地址 */
    background: url(https://api.ixiaowai.cn/gqapi/gqapi.php);
    /* 不重复 */
    background-repeat: no-repeat;
    /* 背景图像的位置固定 */
    background-attachment: fixed;
    /* 背景居中 */
    background-position: 50% 50%;
    /* 全部覆盖 如果图片小会拉伸，图片大会压缩*/
    background-size: cover;
  }
}
```

接下来就可以看到背景图片的地址每次都会刷新变化了。
