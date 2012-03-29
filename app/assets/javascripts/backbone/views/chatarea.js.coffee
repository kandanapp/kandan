class Kandan.Views.ChatArea extends Backbone.View

  template: JST['chatarea']
  # className: 'channels'

  events:
    "click .ui-icon-close" : "deleteChannel"
    "click .create_channel": "createChannel"

  render: ->
    $(@el).html(@template({channels: @options.channels}))
    for channel in @options.channels.models
      view = new Kandan.Views.ChannelPane({channel: channel})
      $(@el).append(view.render().el)
    $(@el).attr('id', 'channels')
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

  deleteChannel: (event)->
    channelIndex = $(event.target).parent().prev().length
    Kandan.Helpers.Channels.deleteChannelByTabIndex channelIndex if channelIndex != 0