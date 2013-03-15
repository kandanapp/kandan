class Kandan.Views.ChannelPane extends Backbone.View
  tagName: 'div'

  render: (container)->
    $container = $(container || @el)
    $container.html @paginatedActivitiesView()
    $container.append @chatboxView()
    @setIdAndData($container)
    $li = $("a[href=#channels-#{@options.channel.get('id')}]").parent()
    if @options.channel.isDestroyable()
      $li.addClass 'destroyable'
      $li.find('cite').after '<cite class="close_channel" title="close channel">x</cite>'
    else
      $li.addClass 'protected'
    Kandan.Helpers.Audio.createAudioChannel(@options.channel.get('id'))
    @

  setIdAndData: (container)->
    $(container).attr "id", "channels-#{@options.channel.get("id")}"
    $(container).attr "class", "channels-pane"
    $(container).data "channel-id", @options.channel.get('id')

  paginatedActivitiesView: ()->
    view = new Kandan.Views.PaginatedActivities({channel: @options.channel})
    view.render().el

  chatboxView: ()->
    view = new Kandan.Views.Chatbox({channel: @options.channel})
    view.render().el
