class Kandan.Plugins
  @plugins: []

  @register: (plugin)->
    @plugins.push(plugin)

  @all: ()->
    @plugins

  @init_all: ()->
    eval(plugin).init() for plugin in @all()