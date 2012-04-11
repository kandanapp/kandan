class Kandan.Collections.Activities extends Backbone.Collection

  url: ()->
    "channels/#{@channelId}/activities"

  initialize: (models, options)->
    @channelId = options.channel_id

  parse: (response)->
    @moreActivities = response.more_activities
    response.activities
