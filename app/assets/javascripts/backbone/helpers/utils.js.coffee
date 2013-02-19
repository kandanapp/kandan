class Kandan.Helpers.Utils
  @unreadActivities = 0

  @browserTabFocused: true

  @notifyInTitle: ()->
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
