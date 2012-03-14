class Kandan.Modifiers
  @modifiers: []

  @register: (regex, callback)->
    @modifiers.push({regex: regex, callback: callback})

  @all: ()->
    @modifiers