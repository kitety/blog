{%
  set boot_scripts = [
    'https://cdn.jsdelivr.net/gh/kitety/blog@master/themes/next/source/js/src/bootstrap.js'
  ]
%}

{% for bs in boot_scripts %}
  <script type="text/javascript" src="{{ bs }}?v={{ theme.version }}"></script>
{% endfor %}
