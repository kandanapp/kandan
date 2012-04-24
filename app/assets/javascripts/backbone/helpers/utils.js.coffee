class Kandan.Helpers.Utils
  @unreadActivities = 0

  @browserTabFocused: true

  @notifyInTitleIfRequired: (activityAttributes) ->
    console.log(activityAttributes)

    if Kandan.Data.Channels.activeChannelId() == activityAttributes.channel_id and activityAttributes.action == "message" and @browserTabFocused != true
      Kandan.Plugins.MusicPlayer.playAudioNotice()
      @unreadActivities += 1
      $(document).attr('title', "(#{@unreadActivities}) Kandan")


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

  @unescape: (string) ->
    string.replace(/&#x2F;/g, "/")
