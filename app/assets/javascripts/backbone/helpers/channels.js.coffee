class Kandan.Helpers.Channels

  @channel_el: (channel_id)->
    $("#channels-#{channel_id}")

  @selected_tab: ()->
    $('#channels').tabs('option', 'selected')

  @get_active_channel_id: ()->
    $("#channels .ui-tabs-panel")
      .eq(@selected_tab())
      .data('channel_id')

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
    @channel_el(activity_attributes.channel_id)
      .append(@new_activity_view(activity_attributes).render().el)

  @add_notification: (activity_attributes)->
    $channel_elements = $("#channels .ui-tabs-panel")
    for el in $channel_elements
      $(el).append(@new_activity_view(activity_attributes).render().el)