class Kandan.Helpers.Channels

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


  @new_activity_view: (activity_attributes)->
    activity = new Kandan.Models.Activity(activity_attributes)
    activity_view  = new Kandan.Views.ShowActivity({activity: activity})
    return activity_view


  @add_activity: (activity_attributes, state)->
    if activity_attributes.channel_id
      @add_message(activity_attributes, state)
    else
      @add_notification(activity_attributes)


  @add_message: (activity_attributes, state)->
    @channel_activities_el(activity_attributes.channel_id)
      .append(@new_activity_view(activity_attributes).render().el)
    @set_pagination_data(activity_attributes.channel_id)


  @add_notification: (activity_attributes)->
    $channel_elements = $(".channel-activities")
    for el in $channel_elements
      $(el).append(@new_activity_view(activity_attributes).render().el)


  @set_pagination_state: (channel_id, more_activities, oldest)->
    @channel_pagination_el(channel_id).data('oldest', oldest)
    if more_activities == true
      console.log "show pagination"
      @channel_pagination_el(channel_id).show()
    else
      console.log "hide pagination"
      @channel_pagination_el(channel_id).hide()


  @set_pagination_data: (channel_id)->
    $oldest_activity = @channel_activities_el(channel_id).find(".activity").first()
    if $oldest_activity.length != 0
      console.log "oldest activity id", $oldest_activity.data('activity_id')
      @channel_pagination_el(channel_id).data('oldest', $oldest_activity.data('activity_id'))
