class Kandan.Helpers.Utils
  @unreadActivities = 0

  @browserTabFocused: true

  @notifyInTitleIfRequired: ->
    if @browserTabFocused != true
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

  @time_to_string: (time) ->
    return time if (typeof time != "object")
    am = time.getHours() < 12
    hours = time.getHours()
    ampm = "AM" if am == true
    if am != true
      ampm = "PM"
      hours = hours - 12 if hours != 12
    minutes = time.getMinutes().toString()
    minutes = "0#{minutes}" if minutes.length == 1
    return "#{ time.getDate() }-#{ @months[time.getMonth()].slice(0,3).toUpperCase() }-#{ time.getFullYear().toString().slice(2,4) } #{ hours }:#{ minutes } #{ ampm }"
