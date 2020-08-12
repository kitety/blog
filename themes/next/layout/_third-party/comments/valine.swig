{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
  <script src="//unpkg.com/valine/dist/Valine.min.js"></script>
  
  <script type="text/javascript">var GUEST=['nick','mail','link'];var guest='nick,mail';guest=guest.split(',').filter(item=>{return GUEST.indexOf(item)>-1});new Valine({el:'#comments',verify:false,notify:true,appId:'iGbar85pNcmueGsCObi1yCez-gzGzoHsz',appKey:'cte7CH71cmtRBvOduGBUitD6',placeholder:'请输入评论',avatar:'retro',guest_info:guest,pageSize:'10'||10,});</script>
{% endif %}
