class Kandan.Plugins.HexColorEmbed
  @options:
    regex: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/

    template: _.template '''
      <span class="color-preview" style="background-color:<%= hex %>;"/>
    '''

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      hex = message.content.match(@options.regex)[0]
      replacement = @options.template({hex: hex}) + hex

      message.content = message.content.replace(hex, replacement)

      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)
