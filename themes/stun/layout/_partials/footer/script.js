window.onload = function () {
    if(!$) return;
    function load() {
        $.get("https://v1.hitokoto.cn", function (data, status) {
            if (status == 'success') {
                $('#poem').html(data.hitokoto)

            }
        });
    }


    $(document).on('pjax:complete', function () {
       load()
    })
    load()
}
