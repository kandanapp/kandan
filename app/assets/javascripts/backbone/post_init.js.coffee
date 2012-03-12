
$(document).ready ->
  $(document).bind "changeData", (event, name, value)->
    if name == "active_users"
      for callback in Kandan.Helpers.ActiveUsers.callbacks
        callback()