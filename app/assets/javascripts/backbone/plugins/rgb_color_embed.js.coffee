class Kandan.Plugins.RgbColorEmbed
  @options:
    regex: /rgb\((\d{1,3}),\s?(\d{1,3}),\s?(\d{1,3})\)/g

    template: _.template '''<span class="color-preview" style="background-color:<%= rgb %>;"/>'''

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      for rgb in message.content.match(@options.regex)
        replacement = @options.template({rgb: rgb}) + rgb
        message.content = message.content.replace(rgb, replacement)

      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)

