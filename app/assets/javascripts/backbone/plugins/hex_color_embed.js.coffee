class Kandan.Plugins.HexColorEmbed
  @options:
    regex: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/g

    template: _.template '''<span class="color-preview" style="background-color:<%= hex %>;"/>'''

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity) =>
      for hex in message.match(@options.regex)
        replacement = @options.template({hex: hex}) + hex
        message = message.replace(hex, replacement)

      return message
