class Kandan.Collections.Attachments extends Backbone.Collection
  url: ()->
    "/channels/#{@channel_id}/attachments"

  initialize: (models, options)->
    @channel_id = options.channel_id
