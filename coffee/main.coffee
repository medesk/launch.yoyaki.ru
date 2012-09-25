pageMap =
  'en':
    id: '7UDFVQ71'
  'ru':
    id: '4F5IJTYE'

config = pageMap[document.location.search?.match(/(..)$/i)?[1]] ? pageMap['en']

$('.lrdiscoverwidget').attr('rel', config.id)
