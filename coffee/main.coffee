$(window).ready =>
  pageMap =
    'en':
      id: '7UDFVQ71'
      shareUrl: 'launch.yoyaki.com'
    'ru':
      id: '4F5IJTYE'
      shareUrl: 'launch.yoyaki.ru'
      showVkontakte: yes
      showOdnoklassniki: yes
      sharing:
        description: 'Новый и удобный сервис по поиску и записи на услуги. 
        Подпишись, чтобы быть первым кто узнает о запуске!'

  config = pageMap[window.location.hostname?.match(/(..)$/i)?[1]] ? pageMap['en']

# setup launchrock widget
  $('.lrdiscoverwidget').attr
    rel: config.id
    'data-share-url': config.shareUrl

  setTimeout =>
# put ninja in place
    $("#lrcontent-#{config.id}").append $(
      """
      <div id="ninja" class="ninja animated rollIn">
        <div class="eyes"> 
          <div class="eye">
            <div class="iris"></div>
          </div>
          <div class="eye" style="margin-left:6px;">
              <div class="iris"></div>
          </div>
        </div>
      </div>
      """
      )
    ninja = $('#ninja')
    $('.iris').xeyes
      position: 'center'
      radius: 'circular'

    # launch animation mode (cursor tracking)

    jump = =>
      ninja.animate
        top: '-=30'
      , 'fast'
      , 'swing'
      , =>
        ninja.animate
          top: '-79'
        , 'normal'
        , 'easeOutBounce'
    jumpAlways = =>
      jump()
      setTimeout jumpAlways, 5000

    setTimeout jumpAlways, 5000

    counter = 0
    $(window).mousemove (event) =>
      event.stopPropagation()
      counter++
      setTimeout =>
        counter--
        unless counter
          ninja.animate
            left: Math.floor(event.pageX/$(window).width() * 340)
          , '700'
          , 'easeInOutElastic'
          counter = 0
      , 100
    $(window).dblclick =>
      ninja.removeClass 'rollIn fadeInLeftBig'
      ninja.addClass 'fadeOutRightBig'
      setTimeout =>
        ninja.removeClass 'fadeOutRightBig'
        ninja.addClass 'fadeInLeftBig'
      , 500
    $(window).click =>
      jump()
  , 3000

# adding 
  shareText = null

  monitorTextChange = =>
    shareText = $("#shareurl-#{config.id}") unless shareText
    
    url = shareText.val()
    unless url.match(/yoyaki/)
      setTimeout monitorTextChange, 1000
    else
      if config.showOdnoklassniki
        params = $.param
          url: url
          description: config.sharing?.description

        $("#sharebuttons-#{config.id}").append $(\
        """
        <a target="_blank" class="mrc__plugin_uber_like_button" href="http://connect.mail.ru/share?#{params}" data-mrc-config="{'nc' : '1', 'cm' : '1', 'ck' : '1', 'sz' : '20', 'st' : '2', 'tp' : 'ok', 'width': 64}">Нравится</a>
        <script src="http://cdn.connect.mail.ru/js/loader.js" type="text/javascript" charset="UTF-8"></script>
        """)
      if config.showVkontakte
        $("#sharebuttons-#{config.id}").append $(\
        """
          <script type="text/javascript">
          </script>
          <span id="vk_like" style="display:inline-block"></span>
          <script type="text/javascript">
            VK.init({apiId: 3144190, onlyWidgets: true});
            VK.Widgets.Like("vk_like", {
              type: "mini", 
              height: 20,
              width: 76, 
              pageUrl: '#{url}',
              pageDescription: '#{config.sharing?.description}'});
            //var vkFix = function() {
            //  $('#vk_like').css('width','76px');
            //  setTimeout(vkFix, 1000);
            //}
            //setTimeout(vkFix, 1000);
          </script>
        """)

  setTimeout monitorTextChange, 4000
