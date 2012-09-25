pageMap =
  'en':
    id: '7UDFVQ71'
  'ru':
    id: '4F5IJTYE'
    showVk: yes
    showOk: yes

config = pageMap[document.location.search?.match(/(..)$/i)?[1]] ? pageMap['en']

# setup launchrock widget
$('.lrdiscoverwidget').attr('rel', config.id)

shareText = null

monitorTextChange = =>
  shareText = $("#shareurl-#{config.id}") unless shareText
  
  url = shareText.val()
  unless url.match(/yoyaki/)
    setTimeout monitorTextChange, 1000
  else
    if config.showVk
      $("#sharebuttons-#{config.id}").append $(\
      """
        <script type="text/javascript">
        </script>
        <span id="vk_like" style="display:inline-block"></span>
        <script type="text/javascript">
          VK.init({apiId: 3143951, onlyWidgets: true});
          VK.Widgets.Like("vk_like", {
            type: "mini", 
            height: 20,
            width: 76, 
            pageUrl: '#{url}',
            pageDescription: 'Тестовое описание'});
          var vkFix = function() {
            $('#vk_like').css('width','76px');
            setTimeout(vkFix, 1000);
          }
          setTimeout(vkFix, 1000);
        </script>
      """)
    if config.showOk
      $("#sharebuttons-#{config.id}").append $(\
      """
      <a target="_blank" class="mrc__plugin_uber_like_button" href="http://connect.mail.ru/share" data-mrc-config="{'nc' : '1', 'cm' : '1', 'ck' : '1', 'sz' : '20', 'st' : '2', 'tp' : 'ok', 'width': 76}">Нравится</a>
      <script src="http://cdn.connect.mail.ru/js/loader.js" type="text/javascript" charset="UTF-8"></script>
      """)

setTimeout monitorTextChange, 4000
