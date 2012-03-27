class Kandan.Helpers.Channels

  @options:
    autoScrollThreshold: 0.90
    maxActivities: 10

  @replaceCreateButton: ()->
    $tabNav = $(".create_channel").parent().parent()
    $createButton = $(".create_channel").parent().html()
    $tabNav.find(".create_channel").parent().remove()
    $tabNav.append("<li>"+$createButton+"</li>")

  @pastAutoScrollThreshold: (channel_id)->
    currentPosition     = @currentScrollPosition channel_id
    totalHeight         = $(document).height() - $(window).height()
    scrollPercentage    = (currentPosition) / (totalHeight)
    scrollPercentage > @options.autoScrollThreshold

  @scrollToLatestMessage: (channel_id)->
    $("#channels-#{channel_id}").scrollTop(100000)

  @currentScrollPosition: (channel_id)->
    $("#channels-#{channel_id}").scrollTop()

  @channel_activities_el: (channel_id)->
    $("#channel-activities-#{channel_id}")

  @channel_pagination_el: (channel_id)->
    $("#channels-#{channel_id} .pagination")

  @get_channel_id_from_tab_index: (tab_index)->
    $("#channels .ui-tabs-panel")
      .eq(tab_index)
      .data('channel_id')

  @selected_tab: ()->
    $('#channels').tabs('option', 'selected')

  @get_active_channel_id: ()->
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

  @flushActivities: (channelID)->
    $channelActivities = $("#channel-activities-#{channelID}")
    if $channelActivities.children().length > @options.maxActivities
      oldest = $channelActivities.children().first().data("activity_id")
      $channelActivities.children().first().remove()
      $channelActivities.prev().data("oldest", oldest)

  @deleteChannel: (channelIndex)->
    channelID = @get_channel_id_from_tab_index(channelIndex)
    channel = new Kandan.Models.Channel({id: channelID})
    return false if @confirmDeletion() == false

    channel.destroy({success: ()=>
      $("#channels").tabs("remove", channelIndex)
    })

  @channel_not_exists: (channel_id)->
    $("#channels-#{channel_id}").length == 0


  @create_channel_area: (channel)->
    channel_area = "#channels-#{channel.get('id')}"
    totalTabs = $("#channels").tabs("length")

    $("#channels").tabs('add', channel_area, "#{channel.get("name")}", totalTabs)
    Kandan.Helpers.Channels.replaceCreateButton()
    view = new Kandan.Views.ListActivities({channel: channel})
    $(channel_area).html $(view.render().el).html()
    $(channel_area).data('channel_id', channel.get('id'))


  @new_activity_view: (activity_attributes)->
    activity = new Kandan.Models.Activity(activity_attributes)
    activity_view  = new Kandan.Views.ShowActivity({activity: activity})
    return activity_view


  @add_activity: (activity_attributes, state)->
    if activity_attributes.channel!=undefined && @channel_not_exists(activity_attributes.channel_id)
      @create_channel_area(new Kandan.Models.Channel(activity_attributes.channel))

    if activity_attributes.channel_id
      @add_message(activity_attributes, state)
    else
      @add_notification(activity_attributes)

    if activity_attributes.channel_id
      channel_id = activity_attributes.channel_id
    else
      channel_id = @get_active_channel_id()
    @scrollToLatestMessage(channel_id) if @pastAutoScrollThreshold(channel_id)

  @add_message: (activity_attributes, state)->
    @channel_activities_el(activity_attributes.channel_id)
      .append(@new_activity_view(activity_attributes).render().el)
    @set_pagination_data(activity_attributes.channel_id)
    # @flushActivities($(el).parent().data("channel_id"))


  @add_notification: (activity_attributes)->
    $channel_elements = $(".channel-activities")
    activity_attributes["created_at"] = new Date()
    for el in $channel_elements
      $(el).append(@new_activity_view(activity_attributes).render().el)
      @flushActivities($(el).parent().data("channel_id"))


  @set_pagination_state: (channel_id, more_activities, oldest)->
    @channel_pagination_el(channel_id).data('oldest', oldest)
    if more_activities == true
      @channel_pagination_el(channel_id).show()
    else
      @channel_pagination_el(channel_id).hide()


  @set_pagination_data: (channel_id)->
    $oldest_activity = @channel_activities_el(channel_id).find(".activity").first()
    if $oldest_activity.length != 0
      @channel_pagination_el(channel_id).data('oldest', $oldest_activity.data('activity_id'))
