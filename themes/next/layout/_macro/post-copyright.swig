<ul class="post-copyright">
  <script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>
  <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- JS库 sweetalert 可修改路径 -->
 <script src="https://cdn.bootcdn.net/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
 <link href="https://cdn.bootcdn.net/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }}</strong>
    {{ post.author | default(config.author) }}
  </li>
   <li class="post-copyright-author">
    <strong>本文标题{{ __('symbol.colon') }}</strong>
    {{  page.title}}
  </li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    <a href="{{ post.url | default(post.permalink) }}" title="{{ post.title }}">{{ post.url | default(post.permalink) }}</a>
     <span class="copy-path"><i class="fa fa-clipboard" data-clipboard-text="{{ page.title+__('symbol.colon') +page.permalink }}"  aria-label="复制成功！"></i></span>
  </li>
  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
    {{ __('post.copyright.license_content', theme.post_copyright.license_url, theme.post_copyright.license) }}
  </li>
</ul>
<style>
.copy-path {
  margin-left: 4px;
  width: 1em;
}
.copy-path:hover {
  color: #808080;
  cursor: pointer;
}</style>
