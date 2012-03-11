class Kandan.Helpers.Channels

  @get_active_channel_id: ()->
    $("#channels .ui-tabs-panel")
      .eq($('#channels')
        .tabs('option', 'selected'))
      .data('channel_id')