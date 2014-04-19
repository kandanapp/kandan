class Kandan.Plugins.YouTubeEmbed

  @options:
    regex: /^(?:https?:&#x2F;&#x2F;)?(?:www\.)?youtu(?:\.be|be\.com)&#x2F;(?:watch\?v=)?([\w-]{10,})/

    template: _.template '''
      <div class="youtube-preview">
            <iframe width="560" height="315"
                    src="<%=httpPrefix%>//www.youtube.com/embed/<%= videoId %>"
                    frameborder="0" allowfullscreen>
            </iframe>
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

      if message.match(@options.regex).length == 2
        videoId = message.match(@options.regex)[1]
        httpString = window.location.protocol
        subtitle = null
        subtitle = "#{comment}" if comment? and comment.length > 0
        subtitle ||= videoUrl

        message = @options.template({
          videoId: videoId,
          subtitle: subtitle,
          httpPrefix: httpString
        })
        return message
