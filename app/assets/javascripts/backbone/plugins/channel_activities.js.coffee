class Kandan.Plugins.ChannelActivities
  @widget_title: "Activities"
  @widget_icon_url: "/assets/activities_icon.png"
  @pluginNamespace: "Kandan.Plugins.ChannelActivities"

  @channel_template: _.template '''
    <li><a href="#channels-<%= channel_id %>" class="show_channel" id="activity_channel_<%= channel_id %>"><%= name %></a></li>
  '''
  @render: ($el)->
    $channels = $("<ul class='activity_channel_list'></ul>")
    $el.html($channels)
    @initChannelListEvent()
    @initChannelList($channels)
    $el.next().hide()

  @init: ->
    Kandan.Widgets.register @pluginNamespace

  @initChannelListEvent: ->
    # TODO: やっつけ実装なので、hashchangedイベントで遷移するなどにしたい
    $(document).on 'click', '.activity_channel_list a.show_channel', (e) =>
      target_id = $(e.target).attr('href').split('#')[1]
      filtered_panes = (pane for pane in Kandan.ChatArea.panes when pane.el.id == target_id)
      filtered_panes[0]?.nav.showChannel()
      false

  @initChannelList: ($container)->
    channels = Kandan.Helpers.Channels.getCollection()
    for channel in channels.models
      $container.append(@channel_template(channel_id: channel.id, name: channel.get('name')))

  @notify: (channel_id)->
    $("#activity_channel_#{channel_id}").addClass('unread')
