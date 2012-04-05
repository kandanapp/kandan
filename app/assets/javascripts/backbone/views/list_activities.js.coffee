class Kandan.Views.ListActivities extends Backbone.View
  tagName: 'div'
  className: 'channel-activities'

  render: ()->
    @channel = @options.channel
    $(@el).attr('id', "channel-activities-#{@channel.get('id')}")
    oldest = 0

    if @channel.activities
      for activity in @channel.activities.models
        activityView = new Kandan.Views.ShowActivity({activity: activity, state: Kandan.Helpers.Activities.HISTORY_STATE})
        $(@el).append(activityView.render().el)
    @
