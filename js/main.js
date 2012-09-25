(function() {
  var config, monitorTextChange, pageMap, shareText, _ref, _ref1, _ref2,
    _this = this;

  pageMap = {
    'en': {
      id: '7UDFVQ71',
      shareUrl: 'launch.yoyaki.com'
    },
    'ru': {
      id: '4F5IJTYE',
      shareUrl: 'launch.yoyaki.ru',
      showVkontakte: true,
      showOdnoklassniki: true,
      sharing: {
        description: 'Новый и удобный сервис по поиску и записи на услуги. \
      Подпишись, чтобы быть первым кто узнает о запуске!'
      }
    }
  };

  config = (_ref = pageMap[(_ref1 = document.location.hostname) != null ? (_ref2 = _ref1.match(/(..)$/i)) != null ? _ref2[1] : void 0 : void 0]) != null ? _ref : pageMap['en'];

  $('.lrdiscoverwidget').attr({
    rel: config.id
  }, data - share - {
    url: config.shareUrl
  });

  shareText = null;

  monitorTextChange = function() {
    var params, url, _ref3, _ref4;
    if (!shareText) {
      shareText = $("#shareurl-" + config.id);
    }
    url = shareText.val();
    if (!url.match(/yoyaki/)) {
      return setTimeout(monitorTextChange, 1000);
    } else {
      if (config.showOdnoklassniki) {
        params = $.param({
          url: url,
          description: (_ref3 = config.sharing) != null ? _ref3.description : void 0
        });
        $("#sharebuttons-" + config.id).append($("<a target=\"_blank\" class=\"mrc__plugin_uber_like_button\" href=\"http://connect.mail.ru/share?" + params + "\" data-mrc-config=\"{'nc' : '1', 'cm' : '1', 'ck' : '1', 'sz' : '20', 'st' : '2', 'tp' : 'ok', 'width': 64}\">Нравится</a>\n<script src=\"http://cdn.connect.mail.ru/js/loader.js\" type=\"text/javascript\" charset=\"UTF-8\"></script>"));
      }
      if (config.showVkontakte) {
        return $("#sharebuttons-" + config.id).append($("<script type=\"text/javascript\">\n</script>\n<span id=\"vk_like\" style=\"display:inline-block\"></span>\n<script type=\"text/javascript\">\n  VK.init({apiId: 3144190, onlyWidgets: true});\n  VK.Widgets.Like(\"vk_like\", {\n    type: \"mini\", \n    height: 20,\n    width: 76, \n    pageUrl: '" + url + "',\n    pageDescription: '" + ((_ref4 = config.sharing) != null ? _ref4.description : void 0) + "'});\n  //var vkFix = function() {\n  //  $('#vk_like').css('width','76px');\n  //  setTimeout(vkFix, 1000);\n  //}\n  //setTimeout(vkFix, 1000);\n</script>"));
      }
    }
  };

  setTimeout(monitorTextChange, 4000);

}).call(this);
