class Kandan.Plugins.ChannelActivities
  @widget_title: "Activities"
  @widget_icon_url: "/assets/activities_icon.png"
  @pluginNamespace: "Kandan.Plugins.ChannelActivities"

  @render: ($el)->

  @init: ->
    Kandan.Widgets.register @pluginNamespace
