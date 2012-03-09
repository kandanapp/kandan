class Kandan.Models.Channel extends Backbone.Model
  urlRoot: '/channels'

  # initialize: ()->
    # console.log @activities

  parse: (response)->
    activities = new Kandan.Collections.Activities()
    activities.add(response.activities)
    @activities = activities
    response