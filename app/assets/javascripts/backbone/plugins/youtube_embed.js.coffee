class Kandan.Plugins.YoutubeEmbed

  @regex: /^http(s)?:\/\/www.youtube.com\/watch/i
  @youtube_id_pattern: /\Wv=([\w|\-]*)/

  @youtube_embed_template: _.template('<div class="youtube-preview"><a target="_blank" class="youtube-preview-link" href="<%= video_url %>"><img class="youtube-preview-image" src="<% thumb_url %>" /></a></div>')

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state)=>
      video_id = message.content.match(@youtube_id_pattern)[1]
      thumb_url = "http://img.youtube.com/vi/#{ video_id }/0.jpg"
      message.content = @youtube_embed_template({
        video_url: message.content,
        image_url: thumb_url
      })
      return Kandan.Helpers.Activities.build_from_message_template(message)

Kandan.Plugins.register "Kandan.Plugins.YoutubeEmbed"