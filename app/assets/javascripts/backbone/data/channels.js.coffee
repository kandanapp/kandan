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

  @registerCallback: (event, callback)->
    @callbacks[event].push(callback)

  @unregisterCallback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined