---
title: Mysql 学习笔记
translate_title: mysql-study-note
tags:
  - mysql
abbrlink: ed5f507a
date: 2022-09-04 17:54:20
---

## 前言
用一篇文章来记录我的Mysql学习笔记。
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/20220904180157.png)
<!-- more -->
## 基本


树状结构

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql.png)

1. 一个节点只能有一个父节点，根结点除外，不然需要引入冗余节点
2. 查询速度满，从根节点开始，树状结构
3. 每个父节点不能脱离父节点单独存在，父节点删除，自节点全部删除

关系型 表结构

![关系型数据库](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql1.png)

关系型数据库

不会有冗余数据，删除一条数据，不会影响其他

## 安装mysql
[安装mysql](https://www.runoob.com/mysql/mysql-install.html)

## 链接和断开

```bash
mysql -u root -p1234qwer!
```

退出 

```bash
exit； quit；\q
```

显示数据库 

```bash
show databases;
```

3.1 informationschema

保存着关于MySQL服务器所维护的所有其他数据库的信息。

如数据库名，数据库的表，表栏的数据类型与访问权限等

3.2 mysql

MySaL系统数据库，保存了登录用户名，密码，以及每个用户的权限等等

3.3 performance_schema

用来保存数据库服务器性能的参数

3.4 sys

这个库是通过视图的形式把information schema 利lperformence schema结合起来，查询出更加令人容易理解的数据

## 其他概念

学习数据库的增删改查（数据库，数据表，数据）

SQL

SQL语句功能划分

DDL：数据定义语句

用来定义数据库对象：创建库，表，列等。

DML：数据操作语句

用来操作数据库表中的记录

DQL：数据查询语句

用来查询数据

DCL：数据控制语句

用来定义访问权限和安全级别

数据类型分类

1. 数值类型
2. 字符串类型
3. 日期和时间类型

MySQL中常用的数据类型如下：

Double 浮点型，例如double(5,2)表示最多5位，其中必须有2位小数，即最大值为999.99；

Char：固定长度字符串类型：char (10) ‘ Inj

Varchar：可变长度字符串类型：varchar(10) ‘ Inj text：字符串类型：

Blob：二进制类型：

日期：日期类型，格式为：yyyyy-MM-dd；

时间：时间类型，格式为：hh：mm：ss

Datetime：日期时间类型 yyyy-M-dd hh：mm：Ss

注意点：在mysql中，字符串类型和日期类型都要用单引号括起来。‘Inj’ ‘2022-02-02’

## 数据库的创建

电脑数据的编码，gbk存，utf8存？，**创建的时候应该指定编码**

创建数据库

```bash
create database name1;
// 没有就创建，有的话就报错
```

```bash
create database if not exists name1;
// 有就跳过，没有就创建 good
```

```bash
create database if not exists name1 charset=字符集;
// 指定字符集
create database if not exists test3 charset=utf8;
```

注意关键字

```bash
create database if not exists `create`  charset=utf8;
// `create`包裹起来
// 注意点：如果数据库的名称是SQL的关键字或者是一些特殊字符中!@这个时候就需要用反引号括起米
```

查看数据库

```bash
show databases;
```

查看数据库全局默认编码

```bash
show variables like 'character_set_%';
```

查看一个数据库编码

```bash
show create database name;
```

> | test1    | CREATE DATABASE `test1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */ |
> 

## 数据库的删除

删除数据库

```bash
drop database name;
// 没有这个数据库会报错
// Can't drop database 'name'; database doesn't exist
```

```bash
drop database if exists name;
// 没有这个数据库不会报错，跳过
```

## 数据库的修改和查看

修改数据库的字符集

```bash
alter database name charset=字符集;
// alter database test1 charset=gbk;
```

查看数据库

```bash
show create database name; // 查看字符集
show databases; // 查看数据库
```

## 表的增删改查

**注意 ： 需要制定一个数据库**

```bash
 use name；
```

查看数据库中的表

```bash
show tables;
```

创建表

```bash
create table name(
	字段名称 数据类型，
  字段名称 数据类型，
  字段名称 数据类型，
);
// 没这个表会成功，有这个表会失败
create table stu(
	id int,
	name text	
);
// 修复
create table if not exists person(
	id int,
	name text	
);
```

查看制定表的结构

```bash
desc name;
```

> 
> 
> 
> ![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql2.png)
> 

## 删除表

制定一个表

```bash
 use name；
```

删除表

```bash
drop table name;// 没有就报错
drop table if exists name; // 兼容
```

## 修改表

修改表名

```bash
rename table 原始名称 to 新名称;
rename table stu to person;
```

添加字段

```bash
alter table 表名 add 新增字段名称 类型 [位置];
alter table person add age int;// 默认字段放在后面
alter table person add score float first; //  first 放到最前面
alter table person add phone int after name; // name 后面
```

- alter table person add age int;
    
    ![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql3.png)
    
- alter table person add score float first;
    
    ![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql4.png)
    
- alter table person add phone int after name;
    
    ![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql5.png)
    

删除字段

```bash
alter table 表名 drop 字段名称;
alter table person drop phone;
```

修改字段

1.修改数据类型

```bash
alter table 表名 modify 需要修改的字段名称 新的数据类型; 
alter table person modify score double;
```

2.修改字段名称和数据类型

```bash
alter table 表名 change 原始字段名称 新字段名称 新的数据类型;
alter table person change age address text;
```

## 存储引擎

MySQL中有三种存储引擎，分别是：

- MyISAM：安全性低，但不支持事务和外键，适合频繁插入和查询的应用
- InnoDB(默认）：安全性高，支持事务和外键，适合对安全性，数据完整性要求较高的应用
- Memory：访问速度极快，但不会永久存储数据，适合对读写速度要求较高的应用

```bash
create table stu(
    id int,
    name text
)engine=引擎名称;
```

不同引擎的本质

数据库的本质就是文件，只要创建一个数据库，就会创建文件夹

创建一张表，就会在指定数据库目录创建一个文件，这个文件会保存结构

| 引擎 | 内容 | 存储文件 |
| --- | --- | --- |
| InnoDB | 创建表就会自动创建一个文件
.ibd 保存了这张表的结构 | ibdata1,ibdata2 |
| MyISAM | 自动创建三个文件
.sdi 表的结构
.MYD 表中存储的数据
.MYI 表中索引 | .MYD文件 |
| Memory | 创建.sdi文件，保存结构信息
将数据保存在内存中 | 内存 |

修改表的存储引擎

```bash
alter table 表明 engine=名称;
```

## 插入和更新数据

插入数据

```bash
INSERT INTO table_name ( field1, field2,...fieldN )
                       VALUES
                       ( value1, value2,...valueN );
// 
INSERT INTO person ( score,id,name,address )
                       VALUES
                       ( 1.1,1,"nihao","china");
```

查看数据

```bash
SELECT column_name,column_name
FROM table_name
[WHERE Clause]
[LIMIT N][ OFFSET M]
```

更新数据

```bash
UPDATE table_name SET field1=new-value1, field2=new-value2
[WHERE Clause]
//
// 不指定条件就更新整张表
update person set score=2.2323;

// 指定更新 更新满足条件的
update person set score=99.2 where id=12;

// 可以多个条件指定
update person set score=99.2 where id=12 AND name="nihao2";
update person set score=99.2 where id=12 OR name="nihao";

// 更新多个字段
update person set score=991.2,address='new address' where id=12 OR name="nihao";

```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql6.png)

## 查询表数据

全部

```bash
select * from 表名 [where]
```

指定字段

```bash
select 字段1，字段2 from 表名 [where]
```

where 支持的运算符

```bash
=（等于）、！=（不等于）、《〉（不等于）、〈（小于）、〈=（小于等于）、＞（大于）、>=（大于等于）；
IN (set)；固定的范围值
PETWEEN•••AND：值在什么范围
IS NULL：（为空） IS NOT NULL （不为空
AND：与
OR；或
NOT：非
```

比如

```bash
select * from stu where score in (77, 88)
```

## 删除表数据

删除数据

```bash
delete from 表名 [where 条件];
// select name from person where id>5;
```

删除所有的数据

```bash
delete from 表名;
```

## Navicat
[Navicat](https://www.navicat.com.cn/)

## 数据类型

根据数据类型分配存储空间，正确的数据类型，可以合理分配存储空间，完整保存数据，更好的对数据库进行优化。

 MySQL中有哪些数据类型？

#### **整型类型**

1. 数字分为有符号还是无符号
2. 超出返回会报错
3. 默认为有符号 数据类型加上unsigned 变为无符号的
4. 设置位宽

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql7.png)

设置位宽

```bash
create table person2(
    id int,
    age tinyint (2) zerofill 
)
```

无符号的类型指定

```bash
create table person2(
    id int,
    age tinyint unsigned
)
```

#### **浮点类型**

- 占用空间不一样
- 小数的位数不同
- 保存数据的有效精度不同

创建的时候指定小数位数

```bash
float(m,d)
double(m,d)
// m 总的位数，d小数位数

create table person2(
    id int,
    weight FLOAT (10, 6), height DOUBLE (10, 6)
)
```

```bash
// 精度
create table person3(
    id int,
    weight FLOAT (20, 19),
    height DOUBLE (20, 19)
)

insert into person3 values (1, 1.12345678901234567890, 1.12345678901234567890);

weight: 1.1234568357467651000

height: 1.1234567890123457000
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql8.png)

