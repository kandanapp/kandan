class Kandan.Plugins.MusicPlayer

  @plugin_namespace: "Kandan.Plugins.MusicPlayer"
  @plugin_id: ""
  @widget_title: "Player"
  @play_regex: /^\/play .+/
  @stop_regex: /^\/stop/
  @local_song_data: false


  @play_template: _.template('<strong><a class="audio-play">playing</a> <a target="_blank" href="<%- url %>"><%- url %></a></strong>')
  @song_template: _.template('<li><%= song.split("/").pop() %></li>')


  @set_error: (error_message)->
    console.log "music player error", error_message


  @create_song_list: (songs)->
    $songs = $('<ul class="songs"></ul>')
    if songs.length == 0
      $songs = "No songs! Maybe add some?"
    else
      $songs.append(@song_template({song: song})) for song in songs
    return $songs


  @render: ($widget_el)->
    $widget_element_class = $widget_el.attr('class')

    if @local_song_data
      $songs = @create_song_list(@local_song_data)
    else
      @get_songs({
        success: (songs)=>
          $songs = @create_song_list(songs)

        failure: ()->
          @set_error("Could not load songs")
      })
    $widget_el.html($songs)


  # TODO add support for sounds
  @init: (plugin_id)->
    @plugin_id = plugin_id
    @register_modifier()
    @register_widget()


  @register_widget: ()->
    Kandan.Widgets.register @plugin_namespace


  @register_modifier: ()->
    Kandan.Modifiers.register @play_regex, (message, state)=>
      if state == Kandan.Helpers.Activities.ACTIVE_STATE
        console.log "add song to player and play song"
        @store_song url
      else
        console.log "song is history"

      message.content = @play_template({url: message.content.split @play_regex})
      return Kandan.Helpers.Activities.build_from_base_template message


  # TODO display error about song not being added by creating an activity locally
  @store_song: (url)->
    @get_songs({
      success: (data)=>
        data.push url
        Kandan.Store.set @plugin_id, {
          success: (data)->
            @local_song_data = data
            Kandan.Widgets.render_widget @plugin_namespace
        }
    })


  @get_songs: (callbacks)->
    Kandan.Store.get @plugin_id, callbacks


Kandan.Plugins.register "Kandan.Plugins.MusicPlayer"