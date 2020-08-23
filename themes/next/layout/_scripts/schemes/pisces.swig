{%
  set scripts = [
    'https://cdn.jsdelivr.net/gh/kitety/blog@master/themes/next/source/js/src/affix.js',
    'https://cdn.jsdelivr.net/gh/kitety/blog@master/themes/next/source/js/src/schemes/pisces.js'
  ]
%}

{% for script in scripts %}
  <script type="text/javascript" src="{{ script }}?v={{ theme.version }}"></script>
{% endfor %}
