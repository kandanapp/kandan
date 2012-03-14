class Kandan.Modifiers
  @modifiers: []

  @register: (regex, callback)->
    @modifiers.push({regex: regex, callback: callback})

  @all: ()->
    @modifiers

  @process: (message, state)->
    for modifier in @modifiers
      console.log "pre message", message.content
      if message.content.match(modifier.regex)!=null
        modified_object = modifier.callback(message, state)
        console.log "modified", modified_object
        return modified_object if modified_object != false
    false