---
title: Your connection is not private | 您的连接不是私密连接的解决办法
abbrlink: 610b560b
date: 2020-06-19 11:41:33
tags:
  - Chrome
---

随着 Chrome 的升级会推荐使用 https 的模式开发，当我们使用 https 的模式进行开发时让然会出现以下提示：
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F77decc5a-0cc6-4b9c-b9fe-6a6ee024a37a%2Fia_10006.png?table=block&id=72b9e9cf-f2a0-448f-9efc-1e49592b5c73&width=1340&cache=v2)

<!-- more -->

我们发现点击高级仍旧无法找到可以访问的方式（已经将域名屏蔽）

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6264bad2-5a8c-4e09-a3c6-edc6c4f96810%2Fia_10007.png?table=block&id=07b766db-4bb2-4027-9819-69a586dd210c&width=1320&cache=v2)

## 解决办法

原来在 Chrome 会对`HSTS`进行检查，但是也增加了一个 hack 来**承认有风险的情况**下访问网页，那就是输入**thisisunsafe**。不用管，直接在页面输入，而不是在地址栏，直接输入这一句就可以了。

## 源代码

Chrome 相关的的[源代码地址](https://chromium.googlesource.com/chromium/src/+/master/components/security_interstitials/core/browser/resources/interstitial_large.js)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa8a09a55-9c77-449a-a414-ded26c9029e2%2Fia_10008.png?table=block&id=c88d20f5-826b-4dab-b6b5-b2adf6cf7fef&width=2500&cache=v2)
也不用管大小写，直接输入就是了。

## 参考

> https://dev.to/gautamkrishnar/quickbits-1-skipping-the-chrome-your-connection-is-not-private-warning-4kp1
> https://stackoverflow.com/questions/35274659/does-using-badidea-or-thisisunsafe-to-bypass-a-chrome-certificate-hsts-error
> https://chromium.googlesource.com/chromium/src/+/master/components/security_interstitials/core/browser/resources/interstitial_large.js
