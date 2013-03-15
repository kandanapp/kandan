class Kandan.Plugins.LinkEmbed

  @options:
    regex: /(^| )(http?\S*)/g

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity)=>
      message = message.replace(@options.regex, '<a target="_blank" href="$2">$2</a>')
      return message
