---
title: CICD实战之Jenkins + Gitlab 实现前端构建
tags:
  - CICD
abbrlink: d26a2f6b
date: 2020-08-01 16:20:01
---

## 目的

Jenkins + Gitlab 实现前端构建

## 正式开始

### Jenkins 安装 NodeJS

因为在 Jenkins 构建的时候我们需要去执行一些 shell，需要用到 NodeJS，因此我们先安装 NodeJS。

在这里我们采用插件方式安装。

#### 在 Jenkins 插件管理中心搜索 NodeJS

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F41bf80e2-a541-4f6c-bb7e-5cf428d7f161%2Fia_100000906.png?table=block&id=3e793e58-d9cb-4194-b17e-d86af1b5c7a7&width=3730&cache=v2)

<!-- more -->

我这里已经安装了
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F58a8df69-1da1-4540-98f4-ea05b03845b6%2Fia_100000907.png?table=block&id=6aec3c26-2d2d-401b-bca9-d305ddd5161f&width=2190&cache=v2)没有安装的话应给在可选插件的 Tab,勾选之后选择直接安装即可。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F76ee67ce-4242-4a68-af63-780e5e117610%2Fia_100000908.png?table=block&id=8600f9b1-dc0a-46d0-b2be-17c85edfbc29&width=1610&cache=v2)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7896fd0c-c1d8-4aac-9785-b3b0cf821213%2Fia_100000909.png?table=block&id=03f34cda-1043-4b11-a8b0-13504a098e32&width=1190&cache=v2)

#### 全局配置

在系统设置--系统工具设置可以为全局配置 NodeJS。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9e0c63c1-2abe-4f0b-ba75-1677c65198cd%2Fia_100000910.png?table=block&id=6dcf576c-9bb0-4d75-983a-64d2078784ee&width=2800&cache=v2)
选择好对应的版本之后保存即可。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F67a338f4-64c1-4c95-93be-2c123c9f5cc3%2Fia_100000911.png?table=block&id=95543260-6148-4586-b631-e26ef82ae783&width=3730&cache=v2)

#### 使用

我们只需要在任务的“配置”中，找到“构建环境”，选中 “Provide Node & npm bin/ folder to PATH” ，选择刚才配置好的 NodeJS 即可。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe7f7e912-5ca1-4830-9195-e4c758ddb6ed%2Fia_100000912.png?table=block&id=8f19b130-83c7-45b4-bfda-b9b1544b4ddb&width=2400&cache=v2)

第一次执行会下载对应的 Node 版本，后续不会下载。

### 开始集成

因为集成构建的时候我们需要 Jenkins 去 Gitlab 拉去代码，因此我们需要用 ssh 的方式去鉴权。

#### 生成公钥私钥

Jenkins 拉取，因此要在 Jenkins 上生成，并且将公钥传输到 Gitlab，这样就可以实现鉴权的作用。

```bash
docker exec -it jenkins /bin/bash
ssh-keygen -t rsa
```

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F69a734b8-9a22-48af-b674-9b4a8b6cf39f%2Fia_100000913.png?table=block&id=a316bf67-8eaf-483a-bb60-fc1accffce12&width=1310&cache=v2)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fad17baba-201b-4a92-b8d9-32e666476b7d%2Fia_100000914.png?table=block&id=faa41e1e-027a-459c-997f-d48aa89006fb&width=700&cache=v2)

#### Gitlab 配公钥

将公钥存入即可
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2b8cc9c4-8250-485c-b596-9db711765b9c%2Fia_100000915.png?table=block&id=08d1e4fc-6cd8-4f08-b8ac-f2b28248cacc&width=3220&cache=v2)

#### Jenkins配私钥
在系统管理，管理凭证。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8fe0b5a9-3165-44e7-a59f-b79f155120bb%2Fia_100000916.png?table=block&id=d5cc39d2-6a28-46fb-9f59-6d77ea3a7b97&width=2390&cache=v2)
在全局添加凭证
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fe90455-9b05-42d7-80aa-370e4f0d39d9%2Fia_100000917.png?table=block&id=d4b08e58-f6d2-4c95-913c-3479e1a4b052&width=1280&cache=v2)
类型为 “SSH Username with private key.”，ID为此凭据在Jenkins的标识符，UserName 为你的Gitlab用户名，PrivateKey 为你的服务器私钥。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F09652292-4696-4fb8-8441-119f7a364841%2Fia_100000918.png?table=block&id=618838cb-268b-457c-9c8d-8862cced0584&width=3730&cache=v2)

**配置完之后最好还是重启一下jenkins和gitlab**

至此，Jenkins配置完毕。

### 小试牛刀，构建一下

