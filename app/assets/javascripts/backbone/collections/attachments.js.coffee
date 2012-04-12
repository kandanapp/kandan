class Kandan.Collections.Attachments extends Backbone.Collection
  url: ()->
    "/channels/#{@channelId}/attachments"

  initialize: (models, options)->
    @channelId = options.channelId
