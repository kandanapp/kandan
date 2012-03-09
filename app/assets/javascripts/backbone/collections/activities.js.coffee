class Kandan.Collections.Activities extends Backbone.Collection

  urlRoot: ()->
    "channels/#{@channel_id}/activities"

  initialize: (options)->
    @channel_id = @get('channel_id')
