---
title: CICD实战之Gitlab搭建
abbrlink: aa4ef8c5
date: 2020-07-26 12:05:29
tags:
- CICD
---
## 目的
学习 Gitlab 的搭建
## 正式开始
### 拉取 Gitlab 镜像
```
docker pull gitlab/gitlab-ce
```
我这网速的确感人啊
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd48c68ba-e3a8-4ac3-b0f0-d7b79c39f6c9%2Fia_10002.png?table=block&id=a044fe86-a1eb-490c-a9cd-33a804e13349&width=990&cache=v2)

<!-- more -->
### 创建Gitlab容器
```
mkdir /home/gitlab #创建Gitlab工作目录

docker run -itd -p 443:443 \
-p 8899:8899 \
-p 333:333 \
--name gitlab \
--restart always \
-v /home/gitlab/config:/etc/gitlab \
-v /home/gitlab/logs:/var/log/gitlab \
-v /home/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce
```

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F22138bb9-5931-4297-a4af-e8554d2d7967%2Fia_10004.png?table=block&id=540014ec-e336-4643-b96a-6ce63f5b45a4&width=1260&cache=v2)
关于：
- --restart: 当 Docker 重启时，容器自动启动，否则就需要使用docker restart 启动 
- gitlab端口映射规则：最好内外端口映射一致，gitlab 会根据你的配置文件调整服务端口。如外部访问8899，内外都配置8899 
- 一般Gitlab有三个端口要使用：ssh，https，主服务地址。
- ssh默认是22，这里我改为了333，

然后我们在防火墙添加 333 和 8899 端口的放行，并重载防火墙
```bash
firewall-cmd --zone=public --add-port=333/tcp --permanent
firewall-cmd --zone=public --add-port=8899/tcp --permanent
systemctl reload firewalld
```

我们可以看下现在的运行状况

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5cb97981-0589-47a0-ad99-0a9746af7ce5%2Fia_10005.png?table=block&id=2152f758-5d59-4ef3-94ce-478dd21815e5&width=3140&cache=v2)

### 修改Gitlab配置文件
#### 外部路径
```
vi /home/gitlab/config/gitlab.rb
```
在文件内增加三条配置：
- external_url: 外部服务访问地址
- gitlab_rails['gitlab_ssh_host']：SSH代码拉取地址
- gitlab_rails['gitlab_shell_ssh_port']：SSH代码拉取端口
```
external_url 'http://外部访问域名/地址:端口'
gitlab_rails['gitlab_ssh_host'] = 'SSH外部访问域名/地址'
gitlab_rails['gitlab_shell_ssh_port'] = SSH端口
```
我的虚拟机是192.168.182.3，因此我的填写如下

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Feb5d5b5a-44fc-4b0e-9ac9-fce6bd5f6105%2Fia_10006.png?table=block&id=1e5659ce-5400-46a0-924b-0c5ab9a5a0ea&width=1610&cache=v2)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F32b65277-40ec-4964-bf49-d5be36740467%2Fia_10007.png?table=block&id=69da928f-0d7b-46d8-8e9e-eb95f7ea1850&width=1100&cache=v2)
#### 修改SSH端口
前面设置的是333端口，因此要把默认的22端口改为333端口。
```
docker exec -it gitlab /bin/bash
vim /assets/sshd_config
vim /etc/ssh/sshd_config
```

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F131849ce-ae8c-4c6c-8476-c6a701b98ae8%2Fia_10008.png?table=block&id=ecb890cf-2bf2-4b66-96a2-59b08ba54e53&width=900&cache=v2)

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7002b9e3-e5a0-497f-908f-fe94c50d2793%2Fia_10009.png?table=block&id=ffdad499-f75d-45bb-98bd-e9a8a93fd81e&width=820&cache=v2)
#### 重启 Gitlab
```
docker restart gitlab
```
访问我们的地址端口。如果显示 502 ，则代表正在启动中。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F65e38bcb-57e3-4857-9e66-fc1a6197e1e5%2Fia_10010.png?table=block&id=f2c715a6-7c38-4beb-8b60-9d617710dd1e&width=1370&cache=v2)


初始化完成就好了

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F468ce37b-22f2-466d-8850-75d970a4ed99%2Fia_10011.png?table=block&id=70612479-4d36-4382-851e-1e94faca6983&width=2010&cache=v2)

接下来就是改密码和登录了，登陆之后就进入页面，gitlab也终于露出了庐山真面目。注意：管理员的账号是**root**。

最后，我们就进入gitlab了。
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe3dcb2c8-b303-450e-a896-405607e3f59d%2Fia_10012.png?table=block&id=a4e152d6-b390-427d-a764-6810dec12b68&width=3790&cache=v2)

## 结语
至此，我们已经完整搭建了Gitlab环境，作为CICD不可少的一部分，也算是有了一个良好的开端。撒花！

