class Kandan.Plugins.VimeoEmbed

  @options:
    regex: /^http[s]?:&#x2F;&#x2F;(w{3}.)?vimeo.com&#x2F;(\d+)/i

    template: _.template '''
      <div class="vimeo-preview">
        <iframe src="//player.vimeo.com/video/<%= videoId %>" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
        <div class="name"><%= subtitle %></div>
      </div>
    '''


  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, activity) =>
      comment = null

      # No spaces in message content indicates just a link
      if message.indexOf(" ") == -1
        videoUrl = message
      else
      # Spaces indicate a subtitle
      comment = $.trim(message.substr(message.indexOf(" ") + 1));
      videoUrl = message.split(" ")[0]

      videoId = message.match(@options.regex)[2]

      subtitle = null
      subtitle = "#{comment}" if comment? and comment.length > 0
      subtitle ||= videoUrl

      message = @options.template({
        videoId: videoId,
        subtitle: subtitle
      })
      return message
