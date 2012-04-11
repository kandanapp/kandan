class Kandan.Plugins.ImageEmbed
  @options:
    regex:   /^http.*\.(jpg|jpeg|gif|png)/i

    template: _.template '''
      <div class="image-preview">
        <a target="_blank" href="<%= image_url %>">
          <img class="image-embed" src="<%= imageUrl %>" height="200" width="200" />
        </a>
        <div class="name"><%= name %></div>
      </div>
     '''


  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state)=>
      fileName = message.content.split("/").pop()
      message.content = @options.template({
        imageUrl: message.content,
        name: fileName
      })
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)