class Kandan.Plugins.YouTubeEmbed

  @youtube_regex: /^http(s)?.+www.youtube.com.+watch/i
  @youtube_id_regex: /\Wv=([\w|\-]*)/

  @youtube_embed_template: _.template '''
    <div class="youtube-preview">
      <a target="_blank" class="youtube-preview-link" href="<%= video_url %>">
        <img class="youtube-preview-image" src="<%= thumb_url %>" />
      </a>
      <div class="name"><%= subtitle %></div>
    </div>
  '''

  @init: ()->
    Kandan.Modifiers.register @youtube_regex, (message, state) =>
      comment = null

      # No spaces in message content indicates just a link
      if message.content.indexOf(" ") == -1
        video_url = message.content
      else
      # Spaces indicate a subtitle
        comment = $.trim(message.content.substr(message.content.indexOf(" ") + 1));
        video_url = message.content.split(" ")[0]

      video_id = message.content.match(@youtube_id_regex)[1]
      thumb_url = "http://img.youtube.com/vi/#{ video_id }/0.jpg"

      subtitle = null
      subtitle = "Youtube: #{comment}" if comment? and comment.length > 0
      subtitle ||= video_url

      message.content = @youtube_embed_template({
        video_url: video_url,
        thumb_url: thumb_url,
        subtitle: subtitle
      })
      return Kandan.Helpers.Activities.build_from_message_template(message)
