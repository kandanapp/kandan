class Kandan.Plugins
  @plugins: []

  @register: (plugin)->
    @plugins.push(plugin)

  @all: ()->
    @plugins