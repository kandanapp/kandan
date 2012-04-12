class Kandan.Plugins.ImageEmbed
  @image_regex:   /http.*\.(jpg|jpeg|gif|png)/i

  @image_template: _.template '''
    <div class="image-preview">
      <a target="_blank" href="<%= image_url %>">
        <img class="image-embed" src="<%= image_url %>" height="200" width="200" />
      </a>
      <div class="name"><%= subtitle %></div>
    </div>
   '''

  @init: ()->
    Kandan.Modifiers.register @image_regex, (message, state) =>
      url        = message.content.match(@image_regex)[0]
      fileName   = url.split("/").pop()
      comment    = $.trim(message.content.split(url).join(""))
      subtitle   = null
      subtitle   = comment if comment.length > 0
      subtitle ||= fileName

      message.content = @image_template({
        image_url: message.content,
        subtitle: subtitle
      })

      return Kandan.Helpers.Activities.build_from_message_template(message)
