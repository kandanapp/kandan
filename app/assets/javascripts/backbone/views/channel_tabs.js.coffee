class Kandan.Views.ChannelTabs extends Backbone.View
  template: JST['channel_tabs']
  tagName: 'ul'

  render: ()->
    $(@el).html @template({channels: @options.channels})
    @

  createChannel: (event)->
    channelName = prompt("What's the channel name?", Kandan.Views.ChannelTabs.randomChannelName())
    channelName = channelName.replace(/^\s+|\s+$/g, '')
    if channelName
      channel = new Kandan.Models.Channel({name: channelName})
      channel.save({}, {
        success: (model)->
          Kandan.Helpers.Channels.createChannelArea(model)
      })
      console.log "create channel: #{channelName}"
    return false

  deleteChannel: (event)->
    channelIndex = $(event.target).parents('li').prevAll().length
    Kandan.Helpers.Channels.deleteChannelByTabIndex(channelIndex) if channelIndex != 0
    return false

  randomChannelName: () ->
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
