$(function () {
  // 粘贴板
  var copyHtml = "";
  copyHtml += '<button class="btn-copy" data-clipboard-snippet="">';
  copyHtml += '  <i class="fa fa-globe"></i><span>copy</span>';
  copyHtml += "</button>";
  $(".highlight .code pre").before(copyHtml);
  new ClipboardJS(".btn-copy", {
    target: function (trigger) {
      toastr.success("复制成功!");
      return trigger.nextElementSibling;
    },
  });

  var clipboard = new ClipboardJS(".fa-clipboard");
  clipboard.on("success", function () {
    toastr.success("复制成功!");
  });
  // 镜像
  var href = window.location.href;
  var github =
    "https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-10-8/1602133738315-image.png";
  var gitee =
    "https://cdn.jsdelivr.net/gh/kitety/blog_img@master/2020-10-8/1602133761284-image.png";
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
});
