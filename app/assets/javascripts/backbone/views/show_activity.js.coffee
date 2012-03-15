class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'p'
  className: 'activity'


  render: ()->
    activity = @options.activity.toJSON()
    if activity.action != "message"
      @compiled_template = JST['user_notification']({activity: activity})
    else
      modified_message = Kandan.Modifiers.process(activity, @options.state)
      if modified_message != false
        @compiled_template = modified_message
      else
        @compiled_template = Kandan.Helpers.Activities.build_from_message_template $.extend(activity, {content: _.escape(activity.content)})


    $(@el).html(@compiled_template)
    @