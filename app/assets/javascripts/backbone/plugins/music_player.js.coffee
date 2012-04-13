class Kandan.Plugins.MusicPlayer

  @pluginNamespace: "Kandan.Plugins.MusicPlayer"
  @pluginId: ""
  @widgetTitle: "Player"
  @playRegex: /^&#x2F;play .+/
  @stopRegex: /^&#x2F;stop/
  @localSongData: false


  @playTemplate: _.template('<strong><a class="audio-play">playing</a> <a target="_blank" href="<%- url %>"><%- url %></a></strong>')
  @songTemplate: _.template('<li><%= song.split("/").pop() %></li>')


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
    @registerModifier()
    @registerWidget()


  @registerWidget: ()->
    Kandan.Widgets.register @pluginNamespace


  @registerModifier: ()->
    Kandan.Modifiers.register @playRegex, (message, state) =>
      url = $.trim(message.content.substr(message.content.indexOf(" ") + 1));
      if true and Kandan.Data.Channels.activeChannelId()? # and state == Kandan.Helpers.Activities.ACTIVE_STATE commented out because state == undefined for some reason
        @playUrl(message.channel_id, Kandan.Helpers.Utils.unescape(url))
      else
        console.log "Not playing stale song"

      message.content = @playTemplate({url: url})
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

  @nicknameToUrl: (url) ->
    sounds = {
      'claps'  : 'golfclap.mp3',
      'cheers' : 'cheers.mp3',
      'ding'   : 'ding.wav',
      'gong'   : 'gong.mp3'
      }

    fullUrl   = null
    fullUrl   = sounds[url]
    fullUrl ||= url

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
    @audioChannel(channelId).play()

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

# Kandan.Plugins.register "Kandan.Plugins.MusicPlayer"
