class Kandan.Data.Channels
  @callbacks: {"change": [] }

  @activeChannelId: ()->
    Kandan.Helpers.Channels.getActiveChannelId()

  @all: (callbacks)->
    attachments = new Kandan.Collections.Attachments([], {
      channel_id: @activeChannelId()
    })

  @runCallbacks: (event)->
    callback() for callback in @callbacks[event]

  @register_callback: (event, callback)->
    @callbacks[event].push(callback)

  @unregister_callback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined