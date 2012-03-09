class Kandan.Models.Activity extends Backbone.Model
  urlRoot: ()->
    "channels/#{@channel_id}/activities"

  initialize: (options)->
    @channel_id = @get('channel_id')
