window.onload = function () {
    if (!$) return;
    function load() {
        $.get("https://v1.hitokoto.cn", function (data, status) {
            if (status == 'success') {
                $('#poem').html(data.hitokoto)

            }
        });

    }
  


    $(document).on('pjax:complete', function () {
        load()
        //  reward
        Stun.utils.registerShowReward()
        // 添加判断条件
        socialShare('.social-share, .share-component')
    })
    load()
}
