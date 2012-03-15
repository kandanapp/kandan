class Kandan.Plugins.ImageEmbed
  @regex: /^http.*\.(jpg|jpeg|gif|png)/i
  @image_template: _.template('<a target="_blank" href="<%= image_url %>"><img class="image-embed" src="<%= image_url %>" height="200" width="200" /></a>')

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state)=>
      message.content = @image_template({ image_url: message.content })
      console.log message.content
      return Kandan.Helpers.Activities.build_from_message_template(message)

Kandan.Plugins.register "Kandan.Plugins.ImageEmbed"
