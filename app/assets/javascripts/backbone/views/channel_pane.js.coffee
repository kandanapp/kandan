class Kandan.Views.ChannelPane extends Backbone.View
  tagName: 'div'

  render: (container)->
    container = container || $(@el)
    console.log("channel view render", container);
    $(container).html @paginatedActivitiesView()
    $(container).append @chatboxView()
    @setIdAndData(container)
    Kandan.Helpers.Audio.createAudioChannel(@options.channel.get('id'))
    @

  setIdAndData: (container)->
    $(container).attr "id", "channels-#{@options.channel.get("id")}"
    $(container).data "channel-id", @options.channel.get('id')

  paginatedActivitiesView: ()->
    view = new Kandan.Views.PaginatedActivities({channel: @options.channel})
    view.render().el

  chatboxView: ()->
    view = new Kandan.Views.Chatbox({channel: @options.channel})
    view.render().el
