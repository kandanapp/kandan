class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'div'
  className: 'activity'

  render: ()->
    activity = @options.activity.toJSON()
    activity.created_at = Kandan.Helpers.Utils.time_to_string(new Date(activity.created_at))
    console.log("Rendering activity:")
    console.log(activity)
    if activity.action != "message"
      @compiled_template = JST['user_notification']({activity: activity})
    else
      modified_message = Kandan.Modifiers.process(activity, @options.state)
      if modified_message != false
        @compiled_template = modified_message
      else
        @compiled_template = Kandan.Helpers.Activities.build_from_message_template $.extend(activity, {content: _.escape(activity.content)})

    $(@el).data('activity_id', activity.id)
    $(@el).attr('id', "activity-#{activity.id}")
    $(@el).html(@compiled_template)
    @
