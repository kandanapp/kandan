class Kandan.Models.Activity extends Backbone.Model
  url: ()->
    "channels/#{@get('channel_id')}/activities"

  initialize: (options)->
    @channel_id = @get('channel_id')
