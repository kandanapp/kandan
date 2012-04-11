class Kandan.Plugins.MeAnnounce

  @options:
    regex: /^\/me /

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state)=>
      message.content = message.content.replace @options.regex, "#{message.user.first_name} "
      return Kandan.Helpers.Activities.buildFromBaseTemplate(message)

# Kandan.Plugins.register "Kandan.Plugins.MeAnnounce"