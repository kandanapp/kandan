class Kandan.Helpers.Audio
  @audioHolder: ->
    $('.audio_channels')[0]

  @audioChannels: ->
    $('audio')

  @createAudioChannel: (id) ->
    channel = $("<audio class='audio_#{id}'></audio>")
    channel.appendTo(@audioHolder())

  @destroyAudioChannel: (id) ->
    channel = $(".audio_#{id}")
    channel.remove()

  @audioChannel: (id) ->
    $(".audio_#{id}")[0]

  @currentAudioChannel: ->
    @audioChannel(Kandan.Helpers.Channels.getActiveChannelId())
