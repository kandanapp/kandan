class Kandan.Views.ChannelTabs extends Backbone.View
  template: JST['channel_tabs']
  tagName: 'ul'

  render: ()->
    $(@el).html @template({channels: @options.channels})
    @

  createChannel: (event)->
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
    channelName = channelName.replace(/^\s+|\s+$/g, '')
    if channelName
      channel = new Kandan.Models.Channel({name: channelName})
      channel.save({}, {
        success: (model)->
          Kandan.Helpers.Channels.createChannelArea(model)

        error: (model)->
          alert("Something went wrong while creating a new Room.\n\nMaybe the room name is already taken?")
      })
      console.log "create channel: #{channelName}"
    return false

  deleteChannel: (event)->
    channelIndex = $(event.target).parents('li').prevAll().length
    Kandan.Helpers.Channels.deleteChannelByTabIndex(channelIndex) if channelIndex != 0
    return false
