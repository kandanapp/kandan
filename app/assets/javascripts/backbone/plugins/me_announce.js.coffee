class Kandan.Plugins.MeAnnounce

  @options:
    regex: /^&#x2F;me /

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity) =>
      actor = activity.user.username || activity.user.email
      message = message.replace @options.regex, "#{actor} "
      return message
