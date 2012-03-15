class Kandan.Modifiers
  @modifiers: []

  @register: (regex, callback)->
    @modifiers.push({regex: regex, callback: callback})

  @all: ()->
    @modifiers

  @process: (message, state)->
    for modifier in @modifiers
      if message.content.match(modifier.regex)!=null
        modified_object = modifier.callback(message, state)
        return modified_object if modified_object != false
    false