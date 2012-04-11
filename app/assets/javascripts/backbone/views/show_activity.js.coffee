class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'div'
  className: 'activity'

  render: ()->
    activity = @options.activity.toJSON()
    activity.created_at = Kandan.Helpers.Utils.timeToString(new Date(activity.created_at))
    if activity.action != "message"
      @compiledTemplate = JST['user_notification']({activity: activity})
    else
      modifiedMessage = Kandan.Modifiers.process(activity, @options.state)
      if modifiedMessage != false
        @compiledTemplate = modifiedMessage
      else
        @compiledTemplate = Kandan.Helpers.Activities.buildFromMessageTemplate $.extend(activity, {content: _.escape(activity.content)})

    $(@el).data('activity_id', activity.id)
    $(@el).attr('id', "activity-#{activity.id}")
    $(@el).html(@compiledTemplate)
    @
