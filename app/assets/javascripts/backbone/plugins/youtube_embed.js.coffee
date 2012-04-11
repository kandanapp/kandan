class Kandan.Plugins.YouTubeEmbed

  @options:
    regex: /^http(s)?:\/\/www.youtube.com\/watch/i
    idRegex: /\Wv=([\w|\-]*)/

    template: _.template '''
      <div class="youtube-preview">
        <a target="_blank" class="youtube-preview-link" href="<%= videoUrl %>">
          <img class="youtube-preview-image" src="<%= thumbUrl %>" />
        </a>
      </div>
    '''

  @init: ()->
    Kandan.Modifiers.register @options.regex, (message, state)=>
      videoId = message.content.match(@options.idRegex)[1]
      thumbUrl = "http://img.youtube.com/vi/#{ videoId }/0.jpg"
      message.content = @options.template({
        videoUrl: message.content,
        thumbUrl: thumbUrl
      })
      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)