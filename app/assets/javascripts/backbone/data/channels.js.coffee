class Kandan.Data.Channels
  @callbacks: {"change": [] }

  @active_channel_id: ()->
    Kandan.Helpers.Channels.get_active_channel_id()

  @all: (callbacks)->
    attachments = new Kandan.Collections.Attachments([], {
      channel_id: @active_channel_id()
    })

  @run_callbacks: (event)->
    callback() for callback in @callbacks[event]

  @register_callback: (event, callback)->
    @callbacks[event].push(callback)

  @unregister_callback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined