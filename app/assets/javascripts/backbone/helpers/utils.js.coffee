class Kandan.Helpers.Utils

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
    return "#{ time.getFullYear() }-#{ time.getMonth() + 1 }-#{ time.getDate() } #{ hours }:#{ minutes }#{ ampm }"
