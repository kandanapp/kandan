class Kandan.Models.Channel extends Backbone.Model
  urlRoot: '/channels'

  # initialize: ()->
    # console.log @activities

  parse: (response)->
    activities = new Kandan.Collections.Activities([], {channel_id: response.id})
    activities.add(response.activities)
    @activities = activities
    @more_activities = response.more_activities

    response