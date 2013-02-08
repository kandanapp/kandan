class Kandan.Plugins.RgbColorEmbed
  @options:
    regex: /rgb\((\d{1,3}),\s?(\d{1,3}),\s?(\d{1,3})\)/

    template: _.template '''
      <span class="color-preview" style="background-color:<%= rgb %>;"/>
    '''

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      rgb = message.content.match(@options.regex)[0]
      replacement = @options.template({rgb: rgb}) + rgb

      message.content = message.content.replace(rgb, replacement)

      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)