#### 新建任务
选择：构建一个自由风格的软件项目，我这里用的ssh-way

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff17263e9-6515-4e00-9032-ec5576496184%2Fia_100000919.png?table=block&id=5b2bfffe-b832-4c84-85a8-7d3d7c5bae36&width=2020&cache=v2)

#### 配置任务
我这里是临时用的一个Vue-Cli搭建的项目演示。

进入任务配置，在任源码管理这里选择Git

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe3d0c393-4ad4-40a9-b69c-8fe20541b067%2Fia_100000920.png?table=block&id=fb153d8c-bcf0-4aa6-b8c1-7189aff86da0&width=3300&cache=v2)
注意      
  > 仓库地址为gitlat的ssh方式 ![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F340ed02a-d75d-4372-b31c-d66f250ae0fa%2Fia_100000921.png?table=block&id=1091d027-601e-459f-9e1a-e4fc290dca30&width=2000&cache=v2)
  
  >直接复制的地址有两个端口号，要改为ssh的333端口。[端口为333是在之前配置的这个端口号。](https://kitety.github.io/posts/aa4ef8c5.html#%E4%BF%AE%E6%94%B9SSH%E7%AB%AF%E5%8F%A3)
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fddf150fb-2c22-42ea-87d2-a7fcf03e4057%2Fia_100000922.png?table=block&id=12dddf53-403c-4fbf-a7f0-84d86b6f10ed&width=1970&cache=v2)

选择对应的NodeJS版本
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc00a9900-3049-4822-a4c9-ec239a51ba07%2Fia_100000923.png?table=block&id=50034b6a-bec7-4af1-a344-b4fe5c919b65&width=2890&cache=v2)

构建选择--执行Shell

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fdd8dedc7-7535-4eff-b1dc-1a5c17719a8a%2Fia_100000924.png?table=block&id=499d549c-416a-412f-8c3c-f3ef81a630fb&width=680&cache=v2)
填写基本的shell
```bash
node -v
npm -v
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm install
npm run build
```
保存再立即构建一波。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb49b7cb5-9eb8-42dc-9bb7-5d79f2396b0f%2Fia_100000925.png?table=block&id=34a26641-8dff-406f-9d09-8486dc0f59de&width=2210&cache=v2)

看到 Finished: SUCCESS，完美。
### 同步到Nginx环境
当我们构建成功之后，我们只需要把Jenkins的dist目录下面的资源全部拷贝到服务器Nginx上面就可以实现更新了。而且没有不会变更配置文件，也不用重启Nginx。
#### 创建文件夹
为了避免我们后续找不到文件夹，我们就先创建秘钥顺便创建文件夹。
```bash
// nginx机器
ssh-keygen -t rsa
```


#### 配置鉴权文件
因为我们已经在Jenkins生成过私钥公钥了，我们只需要将这边的文件复制到Nginx的`/root/.ssh/authorized_keys`就好了。
```bash
scp -p /root/.ssh/id_rsa.pub root@192.168.182.4:/root/.ssh/authorized_keys****
```
第一次需要输入密码，后续都不需要了。

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fdf684276-d175-4433-aeb1-f587946b077d%2Fia_100000926.png?table=block&id=6295f092-f815-4ecf-b6d6-088b0dc8eb59&width=1530&cache=v2)

#### 发布到Nginx
原理很简单，将build生成的dist的全部文件全部都拷贝到nginx的html的目录下。（Nginx资源路径具体要看配置）

在之前的shell命令中加入以下命令。
```bash
scp -o "StrictHostKeyChecking no" -r dist/* root@192.168.182.4:/home/nginx/html
```

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F78ff2b9b-477b-476e-9993-568c299b27cd%2Fia_100000927.png?table=block&id=15c36a83-8fb6-41b2-a2c2-480cfa2adc2b&width=2830&cache=v2)
#### 修改测试
修改了，提交了，我们构建一下。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F60a8be4f-bda0-4f9a-ac36-1c7e1476e51b%2Fia_100000928.png?table=block&id=73d5273e-dd98-4f2c-86ae-31e6c0dd9bb5&width=1100&cache=v2)
构建成功
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcff8c640-bae1-464a-83df-292dde47cf3f%2Fia_100000929.png?table=block&id=9888ce9c-d375-4920-928c-2f50a064a6b9&width=1950&cache=v2)
完美

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2f3dd12f-53c1-4dcf-a5d7-4f5aaf96cbae%2Fia_100000930.png?table=block&id=5664d3f5-f1d9-4c46-ad8b-d2231ad29010&width=1350&cache=v2)

## 结语
至此，我们已经完整搭建了Jenkins + Gitlab 实现前端构建，搭了这么久的环境终于开始实战了。撒花！
