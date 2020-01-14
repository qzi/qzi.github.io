"use strict";

hexo.extend.filter.register("theme_inject", function(injects) {
  injects.head.file("gitter", "views/gitter.swig", {}, { cache: true });
  injects.style.push("views/gitter.styl");
});
