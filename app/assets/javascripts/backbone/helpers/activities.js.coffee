class Kandan.Helpers.Activities

  # TODO document this
  @ACTIVE_STATE: "ACTIVE"
  @HISTORY_STATE: "HISTORY"

  @build_from_base_template: (activity)->
    JST['activity_base']({activity: activity})

  @build_from_message_template: (activity)->
    JST['message']({activity: activity})