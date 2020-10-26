---
title: 一些话
type: somewords
comments: false
translate_title: some-words
date: 2020-05-05 08:53:30
---

<!-- 一言API -->
<!-- 现代写法，推荐 -->
<!-- 兼容低版本浏览器 (包括 IE)，可移除 -->
<script class="pjax-reload" src="https://cdn.jsdelivr.net/npm/bluebird@3/js/browser/bluebird.min.js"></script>
<script class="pjax-reload" src="https://cdn.jsdelivr.net/npm/whatwg-fetch@2.0.3/fetch.min.js"></script>
<!--End-->
<script class="pjax-reload">
  fetch('https://v1.hitokoto.cn')
    .then(function (res){
      return res.json();
    })
    .then(function (data) {
      var hitokoto = document.getElementById('hitokoto');
      hitokoto.innerText = data.hitokoto + '——【' + data.from + '】';
    })
    .catch(function (err) {
      console.error(err);
    })
</script>

0.一言

<p id="hitokoto">正在加载一言...</p>

1.[上过大学和没上大学的区别在哪？](https://www.zhihu.com/question/280100422/answer/566951310) （2020 年 5 月 5 日 09:38:43）

> 也许等大学后你和你没上的同学一起聊天
> 他会嘲笑你说：上大学有什么用？还不是和我一起坐在一起吃大排档。
> 那时候你只会微微一笑:对啊，因为我们是朋友
> **我不会因为我感觉到我们之间存在差距而嘲笑你。** 
> **而你会因为你感觉不到我们之间的差距而嘲笑我。**

2.我曾七次鄙视自己的灵魂 （2020 年 5 月 8 日 23:57:13）

> 第一次，当它本可进取时，却故作谦卑；
> 第二次，当它在空虚时，用爱欲来填充；
> 第三次，在困难和容易之间，它选择了容易；
> 第四次，它犯了错，却借由别人也会犯错来宽慰自己；
> 第五次，它自由软弱，却把它认为是生命的坚韧；
> 第六次，当它鄙夷一张丑恶的嘴脸时，却不知那正是自己面具中的一副；
> 第七次，它侧身于生活的污泥中，虽不甘心，却又畏首畏尾。

3.不要一味地允许和同意，拒绝也是提升价值的方式。(2020 年 5 月 16 日 00:36:10)

4.读书不是唯一的出路，学习才是。（2020 年 5 月 24 日 21:17:12）

5.缝纫机乐队台词(2020 年 5 月 24 日 21:25:27)

![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175117.png)

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=512377374&auto=0&height=66"></iframe>

6.越哥说电影[《独自等待》](https://www.youtube.com/watch?v=mi5-1p23hlI)

> 要么好好活着，要么赶紧去死

> 或许每个像陈文的男生，都有过类似的经历，
> 幻想着自己的梦中情人，脑补着她是多么完美。
>
> 其实不仅仅是爱情，那时我们的梦想，我们的青春，
> 都在我们的脑海中张牙舞爪，我们迫不及待的想要抓在手里。
> 年轻时我们爱幻想，总以为自己和别人不一样，
> 关于爱情，关于梦想，关于自己，关于世界。
>
> 我们总以为它们都在远方，我们也偏执的相信，
> 在我们看不见的地方，有我们想要的一切。
> 可当我们的眼睛总看着前方时，
> 那些脚下的繁花和身边的风景都会被我们忽略掉。
>
> 于是我们总是觉得自己正在独自等待，
> 好像我们怎么也抓不住跑的飞快的梦想和爱情。
> 或许时过经年，你才会想起那些年轻时陪在你身边的人，
> 曾经你们促膝长谈，曾经你们把酒言欢，曾经你们一起犯傻；
> 但现在的你们似乎很久都没有联系了。
>
> 那时候聊感情，聊梦想，聊生活，聊心事，
> 可如今面临的却是无法穿越的时间长河。
> 你才明白，有些人已经从你的身边悄悄溜走再也难以重来，
> 那时候我们左手爱情，右手梦想，
> 青春却被远远的丢在了某个不起眼的地方。

7.学会解决问题。（2020 年 6 月 24 日 10:48:01）

> 不要害怕遇到问题，正视问题。
> 分析问题，找到原因。
> ![](https://cdn.jsdelivr.net/gh/kitety/blog_img/img/20200923175138.png)

8.做不了时间的主人，只能做时间的奴隶。(2020 年 7 月 4 日 10:56:56)

> 学会规划时间，提前安排时间。

9.做好两件事。(2020年8月21日14:54:38)
> 无论你从事什么行业，只要做好两件事就够了：一个是你的**专业**、一个是你的**人品**。专业决定了你的存在，人品决定了你的人脉；剩下的就是坚持，用善良、专业和真诚赢取更多的信任。


10.有些事该经历的总归要经历，没人能替你经历这个过程。
![image.png](https://i.loli.net/2020/09/01/EnW7bFfzVRe3Kr2.png)