#### **定点类型**

将数据分为证书和小数部分来存储，每个部分都是整数，精确存储，比较费资源

```bash
create table person4(
    id int,
    weight decimal (21,20)
    height decimal (21,20)
)

insert into person4 values (1, 1. 12345678901234567890, 1.12345678901234567890);
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql9.png)

#### **字符类型**

- 保存的数据的容量不一样
- char不会回收多余的字符，要多少给多少
- varchar会回收多余的字符，用多少给多少
- 建议使用单引号
- carchar理论可以存储65535字符，但是会随着当前数据库的字符集改变而改变
- 字符集utf8 一个字占三个字节，65535/3=21845
- 字符集gbk 一个字占两个字节，65535/2=32767

```bash
例如：通过 char(2)存储存储数据’a’，存储的结果是’ a’；
例如：通过 varchar(2）存储存储数据’a’，存储的结果是’a；
```

```bash
create table person(
    id int,
    namel char (2),
    name2 varchar (2)
)

insert into person values (1, ' a','b');
insert into person values (1, '12','34'）;
insert into person values (1, 'abc','def'):#只要超出申请的范围就会报错
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql10.png)

#### **文本类型**

mysql中每一行存储的数据大小是有限制的，每一行最多65534字节

大文本类型 可以突破。大文本类型在表中并不会实际占用所能保存的字节数，而是利用10个字节引用了实际保存数据的地址. 占用的只有十个字节，存的是真实地址。

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql11.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql12.png)

#### **枚举类型**

如果某个字段值只能取固定的某些值，几个固定值之中的几个

底层是通过整型来实现的

和其他的变成语言不通，其他的枚举是从0开始，mysql是从1开始.

因此也可以通过整数的形式去设置

```bash
// enum(v1,v2,...)
create table person(
    id int,
    gender enum（'男","女'）
)
```

#### **集合类型**

几个固定值中的几个

mysql也是通过整数的形式实现的

mysql集合类型按照2(n)实现的 方便位运算

```bash
//  set(v1,v2,v3...)
create table person
 id int,
 hobby set( '篮球','足球','高尔夫球','排球'）
)

insert into person values (1,'篮球,足球,高尔夫球')
```

#### **日期类型**

时间需要单引号扩起来

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql13.png)

```bash
create table person (
    id int,
    filedl DATE,
    filed2 TIME,
    filed3 DATETIME
)
// 报错，时间需要单引号扩起来
insert into person values (1, 2020-02-02, 14:18:23, 2020-02-02 14:18:23);
// 完美
insert into person values (1, '2020-02-02', '14:18:23', '2020-02-02 14:18:23');
```

#### **布尔类型**

mysql boolean类型也是整型实现的，0假1真，底层本质是mysql是使用c c++实现，所以非0就是真

boolean 真假

数值类型

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql14.png)

## 数据完整性-主键

1. 什么是数据的完整性
保证保存到数据库中的数据都是正确的。
2. 如何保证数据完整性？
数据的完整性可以分为三类：实体完整性、域完整性、参照完整性
3. 实体完整性
    1. 什么是实体？
    表中的一行数据就是一个实体 (entity) 
    2. 如何保证实体完整性？
    保证实体完整性就是保证每一行数据的唯一性
4. 实体完整性的约束类型
    - 主键约束 (primary key)
    - 唯一约束(unique)
    - 自动增长列 (auto_ increment)
5. 主键约束 (primary key)
    
    主键用于唯一标识表中的每一条数据，和现实生活中的身份证很像
    
    ```bash
    create table person (
        id int,
        name varchar (20)
    );
    // 下面的不会报错，但是会有问题，没有唯一性
    insert into person values (1," Inj");
    insert into person values (1," Inj");
    ```
    
    有效的
    
    ```bash
    create table person (
        id int primary key,
        name varchar (20)
    )
    // 下面的会报错，唯一性问题
    insert into person values (1," Inj")
    insert into person values (1," Inj")
    // 或者
    create table person (
        id int,
        name varchar (20),
        primary key(id)
    ) ;
    ```
    
    特征如下
    
    1. 如果某一个字段设置为主键，那么字段的取值不能重复
    2. 如果设置为主键，不能是nul
    3. 一张表中只能有一个主键，不能出现多个主键
    4. 除了可以在字段的数据类型后添加，还可以通过在最后写上primary key(name)

## 数据完整性-联合主键

### 联合主键

我们通过将表中的某个永远不重复的字段设置为主键，从而达到保证每一行数据的唯一性(实体完整性）

但是在企业开发中有时候我们可能找不到不重复的字段，此时我们还可以通过联合主键的方式来保证每一行数据的唯一性

 **联合主键就是同时将多个字段作为一个主键来使用，**多个字段的取值的组合不重复

```bash
create table person(
	name varchar(20),
	age int,
  primary key(name,age)
)
insert into person values (" Inj",1)
insert into person values (" Inj",1)
```

## 数据完整性-唯一约束

唯一约束保证某个字段的值永远不重复

```bash
create table person(
	name varchar(20) unique,
	age int
)
insert into person values (" Inj",1)
insert into person values (" Inj",1)

// 多个unique
create table person(
	name varchar(20) unique,
	age int unique
)
insert into person values (" Inj",1)
insert into person values (" Inj",1)
```

唯一约束和主键约束的异同

1. 同：被约束的字段的取值不能重复
2. 异：主键在一张表中只有一个，唯一约束可以有多个 
3. 唯一约束可以为空，主键不能为空

## 数据完整性-自动增长约束

自动增长约束的作用是让某个字段的取值从1开始递增，从而保证实体完整性

必须是主键才可以自动增长

```sql
create table person (
    id int auto_increment primary key,
    name varchar (20)
);
// 下面的会报错，唯一性问题
insert into person values (null," Inj");
insert into person values (default," Inj");
```

default 或者null 就自动关增长

在企业开发中如何选择主键呢？最少性和稳定性

最少性：能用一个字段作为主键，就不要使用多个字段

稳定性：能用不被操作（修改）的字段作为主键，就不要使用会被操作的字段作为主键

一般情况会定义id字段，并且字段为整形，自动增长，设置为主键

## 实体完整性

没有这些的时候 添加这些

如何修改约束

1.如何修改主键约束

```sql
alter table 表名 add primary key(字段);
// 
create table person (
    id int,
    name varchar (20)
);
// 
insert into person values (1," Inj")
insert into person values (1," Inj")
```

2.如何修改唯一约束

```sql
alter table 表名 add unique(字段);
// 
create table person2 (
    id int,
    name varchar (20)
);
// 
insert into person values (1," Inj")
insert into person values (1," Inj")
```

3.如何修改自动增长约束

```sql
alter table 表名 add primary key(字段);
alter table 表名 modify 字段 数据类型 auto_increment;
// 
create table person2 (
    id int,
    name varchar (20)
);
// 
insert into person values (null," Inj")
insert into person values (default," Inj")
```

## 域完整性

1.什么是域？

行数据中的每个单元格都是一个域

2.如何保证域的完整性？

保证域的完整性就是保证每个单元格数据的正确性

使用正确的数据类型

例如：人的年龄不可能超过255岁，而且不能是负数，所以我们就可以使用 TINYINT UNSIGNED

例如：人的性别只能是男/女，所以我们就可以使用枚举类型

例如：要存储比较多的文字，为了保证不超出每一行最大的存储限制，我们就可以使用大文本类型 

- 使用非空约束 (not null)
- 使用默认值约束 (default)

非空约束

```sql

create table person (
    id int,
    name varchar (20) not null
);
insert into person values (1," Inj");
insert into person values (null,null);
```

默认值

```sql
create table person (
    id int,
    name varchar (20) default '这是默认值'
);
insert into person values (1," Inj");
insert into person values (null,null);
insert into person values (null,default);
```

注意点null，也不会使用默认值，使用default才会使用

## 表与表之间的关系

1.参照完整性

参照完整性又称引用完整性，主要用于保证多表之间引用关系的正确性

2.为什么要创建多张表？

示例：定义一张表保存2个学生3门课程的成绩

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql15.png)

