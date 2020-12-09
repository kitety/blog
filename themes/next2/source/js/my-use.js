function fancyBoxFix() {
  setTimeout(() => {
    $(document)
      .find("img[data-original]")
      .each(function () {
        $(this).parent().attr("href", $(this).attr("data-original"));
      });
  });
}
window.getHerf = function () {
  var href = window.location.href;
  var github =
    "https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-10-8/1602133738315-image.png";
  var gitee =
    "https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-10-8/1602133761284-image.png";
  var isGitee = href.indexOf("gitee.io") > -1;
  var imgUrl = github;
  if (isGitee) {
    href = href.replace("gitee.io", "github.io");
  } else {
    imgUrl = gitee;
    href = href.replace("github.io", "gitee.io");
  }
  return { href, imgUrl };
};
$(function () {
  const data = window.getHerf();
  let href = data.href;
  let imgUrl = data.imgUrl;
  var $h1 = $(
    '<a class="mirrorbtn" href="' + href + '"><img src="' + imgUrl + '"/></a>'
  );
  $("body").append($h1);
  fancyBoxFix();

  // pjax
  // Pjax 完成后，重新加载上面的函数
  document.addEventListener("pjax:complete", function () {
    // 链接完善
    $("a.mirrorbtn").attr("href", window.getHerf().href);
    // 重载整个 JS 文件
    $("script.pjax-reload").each(function () {
      $(this).parent().append($(this).remove());
    });
    fancyBoxFix();
    if (typeof ga !== "undefined") {
      ga("set", "location", window.location.href);
      ga("send", "pageview");
    }
    // 一些话页面的刷新
    if (
      location.href.indexOf("shuoshuo") > -1 &&
      location.href.indexOf("#reloaded") == -1
    ) {
      location.href = location.href + "#reloaded";
      location.reload();
    }
  });
});
