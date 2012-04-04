class Kandan.Data.ActiveUsers
  @callbacks: { "change": [] }

  @all: ()->
    Kandan.Helpers.ActiveUsers.all()

  @registerCallback: (event, callback)->
    @callbacks[event].push(callback)

  @runCallbacks: (event, data)->
    callback(data) for callback in @callbacks[event]

  @unregisterCallback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined
