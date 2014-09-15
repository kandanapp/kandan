class Kandan.Modifiers
  @modifiers: []

  @register: (regex, callback)->
    @modifiers.push({regex: regex, callback: callback})

  @all: ()->
    @modifiers

  @process: (activity, options)->
    message = activity.content
    for modifier in @modifiers
      if message.match(modifier.regex) != null
        message = modifier.callback(message, activity, options)
    
    return message
