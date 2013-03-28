class Kandan.Plugins.MeAnnounce

  @options:
    regex: /^&#x2F;me( |$)/

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity) =>
      actor = activity.user.username || activity.user.email
      if message.length == 8 || message.length == 9
        message = "#{actor} whistles in the wind."
      else
        message = message.replace @options.regex, "#{actor} "
      return message
