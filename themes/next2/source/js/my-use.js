$(function () {
  // 镜像
  var href = window.location.href;
  var github =
    "https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-8/1602133738315-image.png";
  var gitee =
    "https://cdn.jsdelivr.net/gh/kitety/blog_img/2020-10-8/1602133761284-image.png";
  var isGitee = href.indexOf("gitee.io") > -1;
  const a = $("#mirror-blog").find("a");
  var imgUrl = github;
  if (isGitee) {
    href = href.replace("gitee.io", "github.io");
  } else {
    imgUrl = gitee;
    href = href.replace("github.io", "gitee.io");
  }

  a.attr("href", href);
  var $h1 = $(
    '<a class="mirrorbtn" href="' + href + '"><img src="' + imgUrl + '"/></a>'
  );
  $("body").append($h1);


  // pjax
  // Pjax 完成后，重新加载上面的函数
  document.addEventListener("pjax:complete", function () {
    console.log(1)
    // 重载整个 JS 文件
    $("script.pjax-reload").each(function () {
      $(this).parent().append($(this).remove());
    });
  });
});
