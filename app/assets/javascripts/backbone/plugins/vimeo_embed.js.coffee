class Kandan.Plugins.VimeoEmbed

  @options:
    regex: /^http[s]?:&#x2F;&#x2F;(w{3}.)?vimeo.com&#x2F;(\d+)/i
    
    template: _.template '''
      <div class="vimeo-preview">
        <iframe src="http://player.vimeo.com/video/<%= videoId %>" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
        <div class="name"><%= subtitle %></div>
      </div>
    '''


  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state) =>
      comment = null

      # No spaces in message content indicates just a link
      if message.content.indexOf(" ") == -1
        videoUrl = message.content
      else
      # Spaces indicate a subtitle
      comment = $.trim(message.content.substr(message.content.indexOf(" ") + 1));
      videoUrl = message.content.split(" ")[0]

      videoId = message.content.match(@options.regex)[2]
      
      subtitle = null
      subtitle = "Vimeo: #{comment}" if comment? and comment.length > 0
      subtitle ||= videoUrl

      message.content = @options.template({
        videoId: videoId,
        thumbUrl: "http://www.edcanvas.com/assets/logo.png",
        subtitle: subtitle
      })
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)
