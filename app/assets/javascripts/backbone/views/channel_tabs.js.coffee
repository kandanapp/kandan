class Kandan.Views.ChannelTabs extends Backbone.View
  template: JST['channel_tabs']
  tagName: 'ul'

  events:
    "click .close_channel" : "deleteChannel"
    "click #create_channel": "createChannel"


  render: ()->
    $(@el).html @template({channels: @options.channels})
    @

  createChannel: (event)->
    channelName = prompt("What's the channel name?", "New channel")
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
