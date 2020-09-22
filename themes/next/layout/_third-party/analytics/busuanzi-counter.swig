{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://cdn.jsdelivr.net/gh/xaoxuu/cdn-busuanzi@2.3/js/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv">
      {{ theme.busuanzi_count.site_uv_header }}
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
      {{ theme.busuanzi_count.site_uv_footer }}
    </span>
  {% endif %}

  {% if theme.busuanzi_count.site_pv %}
    <span class="site-pv">
      {{ theme.busuanzi_count.site_pv_header }}
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
      {{ theme.busuanzi_count.site_pv_footer }}
    </span>
  {% endif %}
</div>
{% endif %}

<div>
<span id="timeDate" class="notranslate">载入天数...</span><span id="times" class="notranslate">载入时分秒...</span>
<script>
var now=new Date();function createtime(){var grt=new Date("03/21/2020 09:24:30");now.setTime(now.getTime()+250);days=(now-grt)/1000/60/60/24;dnum=Math.floor(days);hours=(now-grt)/1000/60/60-(24*dnum);hnum=Math.floor(hours);if(String(hnum).length==1){hnum="0"+hnum}minutes=(now-grt)/1000/60-(24*60*dnum)-(60*hnum);mnum=Math.floor(minutes);if(String(mnum).length==1){mnum="0"+mnum}seconds=(now-grt)/1000-(24*60*60*dnum)-(60*60*hnum)-(60*mnum);snum=Math.round(seconds);if(String(snum).length==1){snum="0"+snum}document.getElementById("timeDate").innerHTML="本站已安全运行 "+dnum+" 天 ";document.getElementById("times").innerHTML=hnum+" 小时 "+mnum+" 分 "+snum+" 秒"}setInterval("createtime()",250);
</script>
</div>