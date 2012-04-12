class Kandan.Models.Activity extends Backbone.Model
  url: ()->
    "channels/#{@get('channel_id')}/activities"
