class Kandan.Helpers.Channels

  @options:
    autoScrollThreshold: 0.90
    maxActivities: 10

  @replaceCreateButton: ()->
    $tabNav = $(".create_channel").parent().parent()
    $createButton = $(".create_channel").parent().html()
    $tabNav.find(".create_channel").parent().remove()
    $tabNav.append("<li>"+$createButton+"</li>")

  @pastAutoScrollThreshold: (channelId)->
    currentPosition     = @currentScrollPosition channelId
    totalHeight         = $(document).height() - $(window).height()
    scrollPercentage    = (currentPosition) / (totalHeight)
    scrollPercentage > @options.autoScrollThreshold

  @scrollToLatestMessage: (channelId)->
    $("#channels-#{channelId}").scrollTop(100000)

  @currentScrollPosition: (channelId)->
    $("#channels-#{channelId}").scrollTop()

  @channel_activities_el: (channelId)->
    $("#channel-activities-#{channelId}")

  @channel_pagination_el: (channelId)->
    $("#channels-#{channelId} .pagination")

  @getTabIndexByChannelId: (channelId)->
    $("#channels-#{channelId}").prev("div").length

  @getChannelIdByTabIndex: (tabIndex)->
    $("#channels .ui-tabs-panel")
      .eq(tabIndex)
      .data('channel_id')

  @selected_tab: ()->
    $('#channels').tabs('option', 'selected')

  @getActiveChannelId: ()->
    if $(document).data('active_channel_id') == undefined
      return $("#channels .ui-tabs-panel")
        .eq(@selected_tab())
        .data('channel_id')
    else
      return $(document).data('active_channel_id')

  @confirmDeletion: ()->
    confirmDeletion = confirm("Really delete the channel?")
    return false if confirmDeletion == false
    confirmAgain = confirm("Are you damn sure?")
    return confirmAgain

  @flushActivities: (channelId)->
    $channelActivities = $("#channel-activities-#{channelId}")
    if $channelActivities.children().length > @options.maxActivities
      oldest = $channelActivities.children().first().data("activity_id")
      $channelActivities.children().first().remove()
      $channelActivities.prev().data("oldest", oldest)

  @deleteChannelById: (channelId)->
    if @channelExists(channelId)
      tabIndex = @getTabIndexByChannelId(channelId)
      @deleteChannelByTabIndex(tabIndex, true)

  @confirmAndDeleteChannel: (channel, tabIndex)->
    return false if @confirmDeletion() == false
    channel.destroy({success: ()=>
      $("#channels").tabs("remove", tabIndex)
    })

  @deleteChannelByTabIndex: (tabIndex, deleted)->
    deleted = deleted || false
    channelId = @getChannelIdByTabIndex(tabIndex)
    channel = new Kandan.Models.Channel({id: channelId})
    return @confirmAndDeleteChannel(channel, tabIndex) if not deleted
    $("#channels").tabs("remove", tabIndex)

  @channelExists: (channelId)->
    return true if $("#channels-#{channelId}").length > 0
    false


  @create_channel_area: (channel)->
    channel_area = "#channels-#{channel.get('id')}"
    totalTabs = $("#channels").tabs("length")

    $("#channels").tabs('add', channel_area, "#{channel.get("name")}", totalTabs)
    Kandan.Helpers.Channels.replaceCreateButton()
    view = new Kandan.Views.ListActivities({channel: channel})
    $(channel_area).html $(view.render().el).html()
    $(channel_area).data('channel_id', channel.get('id'))


  @new_activity_view: (activityAttributes)->
    activity = new Kandan.Models.Activity(activityAttributes)
    activityView  = new Kandan.Views.ShowActivity({activity: activity})
    return activityView


  @add_activity: (activity_attributes, state)->
    if activity_attributes.channel!=undefined && (not @channelExists(activity_attributes.channel_id))
      @create_channel_area(new Kandan.Models.Channel(activity_attributes.channel))

    if activity_attributes.channel_id
      @add_message(activity_attributes, state)
    else
      @add_notification(activity_attributes)

    if activity_attributes.channel_id
      channelId = activity_attributes.channel_id
    else
      channelId = @getActiveChannelId()
    @scrollToLatestMessage(channelId) if @pastAutoScrollThreshold(channelId)


  @add_message: (activityAttributes, state)->
    @channel_activities_el(activityAttributes.channel_id)
      .append(@new_activity_view(activityAttributes).render().el)
    @set_pagination_data(activityAttributes.channel_id)
    # @flushActivities($(el).parent().data("channel_id"))


  @add_notification: (activityAttributes)->
    $channelElements = $(".channel-activities")
    activityAttributes["created_at"] = new Date()
    for el in $channelElements
      $(el).append(@new_activity_view(activityAttributes).render().el)
      @flushActivities($(el).parent().data("channel_id"))

  @set_pagination_state: (channelId, moreActivities, oldest)->
    @channel_pagination_el(channelId).data('oldest', oldest)
    if moreActivities == true
      @channel_pagination_el(channelId).show()
    else
      @channel_pagination_el(channelId).hide()


  @set_pagination_data: (channel_id)->
    $oldest_activity = @channel_activities_el(channel_id).find(".activity").first()
    if $oldest_activity.length != 0
      @channel_pagination_el(channel_id).data('oldest', $oldest_activity.data('activity_id'))
