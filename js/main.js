(function() {
  var config, pageMap, _ref, _ref1, _ref2;

  pageMap = {
    'en': {
      id: '7UDFVQ71'
    },
    'ru': {
      id: '4F5IJTYE'
    }
  };

  config = (_ref = pageMap[(_ref1 = document.location.search) != null ? (_ref2 = _ref1.match(/(..)$/i)) != null ? _ref2[1] : void 0 : void 0]) != null ? _ref : pageMap['en'];

  $('.lrdiscoverwidget').attr('rel', config.id);

}).call(this);
