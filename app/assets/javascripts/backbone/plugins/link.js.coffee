class Kandan.Plugins.Link

  @regex: /http:\S*/g

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state)=>
      message.content = message.content.replace @regex, '<a target="_blank" href="$1">$1</a>'
      return Kandan.Helpers.Activities.build_from_message_template(message)

Kandan.Plugins.register "Kandan.Plugins.Link"