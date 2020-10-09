<ul class="post-copyright">
  <!-- JS库 sweetalert 可修改路径 -->
  <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
     <span class="copy-path"><i class="fa fa-clipboard" data-clipboard-text="{{ page.title+__('symbol.colon') +page.permalink }}"  aria-label="复制成功！" id="faClipboard"></i></span>
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
