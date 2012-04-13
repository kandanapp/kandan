class Kandan.Plugins.MusicPlayer

  @pluginNamespace: "Kandan.Plugins.MusicPlayer"
  @pluginId: ""
  @widgetTitle: "Player"
  @playRegex: /^&#x2F;play .+/
  @stopRegex: /^&#x2F;stop/
  @resumeRegex: /^&#x2F;resume/
  @localSongData: false


  @playTemplate:   _.template('<strong><a class="audio-play">playing</a> <a target="_blank" href="<%- url %>"><%- url %></a></strong>')
  @stopTemplate:   _.template('<strong><a class="audio-play">stopping</a> the music.')
  @resumeTemplate: _.template('<strong><a class="audio-play">resuming</a> the music.')
  @songTemplate:   _.template('<li><%= song.split("/").pop() %></li>')


  @setError: (errorMessage)->
    console.log "music player error", errorMessage


  @createSongList: (songs)->
    $songs = $('<ul class="songs"></ul>')
    if songs.length == 0
      $songs = "No songs! Maybe add some?"
    else
      $songs.append(@songTemplate({song: song})) for song in songs
    return $songs


  @render: ($widgetEl)->
    $widgetElementClass = $widgetEl.attr('class')

    if @localSongData
      $songs = @createSongList(@localSongData)
    else
      @getSongs({
        success: (songs)=>
          $songs = @createSongList(songs)

        failure: ()->
          @setError("Could not load songs")
      })
    $widgetEl.html($songs)


  # TODO: Add support for sounds
  @init: (pluginId)->
    @pluginId = pluginId
    Kandan.Data.Channels.registerCallback("change", $.proxy(@onChannelChange, this))
    @registerPlayModifier()
    @registerStopModifier()
    @registerResumeModifier()
    # Disabled for now
    #@registerWidget()


  @registerWidget: ()->
    Kandan.Widgets.register @pluginNamespace


  @registerPlayModifier: ()->
    Kandan.Modifiers.register @playRegex, (message, state) =>
      url = $.trim(message.content.substr(message.content.indexOf(" ") + 1));
      if true and Kandan.Data.Channels.activeChannelId()? # and state == Kandan.Helpers.Activities.ACTIVE_STATE commented out because state == undefined for some reason
        rawInput  = Kandan.Helpers.Utils.unescape(url)
        soundUrl  = null
        soundUrl  = @localSounds(rawInput)
        soundUrl ?= rawInput

        @playUrl(message.channel_id, soundUrl)
      else
        console.log "Not playing stale song"

      message.content = @playTemplate({url: url})
      return Kandan.Helpers.Activities.buildFromBaseTemplate message

  @registerStopModifier: ()->
    Kandan.Modifiers.register @stopRegex, (message, state) =>
      url = $.trim(message.content.substr(message.content.indexOf(" ") + 1));
      if true and Kandan.Data.Channels.activeChannelId()?
        @stopSound(message.channel_id)

      message.content = @stopTemplate()
      return Kandan.Helpers.Activities.buildFromBaseTemplate message

  @registerResumeModifier: ()->
    Kandan.Modifiers.register @resumeRegex, (message, state) =>
      if true and Kandan.Data.Channels.activeChannelId()?
        @play(message.channel_id)

      message.content = @resumeTemplate()
      return Kandan.Helpers.Activities.buildFromBaseTemplate message


  # TODO display error about song not being added by creating an activity locally
  @storeSong: (url)->
    @getSongs({
      success: (data)=>
        data.push url
        Kandan.Store.set @pluginId, {
          success: (data)->
            @localSongData = data
            Kandan.Widgets.renderWidget @pluginNamespace
        }
    })


  @getSongs: (callbacks)->
    Kandan.Store.get @pluginId, callbacks

  @localFileUrl: (fileName) ->
    "http://#{ window.location.hostname }:#{ window.location.port }/sounds/#{ fileName }"

  @localSounds: (name) ->
    sounds = {
      'claps'  : @localFileUrl('golfclap.mp3')
      'cheers' : @localFileUrl('cheers.mp3')
      'ding'   : @localFileUrl('ding.wav')
      'gong'   : @localFileUrl('gong.mp3')
      }

    sounds[name]

  @audioChannels: ->
    Kandan.Helpers.Audio.audioChannels()

  @audioChannel: (id) ->
    Kandan.Helpers.Audio.audioChannel(id)

  @mute: (channelId) ->
    @setVolume(channelId, 0)

  @unmute: (channelId) ->
    @setVolume(channelId, 1)

  @toggle: (channelId) ->
    if @audioChannel(channelId).volume == 0
      @unmute(channelId)
    else
      @mute(channelId)

  @setVolume: (channelId, volume) ->
    @audioChannel(channelId).volume = volume

  @setAudioUrl: (channelId, url) ->
    @audioChannel(channelId).setAttribute('src', url)

  @playUrl: (channelId, url) ->
    @setAudioUrl(channelId, url)
    @play(channelId)

  @play: (channelId) ->
    @audioChannel(channelId).play()

  @stopSound: (channelId) ->
    @audioChannel(channelId).pause()

  @currentChannel: () ->
    Kandan.Data.Channels.activeChannelId()

  @onChannelChange: () ->
    channelId = @currentChannel()
    for channel in @audioChannels()
      raw = $(channel).attr('class').split("_")[1]
      id = parseInt(raw)
      continue if isNaN(id)
      @mute(id)

    if @audioChannel(channelId)?
      @unmute(channelId)

  @playAudioNotice: ->
    url    = @localFileUrl('ding.wav')
    player = $('.audio_private')[0]
    player.setAttribute('src', url)
    player.play()

# Kandan.Plugins.register "Kandan.Plugins.MusicPlayer"
