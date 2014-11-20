class Kandan.Plugins.LinkEmbed

  @options:
    regex: /(^| )(http?[^\s<>]*)/gm

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity)=>
      message = message.replace(@options.regex, '$1<a target="_blank" href="$2">$2</a>')
      return message
