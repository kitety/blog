---
title: CICD实战之Jenkins构建前端镜像并上传到制品库
tags:
  - CICD
abbrlink: dc1bbeba
date: 2020-08-09 18:41:29
---
## 目的
之前的前端构建部署，是通过scp传输dist的全部文件到指定目录实现部署，这次我们将学习利用Jenkins构建docker前端镜像并上传到制品库实现部署。

<!-- more -->

## 正式开始
### Jenkins登录
想使用 Jenkins 推送镜像到制品库，必须先登录制品库。进入 Jenkins 容器，使用 docker login 登录，然后退出即可
```bash
docker exec -it jenkins /bin/bash
docker login 192.168.182.4:8082
exit;
```
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F83a17ab7-07da-49d4-8db1-0600b409489c%2FUntitled.png?table=block&id=79151228-403c-4fb0-a7ea-b7f8acfb7bc8&width=2180&cache=v2)

登录一次之后后续就无需登录。

**注意：登录不上可以多尝试几次**
### Nginx登录制品库
Jenkins构建并且push，Nginx就会触发拉取，因此这边也需要登录。
```bash
vi /etc/docker/daemon.json
sudo systemctl daemon-reload
sudo systemctl restart docker
# 登录
docker login 192.168.182.4:8082
```

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4063b340-ed25-459e-8bf2-f9e1016c2202%2FUntitled.png?table=block&id=8a51b6c8-fe13-49b8-b43e-21ba19e3fc7c&width=2320&cache=v2)
登录一次之后后续就无需登录。

### DockerFile 
前端通过Jenkins构建docker镜像，因此需要添加DockerFile文件。

DockerFile 是一个镜像制作过程的步骤描述，新增文件添加一下代码
```bash
FROM nginx:1.15-alpine
COPY dist /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
```
- 拉取一个 nginx 1.15-alpine 版本的镜像。
- 将当前目录下的 dist 文件夹拷贝到镜像的 /usr/share/nginx/html 文件夹。
- 声明启动容器时，在 /usr/share/nginx/html 下面执行。

### jenkins配置修改
修改配置
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd91c5a34-2c73-452e-9405-0784459f1a97%2FUntitled.png?table=block&id=f919b321-75e2-4f03-86ef-282c7b0322be&width=2980&cache=v2)
添加以下代码
```bash
set -e
timestamp=`date '+%Y%m%d%H%M%S'`

node -v
npm -v

npm install -g cnpm --registry=https://registry.npm.taobao.org

cnpm install

npm run build

# 编译docker镜像
docker build -t 192.168.182.4:8082/fe/nginx-fe-$timestamp .

# 推送docker镜像到制品库
docker push 192.168.182.4:8082/fe/nginx-fe-$timestamp

# 远程执行命令部署镜像
ssh -o StrictHostKeyChecking=no root@192.168.182.4 "docker pull 192.168.182.4:8082/fe/nginx-fe-$timestamp && \
docker stop nginx-test && \
docker rm nginx-test && \
docker run -p 80:80 -itd \
--name nginx-test \
--restart always \
192.168.182.4:8082/fe/nginx-fe-$timestamp"
```
流程分析
- Jenkins在命令中用 $-变量名 进行使用。 timestamp=date '+%Y%m%d%H%M%S'，唯一的docker命名
- 依据DockerFile打包镜像并且推送
- Nginx拉取刚推送的docker镜像，停止正在运行的container，删除之后并且运行当前的镜像。

**上述代码中相关注意事项**

- 制品库的地址：172.16.81.150:8082
- nginx的地址：192.168.182.4
- nginx的name：nginx-test![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb6123ba0-bccf-4073-8c0f-09c1f3d28a5d%2FUntitled.png?table=block&id=51ff3f40-2167-4109-9abc-ba698c6c83c1&width=2900&cache=v2)
  
## 结语
和之前的构建部署方式中，利用docker镜像可以很好地代码回退和迭代更新，实现了版本在生产环境更好的控制。
