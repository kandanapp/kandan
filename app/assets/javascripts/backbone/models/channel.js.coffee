class Kandan.Models.Channel extends Backbone.Model
  urlRoot: '/channels'

  parse: (response)->
    @moreActivities = false
    if response.activities
      activities = new Kandan.Collections.Activities([], {channel_id: response.id})
      activities.add(response.activities)
      @activities = activities
      @moreActivities = response.more_activities
    response