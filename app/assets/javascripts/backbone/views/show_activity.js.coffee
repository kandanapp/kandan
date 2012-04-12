class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'div'
  className: 'activity'

  render: ()->
    activity = @options.activity.toJSON()
    console.log("Rendering activity:")
    if activity.action != "message"
      @compiledTemplate = JST['user_notification']({activity: activity})
    else
      modifiedMessage = Kandan.Modifiers.process(activity, @options.state)
      if modifiedMessage != false
        @compiledTemplate = modifiedMessage
      else
        @compiledTemplate = Kandan.Helpers.Activities.buildFromMessageTemplate $.extend(activity, {content: _.escape(activity.content)})

    $(@el).data("activity-id", activity.id)
    $(@el).attr("id", "activity-#{activity.id}")
    $(@el).html(@compiledTemplate)

    #NOTE can only set the data after it's been appended to the DOM
    $(@el).find(".posted_at").data("timestamp", activity.created_at)
    @
