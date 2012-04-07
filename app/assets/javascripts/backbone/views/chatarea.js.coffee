class Kandan.Views.ChatArea extends Backbone.View

  render: ->
    tabView = new Kandan.Views.ChannelTabs({channels: @options.channels})
    $('.header .logo').after(tabView.render().el)
    console.log(tabView);
    $('#create_channel').click(tabView.createChannel)

    for channel in @options.channels.models
      view = new Kandan.Views.ChannelPane({channel: channel})
      $(@el).append(view.render().el)
    $(@el).attr('id', 'channels')
    @
