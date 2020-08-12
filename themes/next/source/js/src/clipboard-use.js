/*页面载入完成后，创建复制按钮*/
!(function (e, t, a) {
  /* code */
  var initCopyCode = function () {
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

    var clipboard = new Clipboard('.fa-clipboard');
    try {
      clipboard.on('success', $(function () {
        $(".fa-clipboard").click(function () {
          toastr.success("复制成功!");
        });
      }));
    } catch (error) {

    }
  };
  initCopyCode();
})(window, document);
