{%
  set js_commons = [
    'https://cdn.jsdelivr.net/gh/kitety/blog@master/themes/next/source/js/src/utils.js',
    'https://cdn.jsdelivr.net/gh/kitety/blog@master/themes/next/source/js/src/motion.js'
  ]
%}

{% for common in js_commons %}
  <script type="text/javascript" src="{{ common }}?v={{ theme.version }}"></script>
{% endfor %}
