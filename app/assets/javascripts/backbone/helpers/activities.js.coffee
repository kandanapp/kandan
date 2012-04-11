class Kandan.Helpers.Activities

  # TODO document this
  @ACTIVE_STATE: "ACTIVE"
  @HISTORY_STATE: "HISTORY"

  @buildFromBaseTemplate: (activity)->
    JST['activity_base']({activity: activity})

  @buildFromMessageTemplate: (activity)->
    JST['message']({activity: activity})