class Kandan.Plugins.ImageEmbed
  @options:
    regex: /http[\S]*\.(jpg|jpeg|gif|png)/i

    template: _.template '''
      <div class="image-preview">
        <a target="_blank" href="<%= imageUrl %>">
          <img class="image-embed" src="<%= imageUrl %>" />
        </a>
        <div class="name"><%= subtitle %></div>
      </div>
    '''


  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity) =>
      url        = message.match(@options.regex)[0]
      startIndex = message.match(@options.regex).index
      endIndex   = startIndex + url.length
      fileName   = url.split("/").pop()
      comment    = $.trim(message.replace(message.substring(startIndex, endIndex),""))
      subtitle   = null
      subtitle   = comment if comment.length > 0
      subtitle ||= fileName

      message = @options.template({
        imageUrl: url,
        subtitle: subtitle
      })

      return message
