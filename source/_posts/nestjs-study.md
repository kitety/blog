---
title: Nestjs学习笔记
abbrlink: 2cc0ef38
date: 2022-08-29 23:58:33
translate_title: nestjs-study-notes
tags:
- Nextjs
- JS
---

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/20220830000642.png)

[nestjs 项目实战 (1)](https://www.notion.so/nestjs-1-e0a54fbadf6143b9ad32bed875831d40)

[nestjs (1)](https://www.notion.so/nestjs-1-50823f01c3194e4faf0ba223b6425b90)

# mysql 的安装信息

> C:\Users\kitety>mysqld --initialize --console
2021-12-31T13:48:46.173370Z 0 [System] [MY-013169] [Server] D:\fav\mysql-8.0.27-winx64\bin\mysqld.exe (mysqld 8.0.27) initializing of server in progress as process 8884
2021-12-31T13:48:46.352720Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2021-12-31T13:48:52.446815Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2021-12-31T13:49:10.994404Z 0 [Warning] [MY-013746] [Server] A deprecated TLS version TLSv1 is enabled for channel mysql_main
2021-12-31T13:49:10.994556Z 0 [Warning] [MY-013746] [Server] A deprecated TLS version TLSv1.1 is enabled for channel mysql_main
2021-12-31T13:49:11.166673Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: CktOrXq9ru&w
> 

输入net start mysql或sc start mysql

启动mysql服务

[https://www.codenong.com/cs122058079/](https://www.codenong.com/cs122058079/)

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
<!-- more -->

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%201.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%202.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%203.png)

nest generate controller messages/messages --flat 不会产生新的文件夹

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%204.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%205.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%206.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%207.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%208.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%209.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2010.png)

执行的时候都会变为js，那么类型就不存在了。那这是怎么做到的呢？

所以并不是所有的ts都不会被编译到js里面

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2011.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2012.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2013.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2014.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2015.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2016.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2017.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2018.png)

后面发现需要的话就会重用实例

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2019.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2020.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2021.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2022.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2023.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2024.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2025.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2026.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2027.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2028.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2029.png)

[https://www.notion.so](https://www.notion.so)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2030.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2031.png)

database

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2032.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2033.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2034.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2035.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2036.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2037.png)

user resource

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2038.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2039.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2040.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2041.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2042.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2043.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2044.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2045.png)

save和remove就是为instance设计的

更新的逻辑，效率有点低

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2046.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2047.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2048.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2049.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2050.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2051.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2052.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2053.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2054.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2055.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2056.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2057.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2058.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2059.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2060.png)

大项目

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2061.png)

小项目

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2062.png)

以后的发展

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2063.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2064.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2065.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2066.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2067.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2068.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2069.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2070.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2071.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2072.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2073.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2074.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2075.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2076.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2077.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2078.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2079.png)

[https://www.notion.so](https://www.notion.so)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2080.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2081.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2082.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2083.png)

因此需要创建拦截器

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2084.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2085.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2086.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2087.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2088.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2089.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2090.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2091.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2092.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2093.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2094.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2095.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2096.png)

[https://www.notion.so](https://www.notion.so)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2097.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2098.png)

e2e测试跳过了main.ts file

换成下面的这种

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%2099.png)

以便让e2e运行pipe和cookie-session

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20100.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20101.png)

多数据库

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20102.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20103.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20104.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20105.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20106.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20107.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20108.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20109.png)

需要注意并行运行e2e测试，并行访问sqlite文件会报错，因此改为串行`--maxWorkers=1`

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20110.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20111.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20112.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20113.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20114.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20115.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20116.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20117.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20118.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20119.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20120.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20121.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20122.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20123.png)

onetomany 数据库没有改变，Manytone，数据库有改变

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20124.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20125.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20126.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20127.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20128.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20129.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20130.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20131.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20132.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20133.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20134.png)

验证和授权

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20135.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20136.png)

需要转换为middleware

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20137.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20138.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20139.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20140.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20141.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20142.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20143.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20144.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20145.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20146.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20147.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20148.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20149.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20150.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20151.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20152.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20153.png)

typeorm cli中不能获取到connection options

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20154.png)

- 没有能力读取json、yml格式的文件
- 不应该用ts，因为直接运行的是js,其实现在已经可以了
- 不能利用环境变量来设置类型

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20155.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20156.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20157.png)

测试的时候使用这个执行的，会报错

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20158.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20159.png)

dev—js

test—ts

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20160.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20161.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20162.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20163.png)

npm install -g ts-node

[https://orkhan.gitbook.io/typeorm/docs/using-cli](https://orkhan.gitbook.io/typeorm/docs/using-cli)

To create a new empty migration use "typeorm migration:create" command
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/20220829234803.png)
![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20164.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/Untitled%20165.png)

heroku create

[https://secure-garden-44648.herokuapp.com/](https://secure-garden-44648.herokuapp.com/) | [https://git.heroku.com/secure-garden-44648.git](https://git.heroku.com/secure-garden-44648.git)

heroku addons: create heroku-postgresql:hobby-dev

Creating heroku-postgresql:hobby-dev on ⬢ secure-garden-44648... free
Database has been created and is available
! This database is empty. If upgrading, you can transfer
! data from another database with pg:copy
Created postgresql-flat-19586 as DATABASE_URL
Use heroku addons:docs heroku-postgresql to view documentation

heroku config:set COOKIE_KEY=1k23412k3j4

heroku config:set NODE_ENV=production

git push heroku master

