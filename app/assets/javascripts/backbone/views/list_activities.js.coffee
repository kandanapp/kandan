class Kandan.Views.ListActivities extends Backbone.View
  tagName: 'div'
  # className: 'activities'

  render: ()->
    for activity in @options.channel.activities.models
      activity_view = new Kandan.Views.ShowActivity({activity: activity})
      $(@el).append(activity_view.render().el)
    $(@el).attr('id', "channels-#{@options.channel.get('id')}")
    $(@el).data('channel_id', @options.channel.get('id'))
    @