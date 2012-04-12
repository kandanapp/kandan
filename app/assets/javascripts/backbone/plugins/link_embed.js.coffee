class Kandan.Plugins.LinkEmbed
  @link_regex: /(http?\S*)/g

  @init: ()->
    Kandan.Modifiers.register @link_regex, (message, state)=>
      message.content = message.content
        .replace(@link_regex, '<a target="_blank" href="$1">$1</a>')
      return Kandan.Helpers.Activities.build_from_message_template(message)
