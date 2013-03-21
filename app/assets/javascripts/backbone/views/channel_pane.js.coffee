class Kandan.Views.ChannelPane extends Backbone.View
  tagName: 'div'

  render: (container)->
    $container = $(container || @el)
    $container.html @paginatedActivitiesView()

    # Flag to avoid pulling new messages when we already requested new messages from the server
    @loading_new_messages = false
    
    $container.bind 'scroll', ()=>
      if $container.scrollTop() <= 100 && !@loading_new_messages
        @loading_new_messages = true
        @loadMoreActivities($container)
      return

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

  loadMoreActivities: ($container)->
    $channel_activities = $container.find(".channel-activities")
    
    # Keeping a reference of the first child to find the offset after the elements are added
    $current_top_element = $channel_activities.children().first()

    $pagination = $container.find(".pagination")
    oldest = $pagination.data("oldest")

    activities = new Kandan.Collections.Activities([], {channel_id: @options.channel.get("id")})
    activities.fetch({
      data: { oldest: oldest },
      success: (collection)=>
        for activity in collection.models.reverse()
          activityView = new Kandan.Views.ShowActivity({activity: activity, silence_mentions: true})
          $container.find(".channel-activities").prepend(activityView.render().el)

        if $current_top_element.length != 0
          $container.scrollTop($current_top_element.offset().top)

        Kandan.Helpers.Channels.setPaginationState(
          collection.channelId,
          collection.moreActivities,
          _.last(collection.models),
          $container
        )

        @loading_new_messages = false
    })
