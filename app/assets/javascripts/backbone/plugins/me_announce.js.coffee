class Kandan.Plugins.MeAnnounce

  @regex: /^&#x2F;me /

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state)=>
      message.content = message.content.replace @regex, "#{message.user.first_name} "
      return Kandan.Helpers.Activities.build_from_base_template(message)

# Kandan.Plugins.register "Kandan.Plugins.MeAnnounce"
