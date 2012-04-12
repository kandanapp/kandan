class Kandan.Plugins.YouTubeEmbed

  @options:
    regex: /^http(s)?.+www.youtube.com.+watch/i
    idRegex: /\Wv=([\w|\-]*)/

    template: _.template '''
      <div class="youtube-preview">
        <a target="_blank" class="youtube-preview-link" href="<%= videoUrl %>">
          <img class="youtube-preview-image" src="<%= thumbUrl %>" />
        </a>
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

      videoId = message.content.match(@options.idRegex)[1]
      thumbUrl = "http://img.youtube.com/vi/#{ videoId }/0.jpg"

      subtitle = null
      subtitle = "Youtube: #{comment}" if comment? and comment.length > 0
      subtitle ||= videoUrl

      message.content = @options.template({
        videoUrl: videoUrl,
        thumbUrl: thumbUrl,
        subtitle: subtitle
      })
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)