如果将所有的数据都放到一张表中，会出现大量元余数据(学生信息保存)

所以为了降低数据库的体积，提升数据库的效率，我们需要根据自身需求对表进行拆分

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql16.png)

3.什么时候会出现冗余数据

表与表之间的关系可以分为三种 一对一、一对多、多对多

3.1 一对一

 一般不用拆分

| id | name | gender | mateId |
| --- | --- | --- | --- |
| 1 | A | 1 | 2 |
| 2 | B | 0 | 1 |
| 3 | C | 1 | 4 |
| 4 | D | 0 | 3 |

3.2 一对多关系

拆

一个人有多辆车，一个班有多个学生，一个人有多门成绩

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql17.png)

3.3 多对多关系

拆

一个学生有多个老师，一个老师有多个学生

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql18.png)

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql19.png)

## 参照完整性

1. 如何保证参照完整性？

默认情况下表与表之间是独立存在的，不会相互影响

也正是因为如此，默认情况下也不会检查表与表之间的依赖关系

所以为了保证表与表之间参照完整性，我们可以通过’外键’来保证参照完整性

```sql
create table stu(
	id int auto_increment primary key,
	name varchar(20),
	gender enum('男','女')
)

create table grade(
	id int auto_increment primary key,
	km varchar(20),
	score double,
	uid int
)

insert into stu values (null,'zs','男')
insert into stu values (null,'ls','女')

insert into grade values (null,'语文',100，1);
insert into grade values (null,'数学',100，1);
```

2. 什么是外键？

如果一张表中有一个字段指向了别一张表中的**主键**，就将该字段叫做外键

例如：成绩表中的uid引用了学生表中的id，那么成绩表中的uid我们就称之为外键

后面插入数据的时候会进行检查

```sql
-- create table stu2(
-- 	id int auto_increment primary key,
-- 	name varchar(20),
-- 	gender enum('男','女')
-- );

create table grade2(
	id int auto_increment primary key,
	km varchar(20),
	score double,
	uid int,
  foreign key(uid外键) references stu2(id主键)
);

insert into stu2 values (null,'zs','男');
insert into stu2 values (null,'ls','女');

insert into grade2 values (null,'语文',100,1);
insert into grade2 values (null,'数学',100,1);
insert into grade2 values (null,'语文',100,2);
insert into grade2 values (null,'数学',100,2);

// error
insert into grade2 values (null,'数学',100,3);
```

3.外键注意点：

