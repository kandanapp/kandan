class Kandan.Data.Attachments
  @callbacks: { "change": [] }

  @all: (callback)->
    attachments = new Kandan.Collections.Attachments([], {
      channel_id: Kandan.Data.Channels.activeChannelId()
    })
    attachments.fetch({ success: callback })

  @registerCallback: (event, callback)->
    @callbacks[event].push(callback)

  @runCallbacks: (event, data)->
    @cache = data.extra.attachments
    callback(data) for callback in @callbacks[event]


  @unregisterCallback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined