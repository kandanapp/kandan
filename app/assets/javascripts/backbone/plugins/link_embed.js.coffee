class Kandan.Plugins.LinkEmbed

  @options:
    regex: /(http?:\S*)/g


  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state)=>
      message.content = message.content
        .replace(@options.regex, '<a target="_blank" href="$1">$1</a>')
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)