- 只有InnoDB的存储引擎才支持外键约束
- 外键的数据**类型**必须和指向的主键一样
- 在一对多的关系中，**外键一般定义在多的一方**(一个学生有多门成绩，那么外键定义在成绩表中）
- 定义外键的表我们称之为从表，被外键引用的表我们称之为主表

4. 创建表时定义外键

foreign key(外键字段名称）references 主表名称(主表主键名称) 

## 参照完整性

1.如何动态添加外键

```html
alter table 从表名称 add foreign key(外键字段名称） references 主表名称(主表主键名称）;

create table grade(
	id int auto_increment primary key,
	km varchar (20),
	score double,
	uid int
);
// alter table grade add foreign key(uid) references stu(id);
insert into grade values (null,"语文',100,3);
```

2.如何查看外键是谁

```html
show create table 从表名称;
show create table grade

CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `km` varchar(20) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `stu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk
```

注意点

```html
CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `stu` (`id`)
- uid变为外键，外键名称为grade_ibfk_1
- uid取值引用的是stu表中id字段的值
```

3.如何动态删除外键

```html
alter table 从表名称 drop foreign key 外键名称;
alter table grade drop foreign key grade_ibfk_1;
```

## 参照完整性 外键的操作

1.外键的操作

严格操作：（前面讲解的都是严格採作）

- 主表不存在对应数据，从表不允许添加

```jsx
insert into grade values (null,"语文',100,3);
```

- 从表引用着数据，主表不允许删除

```jsx
delete from stu where id=1;// 会失败
```

- 从表引用这数据，主表不允许修改

```jsx
update stu set id=3 where id=1;// 失败
```

買空操作(null)：

- 在企业开发中，我们可能必须要删除主表中的数据，但是如果主表被删除了从表就不完整了所以在企业开发中，我们可以通过置空操作，在删除主表数据的同时删除从表关联的数据

```sql
create table grade2(
	id int auto_increment primarykey, km varchar (20),
	score double,
	uid int,
	foreign key (uid) references stu (id) on delete set null
)// 主表删除，从表**引用置空**，
insert into grade values (null,"语文',100,3);
update stu set id=3 where id=1;// 失败
```

级联操作 (cascade)：

在企业开发中，我们可能必须要修改主表中的数据，但是如果主表被修改了从表就不完整了所以在企业开发中，我们可以通过’级联操作’，在修改主表数据的同时修改从表关联的数据

```jsx
create table grade3(
	id int auto_increment primarykey, km varchar (20),
	score double,
	uid int,
	foreign key (uid) references stu (id) on update cascade
)// 主表删除，从表引用置空，
insert into grade3 values (null,"语文',100,3);
delete from stu where id=1; 

[constraint 外键名称] foreign key（外键字段）references 主表（主键）[主表删除的动作][主表更新的动作] 
-般情况下主表删除时从表置空，主表更新时从表级联
```

## 参照完整性 多对多外键

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql20.png)

```sql
// 创建学生表
create table stu(
  id int auto_increment primary key,
  name varchar(20),
  gender enum('男', '女')
);
// 创建教师表
create table teacher(
  id int auto_increment primary key,
  name varchar(20),
  gender enum('男', '女')
);
create table rel(
	stuId int,
	teacherId int
)

// 添加外键
alter table rel add foreign key(stuId) references stu(id)
alter table rel add foreign key(teacherId) references teacher(id)

// 添加数据
INSERT INTO stu VALUES(NULL,'zhangsan','男')
INSERT INTO stu VALUES(NULL,'lisi','男')
INSERT INTO teacher VALUES(NULL,'wangwu','男')
INSERT INTO teacher VALUES(NULL,'zhaoliu','男')

INSERT INTO rel VALUES(2,1)// 正常
INSERT INTO rel VALUES(2,12) // 错误

```

## 单表查询

1. 单表查询

seleet  * from 表名；#查询表中所有数据

selpet 字段1，字段2 from 表名：＃查询表中指定宁段数据

select [* || 字段] from 表名 [where 条件]；#查询表中满足条件的数据

2.什么是结果集

通过查询语句查询出来的结果我们就称之为结果集

结果集以表的形式将查询的结果返回给我们

**注意点：**

结果集返回的表和查询的表不是同一张表

被查询的表是真实存在的，是存储在磁盘上的

而结果集不是真实存在的，是存储到内存中的

3. 如何给结果集的字段别名

查询指定字段数据时，我们可以通过as给指定字段取别名 

```sql
SELECT name as myName， age as myAge FROM stu；
```

4.什么是字段表达式？

查询数据的时候，除了可以查询指定字段的数据以外，我们还可以查询表达式的结果 

```sql
SELECT 6+6;
```

5.什么是伪表？

字段表达式虽然能够查询出表达式的结果，但是不符合MySql的规范

所以我们可以通过伪表(dual）的方式让字段表达式符合MySQL的规范

```sql
 SELECT 6+6 from dual；
```

## 模糊查询

where

```sql
where支持的运算符

=（等于）、！=（不等于）、〈〉（不等于）、〈（小于）、〈=（小于等于）、〉（大于）、>=（大于等于）；

IN (set)：固定的范围值

BETVEEN...AND：值在什么范围

IS NULL：（为空）IS NOT NULL（不为空）

AND；与

OR；或

NOT：非

LIKE： 模糊杳询
```

通配符

1.模糊查询格式:

```sql
select 字段 from 表名 where 字段 like'条件";
_ 通配符:表示任意一个字符
% 通配符:表示任意0～n个字符

a_c:
abc, adc,( abbc, ac  不行)

_a_c:
1abc, 3adc （abc1，2abhc不行）

a%c:
abc, adc, abbc, ac （都行）

%a%c:
labe, , 2abbc, 3adc （abcl 不行）
```

```sql
查询
SELECT * FROM stu WHERE NAME LIKE "lis%"
// 也可以 “z_%”
```

## 单表查询 order by

1.排序 order by

```sql
select 字段 from 表名 order by 字段 [asc | desc];
// desc 降序
// asc 升序 默认

select * from stu order by id DESC,score  asc;
// id 一样，按照score升序
```

## 聚合函数

1.统计计算

```sql
count() 统计
select count(*) from stu

sum() 求和
select sum(id) from stu

avg()求平均值
select AVG(id) from stu

max() 获取最大值
select max(id) from stu

min()获取最小值
select min(id) from stu
```

2.数值类

```sql
rand()生成随机数 
select rand() from dual;
select * from stu order by rand()

round()四舍五入
select round(1.2) from dual;

ceil() 向上取整
select ceil(1.2) from dual;

floor() 向下取整
select floor(1.2) from dual;

truncate() 截取小数位
select truncate(1.234567,2) from dual;
```

3.字符串类

```sql
ucase()：#转换为大写
select ucase('hello') from dual;

lcase()；#转换为小写
select lcase('HELLO') from dual; 

left()；#从左边指定位置开始截取到
select left('1234567890'，3) from dual; //123

right()；#从右边指定位置开始截取
select right('1234567890'，3) from dual; //890

substring()；#从指定位置开始截取指定个字符
select substring('1234567890',3,5) from dual;// 34567,第三个开始，截取5个
```

## 数据分组

1. 数据分组 group by

```sql

select 分组字段|| 聚合函数 from 表名 group by 分组字段:
```

```jsx
统计表中一共有多少stuId
SELECT stuId FROM rel
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql21.png)

```jsx
统计表中一共有多少stuId，根据stuId分组
SELECT stuId FROM rel GROUP BY stuId
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql22.png)

```jsx
每个id有多少人
SELECT stuId,COUNT(*) FROM rel GROUP BY stuId
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql23.png)

注意点

1. 在对数据进行分组的时候，select 后面必须是分组字段或者聚合函数，否则就只会返回第一条数据

```jsx
elect city from stu group by city;

select name from stu group by city;

select city, group_concat(name) from stu group by city;
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql24.png)

## 条件查询 having

having和where很像都是用来做条件查询的

但是where是去**数据库**中查询符合条件的数据，而having是去**结果集**中查询符合条件的数据

```jsx
select * from stu where id=1
// 从数据库查找

select name from stu where id=1// 有结果
```

```jsx
select * from stu having id=1
// 从select * from stu 的结果集查找

select name from stu having id=1// 没有结果
```

```jsx
需求:select city from stu group by city:

需求:select city, avg (score) from stu group by city;

需求:select city, avg (score) as average from stu group by city;

需求:select city, avg (score) as average from stu group by city having average>=60
```

## 数据分页

1.分页 limit:

```jsx
select 字段 from 表 limit 索引,个数;
```

## 查询选项

select[查询选项]字段名称 from 表名：

```jsx
select [查询选项] 字段名称 from 表名：
all  显示所有查询出来的数据[默认] 
distinct  去除结果集中重复的数据之后再显示
```

```jsx
select all stuId from rel
select distinct stuId from rel
```

 注意

如果是通过distinct来对结果集中重复的数据进行去重，那么只有所有列的数据都相同才会去重

```jsx
select distinct * from rel // 全部
select distinct stuId from rel // stuId 去重

```

```jsx
完整的查询语句

select[查询选项]宁段名称 [from 表名〕[where 条件〕 Lorder by 排序〕[group by 分组]
[having 条件] [limit分页]
```

## 多表查询

1.多表查询

多表查询只需要在单表查询基础上增加一张表即可 

```jsx
select * from 表名1，表名2；
```

注意点：

默认情况下多表查询的结果是笛卡尔集

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql25.png)

2.union

在纵向上将多张表的结果结合起来返回给我们

```jsx
select * from 表名1 union select * from 表名2
```

注意

1. 使用union进行多表查询，返回的结果集的表头的名称是第一张表的名称
2. 使用union进行多表查询，必须保证多张表查询的字段个数一致
3. 使用union进行多表查询，默认情况下会自动去重
4. 使用union进行多表查询，如果不想自动去重，那么可以在union后面加上all

```jsx
select * from 表名1 union all select * from 表名2
// 不去重
```

## 表的连接

1.表的连接查询

将多张表中’关联的字段’’连接’在一起查询我们称之为’表的连接查询’ 

大白话：查询多张表中满足条件的数据

```jsx
select * from stu, grade where stu.id = grade. stuld:
```

1.1内连接 inner join

在内连接中只会返回满足条件的数据

在进行多表查询的时候，如果想查询指定的字段，那么必须在字段名称前面加上表名才行

```jsx
select * from 表名1 inner join 表名2 on 条件;
select * from stu inner join grade on stu. id = grade. stuld;
select stu.id,stu.name,grade.score from stu inner join grade on stu. id = grade. stuld;
```

1.2外连接

1.2.1左外连接 left join

在左外连接中，左边的表是不看条件的，无论条件是否满足，都会返回左边表中所有的数据

在左外连接中，只有右边的表会看条件，对于右边的表而言，只有满足条件才会返回对应的数据

```jsx
#select stu.id, stu.name, grade. score from stu left join grade on stu.id=grade.stuld:
在以上的查询语句中stu表在左边，grade表在右边 
所以stu表不看条件，只有grade表看条件
```

1.2.2右外连接 right join

在右外连接中，左边的表是不看条件的，无论条件是否满足，都会返回左边表中所有的数据

在右外连接中，只有左边的表会看条件，对于左边的表而言，只有满足条件才会返回对应的数据 /

```jsx
#select stu。 id， stu。 name， grade。 score from stu right join grade on stu。 id = grade。 stuld；
在以上的查询语句中stu表在左边，grade表在右边

所以stu表看条件，只有grade表不看条件
```

1.3交叉连接 Cross join

如果没有指定条件，那么返回笛卡尔集

如果指定了条件，那么就等价于内连接

1.4全连接 full join (MySQL不支持全连接）

## 自然连接

1.自然连接 (natural)

自然连接是用来简化’内连接和外连接’的

如果多张表需要判断的条件字段名称一致，那么不用编写条件，自然连接会自动判断

1.1自然内连接

```jsx
select * from 表名1 inner join 表名2 on 条件;
select * from stu inner join grade on stu.id=grade.stuId;
stu 改为 stuId
select * from stu naturl join grade;
```

注意

1. 如果没有指定条件，也没有同名的字段，那么就会返回笛卡尔集
2. 在自然连接中，返回的结果集会自动优化，会自动去除重复的判断字段

1.2自然外连接

1.2.1自然左外连接

```jsx
select * from stu naturl left join grade;
```

1.2.1自然右外连接

```jsx
select * from stu naturl right join grade;
```

## using关键字

using关键字

如果多张表需要判断的条件字段名称一致,那么除了可以使用自然连接来简化以外还可以使用using关键字来简化

1.1内连接

```jsx
select * from stu inner join grade on stu. stuld = grade. stuld;
select * from stu inner join grade using(stuld)
```

1.2外连接

1.2.1左外连接

```jsx
select * from stu left join grade   using(stuld)
```

1.2.2右外连接

```jsx
select * from stu right join grade  using(stuld)
```

## 子查询

1.子查询

将一个查询语句查询的结果作为另一个查询语句的条件来使用

将一个查询语句查询的结果作为另一个查询语句的表来使用

2。将一个查询语句查询的结果作为另一个查询的条件来使用

2.1标准子查询（返回的结果只有一个）

```sql
select stuId from grade where score = 100;// stuld 3
select name from stu where stuld = 3;

select name from stu where stuId = (select stuId from grade where score = 100);
```

2.2非标准子查询（返回的结果有多个）

```sql
select stuId frpm grade where score ＞= 60; // stuId 1 3 
select name from stu where stuld = 3 OR stuld = 1;
select name from stu where stuld in(3, 1);

seleet name from stu where stuld in (select stuld from grade where score >= 60)

```

3。 将一个查询语句查询的结果作为另一个查询的表来使用

```sql
select name, city, score from person where score >= 60:

seleet name, city, score from (select name, city, score from person where score>60) as temp;

```

注意点：

如果要将一个查询语句查询的结果作为另一个查询的表来使用，那么必须给子查询起一个别名

## 事务介绍

银行表

| cardId | name | money |
| --- | --- | --- |
| 1001 | zs | 1000 |
| 1002 | ls | 1000 |

ls给zs转账1000

第一种情况：

1。首先从ls的卡上扣除1000块钱

```sql
update bank set money = money - 1000 where carld=1002
```

2。然后再给zs的卡上增加1000块钱

```sql
update bank set money = money + 1000 where carld=1001
```

第二种情况：

1。首先给zs的卡上增加1000块钱

```sql
update bank set money = money + 1000 where carld=1001
```

2。然后再从Is的卡上扣除1000块钱

```sql
update bank set money = money - 1000 where carld=1002
```

如果停电了怎么半？会中断

1.事务基木概念

MySQL中的事务主要用于处理容易出错的数据。

事务可以用来维护数据库的完整性，保证成批的 SQL语句要么全部热行，要么全部不执行。

事务用来管理 insert， update， delete 语句

MySQL中只有使用了 Innodb 数据库引擎的表才支持事务。

## 事务原理和使用

事物语法

开启事务:start transaction

提交事务:commit

回滚事务:rollback

3.示例一:

```sql
create table bank(
	id int unsigned auto_ increment primary key,
	candid varchar (4),
	name varchar (20),
	money int
)

insert into bank values (null, 1001 Zs 1000),(null,'1002','ls',1000)s
```

第一种:先扣再增加

```sql
update bank set money=money-1000 where cardid=' 1002' 
update bank set money=money+1000 where cardid=' 1001'
```

第二种:先增加再扣

```sql
update bank set money=money+1000 where cardid='1001' 
update bank set money=money-1000 where cardid='1002'
```

使用事物

```sql
start transaction:
update bank set money=money-1000 where cardid-' 1002' 
// collback
update bank set money=money+1000 where cardid-' 1001'
// commit
```

注意点：

事务的本质是开启事务的时候拷贝一张一模一样的表

然后执行相关的操作都是在拷贝的这张表中做操作

如果失败了，如果执行了rollback，那么系统就会自动删除拷贝的这张表

所以失败了不会影响到原有的数据

如果成功了，如果扒行了comnit，那么系统就会自动利用拷贝表中最新的数据後盖原有表中的数据所以成功了会影响到原有的数据

## 事务回滚点

事务回滚点

**记住需要commit**

```sql
savepoint 回滚点名称 

rollback to 回滚点名称
```

```sql
start transaction;

insert into bank values (null, 1003 '333', 33333):

savepoint abc;

insert into bank values (null,'1003','444', 44444);

Savepoint def:

insert into bank values (null, 1003,'555',55555):
```

## 事务特点

事务特点：

1.原子性（关注的是状态）：

事务开启后的所有操作，要么全部成功，要么全部失败，不可能出现部分成功的情况事务扒行过程中如果出错，哪怕我们不手动回滚，系统也会自动帮我们回滚

2.一致性（关注数据可见性）：

事务开始前和结束后，数据库的完整性约束没有被破坏

例如 A向B转账，不可能A扣了钱，B却没收到

3.持久性：

事务完成后，事务对数据库的所有操作是永久的，操作完成之后就不能再回滚

4.隔离性：

数据库允许多个并发事务同时对其数据进行读写和修改的能力， 隔离性可以防止多个事务并发执行时由于交叉执行而导致数据的不一致。

## 事务隔离级别

1.事务隔离级别

读未提交(read uncommitted):一个事务可以读取另一个未提交事务的数据

读提交(read committed):一个事务要等另一个事务提交后才能读取数据

可重复读(repeatable read）:一个事务范围内多个相同的查询返回相同的结果

申行化(serializable）:前面一个事务没有执行完后面一个事务不能执行

查看隔离级别:

全局的:select @@global. transaction_ isolation;

当前会话的:select @@transaction_ isolation:

设置隔离级别:

全局的:set global transaction isolation level 级别名称;

当前会话:set session transaction isolation level 级别名称:

#### 脏读

能读取到其它事务没有提交的数据示例:

A客户端:

```sql
set session transaction isolation level read uncommitted:

start transaction:

update bank set money=money-1000 where cardId=' 1002' select * from bank;
```

B客户端:

```sql
set sessioll transaction isolation level read uncommitted;

select 米 fron bank:
```

**解决办法：读提交 read committed**

#### 不可重复读

一个事务范围内多次查询的结果不同示例:

A客户端:

```sql
set session transaction isolation level read committed;

start transaction;

select * from bank:
```

B客户端:

```sql
set session transaction isolation level read committed;

start transaction;

update bank set money=money-1000 where cardld= 1002 commit:
```

**解决办法：可重复读**

#### 重复读

一个事务范围内多次查询的结果相同 A客户端:

```sql
set session transaction isolation level repeatable read:

start transaction:

select * from bank:
```

B客户端:

```sql
set session transaction isolation level repeatable read;

start transaction;

update bank set money=money-1000 where cardid=' 1002' commit:
```

幻读的问题，改为串行化

#### 串行化

保证永远的都是这个正确的，但是性能比较低

幻读

读到到的结果并不是最终的结果

```sql
set session transaction isolation level serializable;

start transaction:

select * from bank:
```

B客户端:

```sql
set session transaction isolation level serializable;

start transaction:

update bank set money=money-1000 where cardid= '1002' commit;
// 会卡在这里
// update bank set money=money-1000 where cardid= '1002' commit;
```

事务隔离级别对应关系

| 事务隔离级别 | 脏读 | 不可重复读 | 幻读 |
| --- | --- | --- | --- |
| 读未提交 | 是 | 是 | 是 |
| 不可重复读 | 否 | 是 | 是 |
| 可重复读 | 否 | 否 | 是 |
| 串行化 | 否 | 否 | 否 |

## 视图基本概念

1.视图基本概念

视图本质就是将结果集缓存起来

由于结果集是一张虚拟的表，所以视图也是一张虚拟的表由于结果集是建立在表的基础上的，所以视图也是建立在表的基础上的

2.视图的作用：

视图可以用来简化SQL语句

视图可以用来隐藏表的结构

视图可以用来提升数据安全性

3.创建视图语法

```sql
create view 视图名称 as select 语句；

SELECT name, city FROM person WHERE score >= 60;

CREATE VIEW person_view AS SELECT name, city FROM person WHERE score >= 60;

SELECT * FROM person_view

```

```sql
SELECT name, score FROM Stu INNER JOIN grade on stu.stuld = grade.stuId;
create view stu_view as SELECT name, score FROM Stu INNER JOIN grade on stu.stuld = grade.stuId;
```

## 视图基本操作

1.视图数据操作

```sql
INSERT INTO person_view values ('it','武汉'）;
```

注意点：

由于视图保存的是结果集，由于结果集是基于原始表的所以操作视图中的数据，本质上操作的是原始表中的数据，在原来的数据里面也会看到

```sql
SELECT * FROM person view;

INSERT INTO person view values ('it666','武汉'）;

UPDATE person View set city='香港' name='it666':

DELETE FROM person view WHERE name=' it666';
```

2.修改视图内容

```sql
alter view 视图名称 as select 语句:
```

1. 删除视图

```sql
drop view if exists 视图名;
```

## 创建视图完整语句

1.视图完整语句

```sql
create [algorithm= {merge || temptable || undefined} ] view 视图名称

select 语句

[with check option]
```

2。 视图算法

merge：合并式(替代式）算法

将视图的语句和外层的语句合并之后再执行

改算法允许更新数据

```sql
SELECT name, city FROM person;
CREATE algorithm=merge VIEW person_view1 AS SELECT name, city FROM person;

SELECT * from person_view1;
// 等价于
SELECT * from (SELECT name, city FROM person) as t;

// 增删改查都可以
INSERT INTO person_view values ('it','武汉'）;
```

temptable：临时表(具代式）算法

将视图生成一个临时表，再执行外层的语句

该算法**不允许**更新数据

```sql
SELECT name, city FROM person;
CREATE algorithm=temptable VIEW person_view2 AS SELECT name, city FROM person;

// 等价于
(SELECT name, city FROM person) as t
select * from t 

// 增删改查都不可以
INSERT INTO person_view values ('it','武汉'）;
```

undefined：未定义算法，默认

由MySQL自己决定使用如上的哪一种算法，默认就是undefined 

一般情况下会自动选择merge算法

3.视图限制(with check option)

在with check option的选项下,可以总结为

1.要保证数据update之后也要符合where的条件

2.要保证insert之后的数据能被视图查询出来

3.对于delete,有无 with check option都一样

4.对于没有where字句的视图,使用with check option是多余的

默认情况下哪怕插入的数据和更新的数据不符合创建视图条件，我们也是可以通过视图来插入和更新的

```sql
SELECT name, city, score FROM person WHERE score ＞= 60;
CREATE VIEW person_view AS SELECT name, city, score FROM person WHERE Score ＞= 60;
// 随便编辑
INSERT INTO person_view values('it666','台湾',33)
```

如果想让插入和更新的数据必须符合创建视图的条件，那么就可以在创建视图的时候添加限制条件

```sql
SELECT name, city, score FROM person WHERE score ＞= 60;
CREATE VIEW person_view AS SELECT name, city, score 
FROM person WHERE Score ＞= 60 with check option;
// 下面的会失败，不符合条件
INSERT INTO person_view values('it666','台湾',33)
```

## 更新视图

视图更新限制

1.1如果视图的算法是merge 算法，那么可以更新视图

1.2如果没有指vith check option，那么无论数据符不符合创建视图条件都可以更新

1.3如果指定了with check option，那么只有符合创建视图条件才可以更新

1.4除此之外由于视图是一张虚拟表，视图是基于原始表的，更新视图的本质就是更新原始表所以只有原始表中存在的原始数据才可以更新，通过其它方式生成的数据都不可以更新

2.更新限制

聚合函数

DISTINCT关键字

GROUP BY子句

HAVING子句

UNION运算符

FROM子句包含多张表

SELECT语句中应用了不可更新的形势图

```sql
SELECT city FROM person GROUP BY city;
SELECT city, avg(score) as avgScore FROM person GROUP BY city;
CREATE VIEW person_view As SELECT city, avg(score) as avgScore FROM person GROUP BY city;

select * from person_view;
// 更新平均分将会失败
UPDATE person_View set avgScore=11 WHERE city='北京';
```

## Mysql预处理

1.预处理：

所谓的预处理技术，最初也是由MySQL提出的一种减轻服务器压力的一种技术！

#### 传统mysql 处理流程

1.在客户端准备sql语句

```jsx
select * from stu where id=1；
```

2.发送sql语句到MySQL服务器

3.MySQL服务器对sql语句进行解析(词法，语法)，然后编译，然后执行该sql语句 

4.服务器将执行结果返回给客户端

**弊端：**

哪怕多次传递的语句大部分内容都是相同的，每次还是要重复传递

哪怕语句是相同的，每次执行之前还是要先解析、编译之后才能执行

#### 预处理的处理流程

1.在客户端准备预处理sql语句

```jsx
prepare 预处理名称 from 'sql语句'

prepare test from 'select * from stu where id=?;';
```

2.发送预处理sql语句到MySQL服务器

3.MySQL服务器对预处理sql语句进行解析(词法，语法)，但不会执行

4.在客户端准备相关数据 

```jsx
set @id=1;
```

5.MySQL服务器对数据和预处理sql编译，然后执行该sql语句 

```sql
execute test using @id;
```

6.服务器将执行结果返回给客户端

优点：

只对sql语句进行了一次解析

重复内容大大减少(网络传输更快)

如何在MySQL中定义变量

全局变量：@变量名称

给变量赋值：set @变量名称=值：

## Mysql 存储过程

1。 什么是存储过程？

存储过程和其它编程语言的函数很像，可以用于封装一组特定功能的SQL语句集

用户通过**’call 存储过程的名称()’**来调用执行它。

2. 存储过程基本语法

2.1定义

```sql
create procedure 存储过程名称(形参列表)

begin

// sql语句

end；
// 

```

```sql
// 
CREATE PROCEDURE show_stu()
BEGIN

SELECT * FROM stu;
END
```

```sql
CREATE PROCEDURE show_stu_by_id(stuId int)
BEGIN

SELECT * FROM stu WHERE id=stuId;
END
```

2.2调用

```sql
call 存储过程名称(参数);
// 
call show_stu()
call show_stu_by_id(1)
```

3.查看存储过程

3.1查看MySQL中所有存储过程 

```sql
show procedure status;
```

3.2查看指定数据库中的存储过程

```sql
show procedure status where db=' db name'
```

3.3查看指定存储过程的源代码 

```sql
show create procedure show_stu;
```

4.删除存储过程

```sql
drop procedure show_stu;
```

## Mysql 变量存储

1.如何在MySQL中定义变量

**全局变量**

定义：@变量名称；

赋值：

```sql
set @全局变量名称=值；
select 字段名称 into @全局变量名称 from 表名：
```

**局部变量**

定义：declare 变量名称 数据类型：

赋值：set 局部变量名称=值；

```sql
set 局部变量名称=值；
select 字段名称 into 局部变量名称 from 表名；
```

2.全局变量

```sql
set @stuId=2;
set @stuName='';
select * from stu where id=@stuId;
select name into @stuName from stu where id=@stuId;
select @stuName from dual;
```

3.局部变量

局部变量只能在存储过程和函数中定义，所以也称之为存储过程变量

default 可以设置默认值

```sql
CREATE PROCEDURE show_stu()
BEGIN
	declare stuId2 int;
	declare stuName varchar(255);
	set stuId2 =2;
	select name into stuName from stu where id=@stuId;
	SELECT * FROM stu WHERE id=stuId;
	select stuName from dual;
END
call show_stu();
```

## Mysql 储存过程深入

1.存储过程参数：

MySQL存储过程中的参数分为：

in 输入参数[默认]

out 输出参数

inout 输入输出参数

示例一：输入参数

外界传递给我们的参数

```sql
CREATE PROCEDURE show_stu_by_id(in stuId int)
BEGIN

SELECT * FROM stu WHERE id=stuId;
END
```

示例二：输出参数

存储过程中返回给外界的参数

MySQL存储过程中不能使用return返回值，需要通过参数来向外返回值

```sql
CREATE PROCEDURE show_stu_by_id(in stuId int,out stuName varchar(255))
BEGIN
	SELECT name into stuName FROM stu WHERE id=stuId;
END

set @stuName='';
call show_stu_by_id(1,@stuName);
select @stuName from dual;
```

示例三：输入输出参数

同时具备了输入参数和输出参数所有功能

```sql
CREATE PROCEDURE show_stu_by_id(inout data int)
BEGIN
	SELECT age into data FROM stu WHERE id=data;
END

set @data=1;
call show_stu_by_id(@data);
select @data from dual;
```

## 自定义函数

1.什么是自定义函数

自定义函数和存储过程很像，只不过自定义函数不需要手动通过call调用

而是和其它的聚合函数一样会在SQL语句中自动被调用

例如：select avg (score) from stu

例如：select count (*) from stu where age >=18；

2.创建自定义函数

```sql
create function 函数名（形参列表） returns 数据类型 函数特征 
begin

sql语句：
... ...
return 值；

end：
```

函数特征

1.DETERMINISTIC 不确定的

2.NO SQL 没有SQl语句，当然也不会修改数据

3.READS SQL DATA 只是读取数据，不会修改数据

4.MODIFIES SQL DATA 要修改数据 5 CONTAINS SOL 包含了SQL语句

3.调用函数

```sql
select 函数名称(参数) from dual;
```

```sql
create function fun_add(a int,b int) returns int DETERMINISTIC
begin

declare sum int default 0;
set sum =a+b;
return sum;

end;
```

```sql
create function check_stu(stuId int) returns varchar(255) DETERMINISTIC
begin
declare stuName varchar(255) default '';
select name into stuName from stu where id= stuId;
return stuName;
end
```

## 条件语句

1.IF语

```sql
if 条件表达式 then
...
elseif 条件表达式 then
...
else
...
end if;
```

示例一:

```sql
create function fun_test(age int) returns varchar(255) DETERMINISTIC
begin

declare result varchar(255) default '';
if age>=18 then
set result='成年人';

else
set result='未成年人';
end if;
return result;

end;

// 使用
SELECT fun_test(2) from DUAL;
```

示例二:

```sql
create function fn_test2(score int) returns varchar(255) DETERMINISTIC 

begin
declare result varchar(255) default '';
if score<0|| score > 100 then
set result='没有这个分数';
elseif score < 60 then
set result='不及格';
elseif score <80 then
set result= '良好';
else 
set result ='优秀';
end if;
return result;
end;

// 使用
SELECT fun_test2(2) from DUAL;
```

2.CASE语句

```sql
case

when 条件表达式 then
...
when 条件表达式 then
...
end case:
```

```sql
create function check_stu(score int) returns varchar(255) DETERMINISTIC
begin
declare result varchar(255) default '';
case

when score=100 then
result='keeping';
when  score=0 then
result='not keeping';
end case:
return result;
end
```

3.循环语句

```sql
while 条件表达式 do
...
end while;
```

示例:1+ n的和/ 1+ 2+3+4+5

```sql
create function fun_test6(num int) returns int DETERMINISTIC 
begin
declare sum int default 0;
declare currentIndex int default 1;
while currentIndex <= num do
set sum=sum+currentIndex;
set currentIndex=1+currentIndex;

end while;

return sum;
 end;

// 使用
select fun_test6(4) from DUAL;
```

repeat 循环

```sql
repeat
...
until 条件表达式 end repeat;
```

示例:

```sql
create function fun_test6(num int) returns int DETERMINISTIC 
begin
declare sum int default 0;
declare currentIndex int default 1;
repeat
	set sum=sum+currentIndex;
set currentIndex=1+currentIndex;
until currentIndex > num end repeat;

return sum;
 end;

// 使用
select fun_test6(4) from DUAL;
```

## 批量数据处理

需求：往数据库里存储一万条数据实现方案：

1.写一万条insert into语句

2.将insert into语句封装到存储过程或者函数中

将来怎么使用？

是配合其它SQL语句使用，还是单独使用

单独使用--存储过程

配合其它SQL语句使用一-自定义函数

```sql
create procedure add_status(num int)
begin
  DECLARE currentId int DEFAULT 0;
  DECLARE currentAge int DEFAULT 0;
	DECLARE currentName VARCHAR(255) DEFAULT '';
while currentId<num do
	set currentId=currentId+1; 
	set currentAge= FLOOR(RAND()*30);
	set currentName= concat('it',currentAge);
	INSERT INTO stu VALUES(currentId,currentName,currentAge);
end WHILE;
end;
// 调用 call
CALL add_status(10000);
```

注意点：

以上封装存在的问题，默认情况下每生成一条插入语句，就会立即执行这条插入的语句

所以整个过程我们生成了一万条插入语句，我们解析了一万条插入的语句，编译了一万条语句，执行了一万条语句，所以比较耗时

**优化方式1**

```sql
create procedure add_status3(num int)
begin
  DECLARE currentId int DEFAULT 0;
  DECLARE currentAge int DEFAULT 0;
	DECLARE currentName VARCHAR(255) DEFAULT '';
set autocommit=0;
while currentId<num do
	set currentId=currentId+1; 
	set currentAge= FLOOR(RAND()*30);
	set currentName= concat('it',currentAge);
	INSERT INTO stu VALUES(currentId,currentName,currentAge);
end WHILE;
commit;
end;
// 调用 call
CALL add_status3(10000);
```

set autocommit=0; commit;

等到循环结束以后再去执行sql语句

注意点：

只要在循环前面加上set autocommit = 0；，在循环后面加上commit；

那么就不会生成一条插入语句就执行一条插入语句了

会等到所有的插入语句都生成之后，再统一的解析，统一的编译，统一的执行

优化方式2

**预处理不能使用局部变量**

```sql
create procedure add_status4(num int)
begin
  set @currentId =0;
  set @currentAge= 0;
	set @currentName='';
	prepare test from 'INSERT INTO stu VALUES(?,?,?);';
while @currentId<num do
	set @currentId=@currentId+1; 
	set @currentAge= FLOOR(RAND()*30);
	set @currentName= concat('it',@currentAge);
	execute test using @currentId,@currentName,@currentAge;
end WHILE;
end;
// 调用 call
CALL add_status4(10000);
```

**两者结合**

```sql
create procedure add_status4(num int)
begin
  set @currentId =0;
  set @currentAge= 0;
	set @currentName='';
	prepare test from 'INSERT INTO stu VALUES(?,?,?);';
	set autocommit=0;
while @currentId<num do
	set @currentId=@currentId+1; 
	set @currentAge= FLOOR(RAND()*30);
	set @currentName= concat('it',@currentAge);
	execute test using @currentId,@currentName,@currentAge;
end WHILE;
commit;
end;
// 调用 call
CALL add_status4(10000);
```

## Mysql 索引介绍

1.什么是索引

索引就相当于字典中的目录（拼音/偏旁部首手）

有了目录我们就能通过目录快速的找到想要的结果，

但是如果没有目录（拼音/偏旁部首手），没有索引

那么如果想要查找某条数据就必须从前往后一条一条的查找

所以索引就是用于帮助我们提升数据的查询速度的

2.索引的优缺点和使用原则

2.1优点

- 大大加快数据的查询速度
- 没有任何限制，所有Mysql字段都可以用作索引

2.2缺点

- 索引是真实存在的会占空间，会增加数据库体积
- 如果对作为索引的字段进行增删修操作，系统需要花费时间去更新维护索引

2.3原则

- 对经常用于查询的字段应该创建索引(作为where条件字段、作为group by分组的字段，作为order by排序的字段)
- 对于**主键和外键**系统会自动创建索引，无序我们手动创建
- 对于数据量小的表不需要刻意使用索引

3.索引分类

- 单值索引：将某个字段的值作为索引
- 复合索引：将多个字段的值作为索引
- 唯一索引（唯一键）：索引列中的值必须是唯一的，但是允许为空值
- 主键索引：是一种特殊的唯一索引，不允许有空值

## 索引的创建和修改

1.查看当前查询是否使用索引

1.1查询没有索引的表

```sql
select * from stu where id=999999;## 0.695
```

1.2查询有索引的表

```sql
select * from stu2 where id=999999;## 0.008
```

1.3如何查看当前的查询语句有没有用到素引

```sql
explain select * from stu2 where id=999999;## 查看key字段
```

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql26.png)

如果返回的结果集中的key有值，那么就表示当前的查询语句中用到了索引

如果返回的结果集中的key没有值，那么就表示当前的查询语句中没有用到索引

2.如何添加索引

2.1给表设置主键，只要设置了主键，那么系统就会自动创建对应的索引

2.2给表设置外键，只要设置了外键，那么系统就会自动创建对应的索引

2.3给表设置唯一键，只要设置了某一个字段的取值是唯一的，也会自动创建对应的索引

2.4创建表的时候指定给哪个字段添加索引

```sql
create table test1(
	id int,
	name varchar (20),
	index idx_name (id) #创建索引
)
```

2.5创建好表之后再给指定字段添加索引 

```sql
create table test2(
	id int，
	name varchar(20)，
)
// 下面的方式任选一种
create index idx_name on test2(id)；#创建索引
alter table test3 add index idx_name(id) ## 创建索引
```

3.删除索引

```sql
drop index 索引名称 on 表名
```

## 索引算法

1.什么是索引算法？

索引算法决定了如何创建索引

索引算法决定了如何查找索引对应的数据

**传统查找**

1， 2， 3， 4， 5

**btree查找**

平衡的多叉树

BTree索引是基于平衡多叉排序树实现的,能够缩短查找的次数

![Untitled](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/mysql27.png)

**Hahs索引**

哈希索引是基于哈希表实现的,只能用于memory存储引擎,可以一次性定位到指定数据

## Node与Mysql

1.如何在Node程序中操作MySOL数据库？

我们都知道操作MySQL数据库就是连接MySQL服务器，给MySQL服务器发送指令在NodeJS中我们可以借助第三方库来连接MySQL服务器，给MySQL服务器发送指令

1.1 mysql驱动库

```sql
npm install mysql
```

1.2 mysal2驱动库

```sql
npm install mysql2
```

2。由于node第三方库还不支持最新的mysql加密，所以我们需要修改为旧版本加密方式

2.1、更改加密方式：

```sql
 ALTER USER ‘ root‘ @‘ localhost‘ IDENTIFIED BY ‘ password‘ PASSWORD EXPIRE NEVER;
```

2.2、更改密码：该例子中123为新密码

```sql
ALTER USER ‘ root‘ @‘ localhost‘ IDENT IFIED WITH mysgl native password BY root
```

## Sequelize

1.什么是Sequelize？

Sequelize是一个基于Promise的NodeJS ORM模块

2.什么是ORM？

ORM (Object-Relational-Mapping) 是对象关系映射

对象关系映射可以把JS中的类和对象，和数据库中的表和数据进行关系映射映射

之后我们就可以直接通过类和对象来操作数据表和数据了，就不用编写SQL

ORM有效的解决了直接在NodeJS中编写SQL不够直观，不够高效，容易出错等问题

3.如何映射？

在Sequelize中Js中的一个类(一个模型） 就对应数据库中的一张表

在Sequelize中JS中的一个对象就对应表中的一条数据（一条记录） 

在Sequelize中Js中的一个对象的属性就对应一条数据的一个字段

## Sequelize基本使用

1.Sequelize基本使用

[https://sequelize.org/](https://sequelize.org/)

2.什么是数据库连接池？

默认情况下有一个人要使用数据库，那么就必须创建一个连接

默认情况下有一个人不用数据库了，为了不占用资源，那么就必须销毁一个连接

但是频繁的创建和销毁连接是非常消耗服务器性能的，所以为了提升服务器性能就有了连接池

数据库连接池是负责分配、管理和释放数据库连接

它允许应用程序重复使用一个现有的数据库连接，而不是再重新建立一个
![](https://cdn.jsdelivr.net/gh/kitety/blog_img@master/image/20220905163945.png)

## Sequelize创建表

```sql
const User = sequelize.define('User', {
  username: DataTypes.STRING,
  birthday: DataTypes.DATE,
});
```

1.sequelize在根据模型创建表的时候，会自动将我们指定的表的名称变成复数

2.sequelize在根据模型创建表的时候，会自动增加两个字段 createAt/updateAt

## Sequelize-CLI创建数据库

1.什么是Sequelize-CLI？

在编程开发中为了能够更好的管理代码，我们可以使用Git来管理我们的代码，

实现对代码变更的追踪，实现在各个不同版本之间切换

在数据库开发中为了能够更好的管理数据库，我们也可以使用数据库迁移工具来管理我们的数据库， 实现对数据库变更的追踪，实现在各个不同版本之间切换

Sequelize-CLI就是一款数据库迁移工具，能够让我们追踪数据库的变更，在各个不同版本之间随意切换

2.如何使用Sequelize-CLI？

```sql
npm i sequelize sequelize-cli mysgl2 -s

npx sequelize --help
```

3.初始化Sequelize-CLI

```sql
npx sequelize-cli init
```

config：数据库配置文件，用于告诉CLI如何连接数据库

models：数据库模型文件，用于告诉CLI如何创建表

migrations：数据库迁移文件，用于记录用户不同版本操作

seeders：数据库种子文件，用于编写测试数据

修改环境变量 

```sql
set NODE_ENV=test
```

4.创建

```sql
npx sequelize db:create
```

## Sequelize-CLI创建表

1.创建模型

```sql
npx sequelize model: generate -name XXX --attributes key: type
```

2.根据模型创建表

```sql
npx sequelize db:migrate
```

3.回退到某个时刻

```sql
npx sequelize db:migrate:undo // 回退到上一个版本

npx sequelize db:migrate:undo:a11// 回退所有

npx sequelize db:migrate:undo -name-20200329045955-create-book. js // 回退指定操作
```

## Sequelize-CLI修改表

1.如何修改表？

使用Sequelize-CL1管理数据库的目的就是为了监控数据库的变化所以我们不能直接修改表的结构，如果要修改，必须通过migration文件修改这样我们就能记录修改操作，就能追踪修改过程，就能回退到指定版本

2.修改表步骤

2.1 通过 migration：generate 创建迁移文件

2.2 在迁移文件中编写修改的内容

2.3 通过 db：migrate 执行编写好的迁移文件
