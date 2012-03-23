class Kandan.Plugins.ImageEmbed
  @image_regex:   /^http.*\.(jpg|jpeg|gif|png)/i


  @image_template: _.template '''
    <div class="image-preview">
      <a target="_blank" href="<%= image_url %>">
        <img class="image-embed" src="<%= image_url %>" height="200" width="200" />
      </a>
      <div class="name"><%= name %></div>
    </div>
   '''

  @init: ()->
    Kandan.Modifiers.register @image_regex, (message, state)=>
      file_name = message.content.split("/").pop()
      message.content = @image_template({
        image_url: message.content,
        name: file_name
      })
      return Kandan.Helpers.Activities.build_from_message_template(message)