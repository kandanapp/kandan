class Kandan.Plugins.LinkEmbed

  @regex: /http:\S*/g
  @link_template: _.template('<a target="_blank" href="<%- url %>"><%- url %></a>')

  @init: ()->
    Kandan.Modifiers.register @regex, (message, state)=>
      message.content = message.content
        .replace(@regex, @link_template({ url: "$1" }))
      return Kandan.Helpers.Activities.build_from_message_template(message)

Kandan.Plugins.register "Kandan.Plugins.LinkEmbed"