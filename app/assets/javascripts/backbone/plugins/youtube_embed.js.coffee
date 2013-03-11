class Kandan.Plugins.YouTubeEmbed

  @options:
    regex: /^http(s)?.+www.youtube.com.+watch/i
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
    Kandan.Modifiers.register @options.regex, (message, state) =>
      comment = null

      # No spaces in message content indicates just a link
      if message.content.indexOf(" ") == -1
        videoUrl = message.content
      else
      # Spaces indicate a subtitle
        comment = $.trim(message.content.substr(message.content.indexOf(" ") + 1));

      videoId = message.content.match(@options.idRegex)[1]

      subtitle = null
      subtitle = "Youtube: #{comment}" if comment? and comment.length > 0
      subtitle ||= videoUrl

      message.content = @options.template({
        videoId: videoId,
        subtitle: subtitle
      })
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)
