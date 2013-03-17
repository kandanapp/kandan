class Kandan.Modifiers
  @modifiers: []

  @register: (regex, callback)->
    @modifiers.push({regex: regex, callback: callback})

  @all: ()->
    @modifiers

  @process: (activity)->
    message = activity.content
    for modifier in @modifiers
      if message.match(modifier.regex) != null
        message = modifier.callback(message, activity)
    
    return message