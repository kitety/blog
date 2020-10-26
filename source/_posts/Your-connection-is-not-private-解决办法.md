---
title: Your connection is not private | 您的连接不是私密连接的解决办法
abbrlink: 610b560b
tags:
  - Chrome
translate_title: your-connection-is-not-private-solution
date: 2020-06-19 11:41:33
---

随着 Chrome 的升级会推荐使用 https 的模式开发，当我们使用 https 的模式进行开发时让然会出现以下提示：
![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175214.png)

<!-- more -->

我们发现点击高级仍旧无法找到可以访问的方式（已经将域名屏蔽）

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175225.png)

## 解决办法

原来在 Chrome 会对`HSTS`进行检查，但是也增加了一个 hack 来**承认有风险的情况**下访问网页，那就是输入**thisisunsafe**。不用管，直接在页面输入，而不是在地址栏，直接输入这一句就可以了。

## 源代码

Chrome 相关的的[源代码地址](https://chromium.googlesource.com/chromium/src/+/master/components/security_interstitials/core/browser/resources/interstitial_large.js)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175237.png)
也不用管大小写，直接输入就是了。

## 参考

> https://dev.to/gautamkrishnar/quickbits-1-skipping-the-chrome-your-connection-is-not-private-warning-4kp1 
> https://stackoverflow.com/questions/35274659/does-using-badidea-or-thisisunsafe-to-bypass-a-chrome-certificate-hsts-error 
> https://chromium.googlesource.com/chromium/src/+/master/components/security_interstitials/core/browser/resources/interstitial_large.js
