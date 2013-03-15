class Kandan.Plugins.RgbColorEmbed
  @options:
    regex: /rgb\((\d{1,3}),\s?(\d{1,3}),\s?(\d{1,3})\)/g

    template: _.template '''<span class="color-preview" style="background-color:<%= rgb %>;"/>'''

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity) =>
      for rgb in message.match(@options.regex)
        replacement = @options.template({rgb: rgb}) + rgb
        message = message.replace(rgb, replacement)

      return message

