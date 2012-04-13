class Kandan.Helpers.Utils
  @unreadActivities = 0

  @browserTabFocused: true

  @notifyInTitleIfRequired: ->
    if @browserTabFocused != true
      @playAudioNotice()
      @unreadActivities += 1
      $(document).attr('title', "(#{@unreadActivities}) Kandan")

  @playAudioNotice: ->
    url    = @localFileUrl('ding.wav')
    player = $('.audio_private')[0]
    player.setAttribute('src', url)
    player.play()

  @localFileUrl: (fileName) ->
    return "http://#{ window.location.hostname }:#{ window.location.port }/sounds/#{ fileName }"

  @months: [
    "January"
    ,"February"
    ,"March"
    ,"April"
    ,"May"
    ,"June"
    ,"July"
    ,"August"
    ,"September"
    ,"October"
    ,"November"
    ,"December"
  ]

  @resetUnreadActivities: () ->
    @unreadActivities = 0
