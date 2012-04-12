class Kandan.Views.ChatArea extends Backbone.View

  render: ->
    tabView = new Kandan.Views.ChannelTabs({channels: @options.channels})
    window.tabViewGlobal = tabView
    $('.header .logo').after(tabView.render().el)

    # Binding tab events here, backbone can't properly attach
    $('#create_channel').click(tabView.createChannel)
    $('.header ul a').delegate('cite.close_channel', 'click', tabView.deleteChannel)

    for channel in @options.channels.models
      view = new Kandan.Views.ChannelPane({channel: channel})
      $(@el).append(view.render().el)
    $(@el).attr('id', 'channels')
    @
