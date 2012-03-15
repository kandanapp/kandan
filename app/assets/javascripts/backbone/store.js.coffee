class Kandan.Store
  @get: (plugin_id, callbacks)->
    # TODO this should change
    data = ["http://google.com/song.mp3", "http://google.com/song2.mp3"]
    callbacks.success(data)

  @set: (plugin_id, callbacks)->
    callbacks.success(data)