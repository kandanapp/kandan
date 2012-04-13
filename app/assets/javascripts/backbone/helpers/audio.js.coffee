class Kandan.Helpers.Audio
  @audioChannels: ->
    $('.audio_channels')[0]

  @createAudioChannel: (id) ->
    channel = $("<audio class='audio_#{id}'></audio>")
    console.log(@audioChannels())
    console.log(channel)
    channel.appendTo(@audioChannels())

  @destroyAudioChannel: (id) ->
    channel = $(".audio_#{id}")
    channel.remove()

  @audioChannel: (id) ->
    $(".audio_#{id}")[0]

  @currentAudioChannel: ->
    @audioChannel(Kandan.Helpers.Channels.getActiveChannelId())
