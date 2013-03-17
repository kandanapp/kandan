class Kandan.Plugins.YouTubeEmbed

  @options:
    regex: /http(s)?.+www.youtube.com.+watch/i
    idRegex: /\Wv=([\w|\-]*)/

    template: _.template '''
      <div class="youtube-preview">
            <iframe width="560" height="315"
                    src="http://www.youtube.com/embed/<%= videoId %>"
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

      videoId = message.match(@options.idRegex)[1]

      subtitle = null
      subtitle = "#{comment}" if comment? and comment.length > 0
      subtitle ||= videoUrl

      message = @options.template({
        videoId: videoId,
        subtitle: subtitle
      })
      return message
