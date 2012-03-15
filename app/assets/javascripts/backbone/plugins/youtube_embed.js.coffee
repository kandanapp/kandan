class Kandan.Plugins.Embeds

  @youtube_regex: /^http(s)?:\/\/www.youtube.com\/watch/i
  @link_regex:    /(http?:\S*)/g
  @image_regex:   /^http.*\.(jpg|jpeg|gif|png)/i

  @youtube_id_regex: /\Wv=([\w|\-]*)/


  @youtube_embed_template: _.template('<div class="youtube-preview"><a target="_blank" class="youtube-preview-link" href="<%= video_url %>"><img class="youtube-preview-image" src="<%= thumb_url %>" /></a></div>')

  @image_template: _.template('<a target="_blank" href="<%= image_url %>"><img class="image-embed" src="<%= image_url %>" height="200" width="200" /></a>')


  @init: ()->
    @register_youtube_modifier()
    @register_image_modifier()
    @register_link_modifier()



  @register_image_modifier: ()->
    Kandan.Modifiers.register @image_regex, (message, state)=>
      message.content = @image_template({ image_url: message.content })
      console.log message.content
      return Kandan.Helpers.Activities.build_from_message_template(message)


  @register_youtube_modifier: ()->
    Kandan.Modifiers.register @youtube_regex, (message, state)=>
      video_id = message.content.match(@youtube_id_regex)[1]
      thumb_url = "http://img.youtube.com/vi/#{ video_id }/0.jpg"
      message.content = @youtube_embed_template({
        video_url: message.content,
        thumb_url: thumb_url
      })
      return Kandan.Helpers.Activities.build_from_message_template(message)


  @register_link_modifier: ()->
    Kandan.Modifiers.register @link_regex, (message, state)=>
      message.content = message.content
        .replace(@link_regex, '<a target="_blank" href="$1">$1</a>')
      return Kandan.Helpers.Activities.build_from_message_template(message)

Kandan.Plugins.register "Kandan.Plugins.Embeds"