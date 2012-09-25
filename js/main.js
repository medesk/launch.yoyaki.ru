(function() {
  var config, pageMap, _ref, _ref1, _ref2,
    _this = this;

  pageMap = {
    'en': {
      id: '7UDFVQ71'
    },
    'ru': {
      id: '4F5IJTYE',
      showVk: true
    }
  };

  config = (_ref = pageMap[(_ref1 = document.location.search) != null ? (_ref2 = _ref1.match(/(..)$/i)) != null ? _ref2[1] : void 0 : void 0]) != null ? _ref : pageMap['en'];

  $('.lrdiscoverwidget').attr('rel', config.id);

  setTimeout(function() {
    if (config.showVk) {
      return $("#sharebuttons-" + config.id).append($("<span id=\"vk_like\" class=\"facebook\"></span>\n<script type=\"text/javascript\">\n  VK.Widgets.Like(\"vk_like\", {type: \"mini\", height: 20});\n</script>"));
    }
  }, 4000);

}).call(this);
