class Kandan.Helpers.Utils

  @browserTabFocused: true

  @notifyInTitleIfRequired: ->
    $(document).attr('title', '(new) Kandan') if @browserTabFocused != true

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

  @timeToString: (time) ->
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
