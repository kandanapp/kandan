class Kandan.Data.ActiveUsers
  @callbacks: []

  @all: ()->
    Kandan.Helpers.ActiveUsers.all()

  @register_callback: (event, callback)->
    @callbacks.push(callback)

  @unregister_callback: (event, callback)->
    delete @callbacks[@callbacks.indexOf(callback)]
    @callbacks.filter (element, index, array)->
      element!=undefined
