class Kandan.Data.ActiveUsers
  @callbacks: {"change": [] }

  @all: ()->
    Kandan.Helpers.ActiveUsers.all()

  @register_callback: (event, callback)->
    @callbacks[event].push(callback)

  @runCallbacks: (event)->
    callback() for callback in @callbacks[event]

  @unregisterCallback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined
