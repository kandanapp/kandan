class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'p'
  className: 'activity'


  render: ()->
    activity = @options.activity.toJSON()
    if activity.action != "message"
      @compiled_template = JST['user_notification']({activity: activity})
    else
      modifier = Kandan.Modifiers.process(activity, @options.state)
      if modifier != false
        @compiled_template = modifier
      else
        @compiled_template = Kandan.Helpers.Activities.build_from_message_template activity


    $(@el).html(@compiled_template)
    @