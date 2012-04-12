class Kandan.Plugins.MeAnnounce

  @options:
    regex: /^&#x2F;me /

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      actor = message.user.first_name || message.user.email
      message.content = message.content.replace @options.regex, "#{actor} "
      return Kandan.Helpers.Activities.buildFromBaseTemplate(message)
