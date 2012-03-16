class Kandan.Collections.Attachments extends Backbone.Collection
  url: ()->
    "/channels/#{@options.channel_id}/attachments"