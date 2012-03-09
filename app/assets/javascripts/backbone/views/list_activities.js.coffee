class Kandan.Views.ListActivities extends Backbone.View
  tagName: 'div'
  # className: 'activities'

  render: ()->
    for activity in @options.channel.activities.models
      activity_view = new Kandan.Views.Activity({activity: activity})
      $(@el).append(activity_view.render().el)
    $(@el).attr('id', "channels-#{@options.channel.get('id')}")
    @