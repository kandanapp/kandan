class Kandan.Views.ChannelPane extends Backbone.View
  tagName: 'div'

  render: (container)->
    container = container || $(@el)
    $(container).html @paginatedActivitiesView()
    $(container).append @chatboxView()
    @setIdAndData(container)
    @
    
  setIdAndData: (container)->
    $(container).attr "id", "channels-#{@options.channel.get("id")}"
    $(container).data "channel_id", @options.channel.get('id')
  
  paginatedActivitiesView: ()->
    view = new Kandan.Views.PaginatedActivities({channel: @options.channel})
    view.render().el
    
  chatboxView: ()->
    view = new Kandan.Views.Chatbox({channel: @options.channel})
    view.render().el
