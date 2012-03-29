class Kandan.Views.ChannelPane extends Backbone.View
  tagName: 'div'

  render: ()->
    @channel = @options.channel

    paginatedActivitiesView = new Kandan.Views.PaginatedActivities({channel: @channel})
    $(@el).html paginatedActivitiesView.render().el

    chatbox = new Kandan.Views.Chatbox({channel: @channel})
    $(@el).append chatbox.render().el

    $(@el).attr "id", "channels-#{@channel.get("id")}"
    $(@el).data "channel_id", @channel.get('id')
    @