class Kandan.Plugins.ChannelActivities
  @widget_title: "Activities"
  @widget_icon_url: "/assets/activities_icon.png"
  @pluginNamespace: "Kandan.Plugins.ChannelActivities"

  @channel_template: _.template '''
    <li><%= name %></li>
  '''
  @render: ($el)->
    $channels = $("<ul class='activity_channel_list'></ul>")
    $el.html($channels)
    @initChannelList($channels)

  @init: ->
    Kandan.Widgets.register @pluginNamespace

  @initChannelList: ($container)->
    channels = Kandan.Helpers.Channels.getCollection()
    for channel in channels.models
      $container.append(@channel_template(name: channel.get('name')))
