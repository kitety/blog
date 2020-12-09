---
title: mysql基础知识（一）
abbrlink: 4545161d
tags:
  - Mysql
translate_title: mysql-basic-knowledge-1
date: 2020-07-24 11:57:01
---

### 目的

学习一些基本的 mysql 知识

### 预备

#### 安装 mysql

[安装教程地址](https://blog.csdn.net/u014416239/article/details/52446608)

#### 终端准备

我这里使用的是[cmder](https://cmder.net/)，并且设置为管理员模式，加上[右键快捷打开](https://blog.csdn.net/hicoldcat/article/details/64904652)，挺方便的。

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200457.png)

在准备工作完成之后，正式开始学习。

<!-- more -->

### 基础命令

- 启动停止

```bash
// 启动mysql（如果出现错误应该以**管理员模式**运行终端，mysql80lzk为我安装的时候的**服务名**）
net start mysql80lzk
net stop mysql80lzk // 停止mysql
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200506.png)

- 命令行进入

```bash
mysql -h 127.0.0.1 -P 3306 -uroot -p123456 // 安装的时候设置的(-u)账号(-p)密码
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200922.png)

- 列出数据库

```bash
show databases;
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200527.png)

- 查看表

```bash
use mysql;// 选择数据库
show tables;
// 或者
show tables from mysql;
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200743.png)

- 显示当前的数据库

```bash
select database();
```

- 查询表结构

```bash
DESC user; // user 是表结构中显示的
```

### 数据完整性

为了实现数据完整性，需要检验数据库表中的每行和每列数据是否符合要求。在创建表的时候，应该保证以后的数据输入是正确的，错误的数据不允许输入。

#### 数据类型

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200751.png)
[Mysql 列类型](https://www.runoob.com/mysql/mysql-data-types.html)

#### 默认值

用户没有指定值得情况下提供一个预先设定的值

#### 非空约束

指定某个字段不能不输入，必须提供一个非空的值。

### 实体完整性

#### 主键约束

- 表中一列或者几列组合的值能用来唯一标识表中的每一行，这样的列或者列组合称为表的主键，主键表的数据不同重复。
- 如果两列或者多列组合起来唯一标识表中的每一行，则该主键又称为"组合键"

主键选择标准

1.最少性 尽量选择单个建为主键

2.稳定性，更新频率少，稳定

#### 外键

成绩表中的学生 ID 应该在学生表中是存在的，我们应该让成绩表中的 ID 只能引用学生表中的 ID，它们的值应该是一一对应的。也就是说成绩表中的 ID 是成绩表中的外键，对应学生表的主键，这样就可以保证数据的引用完整性。

即：一个表的外键引用了其他表的主键

#### 唯一约束

唯一约束是指某个字段值是唯一的，在所有的记录中不能有重复的值。比如身份证号。

#### 标识列

- 当表中没有合适的列作为主键时可以考虑增加标识列，标识列是一个无实际业务含义的列，仅仅用来区分每条记录。
- 标识列的值是自动生成的，不能在该列上输入数据

#### 外键约束

一个表的外键引用了其他表的主键。比如成绩表中的学生 ID 会引用学生表的主键，课程 ID 会引用成绩表的主键。

- 主表没有记录，子表中不能添加相应的记录
- 修改和删除主表记录不能让子表记录孤立，必须相应修改和删除

### 数据操作

#### 创建学生表

```sql
CREATE TABLE `student` (
`id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT ,
`name` varchar(50) NOT NULL ,
`age` int(11) NULL DEFAULT NULL ,
`city` varchar(50) DEFAULT '北京'
);
```

#### 增加身份证字段

```sql
 // 在city后面增加一个字段，
 ALTER TABLE `student` ADD COLUMN `idcard` varchar(15) NULL AFTER `city`;
 // 修改一个字段为carchar(18)
 ALTER TABLE `student` MODIFY COLUMN `idcard` varchar(18) DEFAULT NULL;
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200802.png)

```sql
 // 删除身份证字段
 ALTER TABLE `student`DROP COLUMN `idcard`;
```

![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/img/20200923200809.png)

#### 添加约束

```sql
-- 主键约束
ALTER TABLE `student` ADD PRIMARY KEY (`id`);
-- 唯一约束
ALTER TABLE `student` ADD UNIQUE INDEX `uq_idcard` (`idcard`) ;
-- 默认约束
 ALTER TABLE `student` MODIFY COLUMN `city` varchar(50) DEFAULT '北京';
```

### 准备数据

创建数据库

```
创建学生表，如果前面没创建可以创建
CREATE TABLE `student` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
 `idcard` varchar(18) DEFAULT NULL,
 `age` int(11) DEFAULT NULL,
 `city` varchar(50) DEFAULT '',
 PRIMARY KEY (`id`)
);

 CREATE TABLE `course` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) DEFAULT NULL,
 PRIMARY KEY (`id`) );
```
