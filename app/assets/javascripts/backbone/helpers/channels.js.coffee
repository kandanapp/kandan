class Kandan.Helpers.Channels
  @all: (options) ->
    $(document).data("channels")

  @getCollection: ->
    $(document).data("channelsCollection")

  @setCollection: (collection) ->
    $(document).data("channelsCollection", collection)
    $(document).data("channels", collection.toJSON())

  @options:
    autoScrollThreshold: 0.90

  @pastAutoScrollThreshold: (channelId) ->
    currentPosition     = @currentScrollPosition channelId
    totalHeight         = $(document).height() - $(window).height()
    scrollPercentage    = (currentPosition) / (totalHeight)
    scrollPercentage > @options.autoScrollThreshold

  @scrollToLatestMessage: (channelId) ->
    if channelId
      theScrollArea = @channelPane(channelId)
      theScrollArea.scrollTop(theScrollArea.prop('scrollHeight'))
    else
      $('.channels-pane').scrollTop($('.channels-pane').prop('scrollHeight'))

  @currentScrollPosition: (channelId) ->
    $('channels-pane').scrollTop()

  @channelPane: (channelId) ->
    $("#channels-#{channelId}")

  @channelActivitiesEl: (channelId) ->
    $("#channel-activities-#{channelId}")

  @channelPaginationEl: (channelId) ->
    $("#channels-#{channelId} .pagination")

  @getActiveChannelId: ->
    $(document).data('active-channel-id')

  @confirmDeletion: ->
    return confirm("Really delete the channel?")

  @flushActivities: (channelId) ->
    $channelActivities = $("#channel-activities-#{channelId}")
    if $channelActivities.children().length == Kandan.options().per_page + 1
      $channelActivities.children().first().remove()
      oldest = $channelActivities.children().first().data("activity-id")
      $channelActivities.prev().data("oldest", oldest)
      @channelPaginationEl(channelId).show()

  @getChannelIndexById: (channelId) ->
    $("#channels-#{channelId}").prevAll("div").length

  @deleteChannelById: (channelId) ->
    if @channelExists(channelId)
      channelIndex = @getChannelIndexById(channelId)

      pane = Kandan.ChatArea.panes.splice(channelIndex,1)[0]
      pane.nav.remove()
      pane.remove()

      if $(document).data('active-channel-id') == channelId
        Kandan.ChatArea.panes[channelIndex-1].nav.showChannel()

  @channelExists: (channelId) ->
    return true if @channelPane(channelId).length > 0
    false

  @createChannelArea: (channel) ->
    pane = new Kandan.Views.ChannelPane(channel: channel)
    $('#channels').append(pane.render().el)
    Kandan.ChatArea.panes.push(pane)
    pane.nav.showChannel()

  @newActivityView: (activityAttributes) ->
    activity = new Kandan.Models.Activity(activityAttributes)
    activityView = new Kandan.Views.ShowActivity(activity: activity)
    activityView

  @createChannelIfNotExists: (activityAttributes) ->
    if activityAttributes.channel && (not @channelExists(activityAttributes.channel_id))
      @createChannelArea(new Kandan.Models.Channel(activityAttributes.channel))

  @addActivity: (activityAttributes, state, local) ->
    local = local || false
    @createChannelIfNotExists(activityAttributes)

    if activityAttributes.channel_id
      @addMessage(activityAttributes, state, local)
    else
      @addNotification(activityAttributes)

    channelId = activityAttributes.channel_id || @getActiveChannelId()
    @scrollToLatestMessage(channelId) if @pastAutoScrollThreshold(channelId)


  @addMessage: (activityAttributes, state, local) ->
    belongsToCurrentUser = ( activityAttributes.user.id == Kandan.Data.Users.currentUser().id )
    activityExists       = ( $("#activity-#{activityAttributes.id}").length > 0 )
    local = local || false
    console.log !local, !belongsToCurrentUser, !activityExists

    if local || (!local && !belongsToCurrentUser && !activityExists)
      @channelActivitiesEl(activityAttributes.channel_id)
        .append(@newActivityView(activityAttributes).render().el)

    @flushActivities(activityAttributes.channel_id)

    if not local and @getActiveChannelId() == activityAttributes.channel_id and activityAttributes.action == "message" and Kandan.Helpers.Utils.browserTabFocused != true
      Kandan.Helpers.Utils.notifyInTitle()
      Kandan.Plugins.Notifications.playAudioNotification('channel')
      Kandan.Plugins.Notifications.displayNotification(activityAttributes.user.username || activityAttributes.user.email, activityAttributes.content)

      @setPaginationData(activityAttributes.channel_id)


  @addNotification: (activityAttributes) ->
    $channelElements = $(".channel-activities")
    activityAttributes["created_at"] = new Date()
    for el in $channelElements
      $(el).append(@newActivityView(activityAttributes).render().el)
      @flushActivities($(el).closest(".channels-pane").data("channel-id"))
      @setPaginationData(activityAttributes.channel_id)


  @setPaginationState: (channelId, moreActivities, oldest) ->
    console.log "pagination element", moreActivities, @channelPaginationEl(channelId)
    if moreActivities == true
      # Only set pagination data if there are more activities. Otherwise is useless
      @channelPaginationEl(channelId).data("oldest", oldest.get("id"))

      @channelPaginationEl(channelId).show()
    else
      @channelPaginationEl(channelId).hide()

      # If there are no more messages we will unbind the scroll event
      @channelPane(channelId).unbind("scroll")

  @setPaginationData: (channelId) ->
    $oldestActivity = @channelActivitiesEl(channelId).find(".activity").first()
    if $oldestActivity.length != 0
      @channelPaginationEl(channelId).data("oldest", $oldestActivity.data("activity-id"))
