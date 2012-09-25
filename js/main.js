(function() {
  var config, pageMap, _ref, _ref1, _ref2,
    _this = this;

  pageMap = {
    'en': {
      id: '7UDFVQ71'
    },
    'ru': {
      id: '4F5IJTYE',
      showVk: true,
      showOk: true
    }
  };

  config = (_ref = pageMap[(_ref1 = document.location.search) != null ? (_ref2 = _ref1.match(/(..)$/i)) != null ? _ref2[1] : void 0 : void 0]) != null ? _ref : pageMap['en'];

  $('.lrdiscoverwidget').attr('rel', config.id);

  setTimeout(function() {
    if (config.showVk) {
      $("#sharebuttons-" + config.id).append($("<script type=\"text/javascript\">\n</script>\n<span id=\"vk_like\" style=\"display:inline-block\"></span>\n<script type=\"text/javascript\">\n  VK.init({apiId: 3143951, onlyWidgets: true});\n  VK.Widgets.Like(\"vk_like\", {type: \"mini\", height: 20, width: 76});\n  var vkFix = function() {\n    $('#vk_like').css('width','76px');\n    setTimeout(vkFix, 1000);\n  }\n  setTimeout(vkFix, 1000);\n</script>"));
    }
    if (config.showOk) {
      return $("#sharebuttons-" + config.id).append($("<a target=\"_blank\" class=\"mrc__plugin_uber_like_button\" href=\"http://connect.mail.ru/share\" data-mrc-config=\"{'nc' : '1', 'cm' : '1', 'ck' : '1', 'sz' : '20', 'st' : '2', 'tp' : 'ok', 'width': 76}\">Нравится</a>\n<script src=\"http://cdn.connect.mail.ru/js/loader.js\" type=\"text/javascript\" charset=\"UTF-8\"></script>"));
    }
  }, 4000);

}).call(this);
