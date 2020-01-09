
{# custom mermaid body #}

{%- if config.mermaid.enable %}
  {%- set mermaid_uri = config.mermaid.cdn or '//cdnjs.cloudflare.com/ajax/libs/mermaid/8.4.4/mermaid.min.js' %}

  <script{{ pjax }}>

    jQuery.getExternalScript =  function(url, callback, condition) {
      if (condition) {
        callback();
      } else {
        var script = document.createElement('script');
        script.onload = script.onreadystatechange = function(_, isAbort) {
          if (isAbort || !script.readyState || /loaded|complete/.test(script.readyState)) {
            script.onload = script.onreadystatechange = null;
            script = undefined;
            if (!isAbort && callback) setTimeout(callback, 0);
          }
        };
        script.src = url;
        document.head.appendChild(script);
      }
    };

    jQuery.cachedScript = function( url, options ) {
      // Allow user to set any option except for dataType, cache, and url
      options = $.extend( options || {}, {
        dataType: "script",
        cache: true,
        url: url
      });
    
      // Use $.ajax() since it is more flexible than $.getScript
      // Return the jqXHR object so we can chain callbacks
      return jQuery.ajax( options );
      
    };

  if (document.querySelectorAll('pre.mermaid').length) {

    $.cachedScript('{{ mermaid_uri }}')
    .done(() => {
      console.log("start to load the mermaid script");
      mermaid.initialize({
            theme: '{{config.mermaid.theme}}',
            logLevel: 3,
            flowchart: { curve: 'basis' },
            gantt: { axisFormat: '%m/%d/%Y' },
            sequence: { actorMargin: 50 }
      });
    });
  }

  {#
    if (document.querySelectorAll('pre.mermaid').length) {

      $.getExternalScript('{{ mermaid_uri }}', () => {
        console.log("start to load the mermaid script");
        mermaid.initialize({
              theme: 'forest',
              logLevel: 3,
              flowchart: { curve: 'basis' },
              gantt: { axisFormat: '%m/%d/%Y' },
              sequence: { actorMargin: 50 }
        });
      }, window.mermaid);
    }
  #}
  </script> 

{%- endif %}


{# custom mermaid end #}
