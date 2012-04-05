class Kandan.Helpers.Channels

  @options:
    autoScrollThreshold: 0.90
    maxActivities: 5

  # @replaceCreateButton: ()->
  #   $tabNav = $(".create_channel").parent().parent()
  #   $createButton = $(".create_channel").parent().html()
  #   $tabNav.find(".create_channel").parent().remove()
  #   $tabNav.append("<li>"+$createButton+"</li>")

  @pastAutoScrollThreshold: (channelId)->
    currentPosition     = @currentScrollPosition channelId
    totalHeight         = $(document).height() - $(window).height()
    scrollPercentage    = (currentPosition) / (totalHeight)
    scrollPercentage > @options.autoScrollThreshold

  @scrollToLatestMessage: (channelId)->
    console.log("scrolling to last message");
    $(document).scrollTop($(document).height()+9000)

  @currentScrollPosition: (channelId)->
    console.log("current scroll position");
    $(document).scrollTop()

  @channel_activities_el: (channelId)->
    $("#channel-activities-#{channelId}")

  @channel_pagination_el: (channelId)->
    $("#channels-#{channelId} .pagination")

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
    reply = confirm("Really delete the channel?")
    return reply


  @flushActivities: (channelId)->
    $channelActivities = $("#channel-activities-#{channelId}")
    if $channelActivities.children().length == @options.maxActivities + 1
      oldest = $channelActivities.children().first().data("activity_id")
      $channelActivities.children().first().remove()
      $channelActivities.prev().data("oldest", oldest)


  @confirmAndDeleteChannel: (channel, tabIndex)->
    return false if @confirmDeletion() == false
    channel.destroy({success: ()=>
      $("#kandan").tabs("remove", tabIndex)
    })


  @getChannelIdByTabIndex: (tabIndex)->
    $("#channels .ui-tabs-panel")
      .eq(tabIndex)
      .data('channel_id')

  @getTabIndexByChannelId: (channelId)->
    $("#channels-#{channelId}").prevAll("div").length

  @deleteChannelById: (channelId)->
    if @channelExists(channelId)
      tabIndex = @getTabIndexByChannelId(channelId)
      @deleteChannelByTabIndex(tabIndex, true)

  @deleteChannelByTabIndex: (tabIndex, deleted)->
    # gotcha, 0 index being passed a natural index from the html views
    deleted = deleted || false
    channelId = @getChannelIdByTabIndex(tabIndex)
    if channelId == 'undefined'
      throw "NO CHANNEL ID";
    channel = new Kandan.Models.Channel({id: channelId})
    return @confirmAndDeleteChannel(channel, tabIndex) if not deleted


  @channelExists: (channelId)->
    return true if $("#channels-#{channelId}").length > 0
    false


  @createChannelArea: (channel)->
    channelArea = "#channels-#{channel.get('id')}"
    totalTabs = $("#kandan").tabs("length")

    $createTab = $(".create_channel").parents('li').detach()
    $("#kandan").tabs('add', channelArea, "#{channel.get("name")}", totalTabs)
    $createTab.appendTo('ul.ui-tabs-nav')
    view = new Kandan.Views.ChannelPane({channel: channel})
    view.render $(channelArea)
    $(channelArea).data('channel_id', channel.get('id'))


  @new_activity_view: (activityAttributes)->
    activity = new Kandan.Models.Activity(activityAttributes)
    activityView  = new Kandan.Views.ShowActivity({activity: activity})
    return activityView

  @createChannelIfNotExists: (activityAttributes)->
    if activityAttributes.channel && (not @channelExists(activityAttributes.channel_id))
      @createChannelArea(new Kandan.Models.Channel(activityAttributes.channel))


  @add_activity: (activityAttributes, state)->
    @createChannelIfNotExists(activityAttributes)

    if activityAttributes.channel_id
      @add_message(activityAttributes, state)
    else
      @add_notification(activityAttributes)

    channelId = activityAttributes.channel_id || @getActiveChannelId()
    @scrollToLatestMessage(channelId) if @pastAutoScrollThreshold(channelId)


  @add_message: (activityAttributes, state)->
    @channel_activities_el(activityAttributes.channel_id)
      .append(@new_activity_view(activityAttributes).render().el)
    @set_pagination_data(activityAttributes.channel_id)
    @flushActivities(activityAttributes.channel_id)


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
