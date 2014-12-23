class Kandan.Views.ChannelPane extends Backbone.View
  tagName: 'div'

  render: (container) ->
    $container = $(container || @el)
    $container.html @paginatedActivitiesView()
    $paginated_activities = $container.find(".paginated-activities")

    # Flag to avoid pulling new messages when we already requested new messages from the server
    @loading_new_messages = false

    if !$paginated_activities.hasScrollBar()
      @loading_new_messages = true;
      @loadMoreActivities($container)

    $paginated_activities.bind 'scroll', =>
      if $paginated_activities.scrollTop() <= 100 && !@loading_new_messages
        @loading_new_messages = true
        @loadMoreActivities($paginated_activities)
      return

    $container.append @chatboxView()
    @setIdAndData($container)
    @renderNav()
    Kandan.Helpers.Audio.createAudioChannel(@options.channel.get('id'))
    @

  setIdAndData: (container) ->
    $(container).attr "id", "channels-#{@options.channel.get("id")}"
    $(container).attr "class", "channels-pane"
    $(container).data "channel-id", @options.channel.get('id')

  paginatedActivitiesView: ->
    view = new Kandan.Views.PaginatedActivities(channel: @options.channel)
    view.render().el

  chatboxView: ->
    view = new Kandan.Views.Chatbox(channel: @options.channel)
    view.render().el

  renderNav: ->
    @nav = new Kandan.Views.ChannelNav(channel: @options.channel)
    @nav.pane = @

    unless $('#channel_nav #create_channel').length
      create = new Kandan.Views.CreateChannel
      $('#channel_nav').append(create.render().el)

    $('#create_channel').parents('li').before(@nav.render().el)

  loadMoreActivities: ($container) ->
    $channel_activities = $container.find(".channel-activities")

    # Keeping a reference of the first child to find the offset after the elements are added
    $current_top_element = $channel_activities.children().first()

    $pagination = $container.find(".pagination")
    oldest = $pagination.data("oldest")

    activities = new Kandan.Collections.Activities([], channel_id: @options.channel.get("id"))
    activities.fetch
      data: { oldest: oldest },
      success: (collection) =>
        if collection.length > 0
          for activity in collection.models.reverse()
            activityView = new Kandan.Views.ShowActivity(activity: activity, silence_mentions: true, silence_music: true)
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
