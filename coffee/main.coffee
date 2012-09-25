pageMap =
  'en':
    id: '7UDFVQ71'
  'ru':
    id: '4F5IJTYE'
    showVk: yes

config = pageMap[document.location.search?.match(/(..)$/i)?[1]] ? pageMap['en']

# setup launchrock widget
$('.lrdiscoverwidget').attr('rel', config.id)

setTimeout =>
  if config.showVk
    $("#sharebuttons-#{config.id}").append $(\
    """
      <span id="vk_like" class="facebook"></span>
      <script type="text/javascript">
        VK.Widgets.Like("vk_like", {type: "mini", height: 20});
      </script>
    """)
, 4000
