class Kandan.Helpers.Channels

  @channel_el: (channel_id)->
    $("#channels-#{channel_id}")

  @selected_tab: ()->
    $('#channels').tabs('option', 'selected')

  @get_active_channel_id: ()->
    $("#channels .ui-tabs-panel")
      .eq(@selected_tab())
      .data('channel_id')

  @add_activity: (activity_attributes)->
    activity = new Kandan.Models.Activity(activity_attributes)
    activity_view  = new Kandan.Views.ShowActivity({activity: activity})
    @channel_el(activity.get('channel_id'))
      .append(activity_view.render().el)