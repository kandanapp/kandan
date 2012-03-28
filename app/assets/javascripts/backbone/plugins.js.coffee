class Kandan.Plugins
  @plugins: []

  @register: (plugin)->
    @plugins.push(plugin)

  @all: ()->
    @plugins

  @initAll: ()->
    eval(plugin).init() for plugin in @all()