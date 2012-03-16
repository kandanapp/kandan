class Kandan.Collections.Activities extends Backbone.Collection

  url: ()->
    "channels/#{@channel_id}/activities"

  initialize: (models, options)->
    @channel_id = options.channel_id

  parse: (response)->
    @more_activities = response.more_activities
    response.activities
