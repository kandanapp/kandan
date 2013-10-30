class Kandan.Views.CreateChannel extends Backbone.View
  template: JST['create_channel']
  tagName: 'li'

  events:
    "click #create_channel": 'createChannel'

  render: ->
    @$el.html @template
    @

  createChannel: (event) ->
    names = [
      "A Dark Place",
      "Discotheque",
      "Dungeon",
      "Garden",
      "Lobby",
      "Office",
      "Palace",
      "Park",
      "Studio",
      "Temple",
      "War Room",
      "Zork"]

    # Inefficient random method but there are only a few names so it's
    # not an issue
    name = _.shuffle(names)[0]

    channelName = prompt("What's the channel name?", name)
    channelName = channelName?.replace(/^\s+|\s+$/g, '')
    if channelName
      channel = new Kandan.Models.Channel({name: channelName})
      channel.save {},
        error: (model, response)->
          _.each(JSON.parse(response.responseText), alert)

    false
