class Kandan.Views.ListChannelActivityAreas extends Backbone.View
  # template: JST['list_channel_activity_areas']

  render: ()->
    for channel in @options.channels.models
      view = new Kandan.Views.ListActivities({activities: channel.activities})
      $(@el).append(view.render().el)
    @