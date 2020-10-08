/*页面载入完成后，创建复制按钮*/
!(function (e, t, a) {
  /* code */
  var initCopyCode = function () {
    mirrorBlog();
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

    var clipboard = new Clipboard(".fa-clipboard");
    try {
      clipboard.on(
        "success",
        $(function () {
          $(".fa-clipboard").click(function () {
            toastr.success("复制成功!");
          });
        })
      );
    } catch (error) { }
  };
  initCopyCode();
  // 镜像是否显示
  function mirrorBlog () {
    // 创建元素

    var $h1 = $('<h1>1111</h1>');
    $('body').append($h1);
    var isGitee = window.location.href.indexOf("gitee.io") > -1;
    const a = $("#mirror-blog").find('a')
    let href = window.location.href
    if (isGitee) {
      href = href.replace('gitee.io', 'github.io')
    }
    a.attr('href', href)
  }

})(window, document);
