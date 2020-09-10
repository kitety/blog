<div class="site-brand-wrapper">
  <div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
    {% if theme.custom_logo.image and theme.scheme === 'Muse' %}
      <div class="site-meta-headline">
        <a>
          <img class="custom-logo-image" src="{{ theme.custom_logo.image }}"
               alt="{{ config.title }}"/>
        </a>
      </div>
    {% endif %}

    <div class="custom-logo-site-title">
      <a href="{{ config.root }}"  class="brand" rel="start">
        <span class="logo-line-before"><i></i></span>
        <span class="site-title">{{ config.title }}</span>
        <span class="logo-line-after"><i></i></span>
      </a>
    </div>
      {% if theme.seo %}
        <h1 class="site-subtitle" itemprop="description">{{ config.subtitle }}</h1>
      {% else %}
        <p class="site-subtitle">{{ config.subtitle }}</p>
      {% endif %}
  </div>

  <div class="site-nav-toggle">
    <button>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>

<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        <li class="menu-item menu-item-{{ itemName | replace(' ', '-') }}">
          <a href="{{ url_for(path.split('||')[0]) | trim }}" rel="section">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-fw fa-{{ path.split('||')[1] | trim | default('question-circle') }}"></i> <br />
            {% endif %}
            {{ __('menu.' + name) | replace('menu.', '') }}
          </a>
        </li>
      {% endfor %}
      
       <li class="menu-item menu-item-image-buckets">
          <a href="https://www.notion.so/https-kitety-github-io-6e101a98b27141e6b8907c5ae7095077"  target="_blank" rel="noopener noreferrer">
              <i class="menu-item-icon fa fa-fw fa-cube"></i> <br />图床
          </a>
        </li>
       <li class="menu-item menu-item-image-buckets" id="mirror-blog">
          <a href="https://kitety.gitee.io/"  target="_blank" rel="noopener noreferrer">
              <i class="menu-item-icon fa fa-bullseye "></i> <br /> 博客镜像
          </a>
        </li>

      {% if hasSearch %}
        <li class="menu-item menu-item-search">
          {% if theme.swiftype_key %}
            <a href="javascript:;" class="st-search-show-outputs">
          {% elseif theme.local_search.enable || theme.algolia_search.enable %}
            <a href="javascript:;" class="popup-trigger">
          {% endif %}
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
            {% endif %}
            {{ __('menu.search') }}
          </a>
        </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
  <div id="google_translate_element" class="google_translate_element" ></div>
  <script>
 function googleTranslateElementInit(){new google.translate.TranslateElement({pageLanguage:"zh-CN",autoDisplay:false,gaTrack:true,gaId:"UA-161566224-1"},"google_translate_element");};
  </script>
  <script async src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</nav>

{% include '../_custom/header.swig' %}
