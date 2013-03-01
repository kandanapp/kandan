class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'div'
  className: 'activity'

  render: ()->
    activity = @options.activity.toJSON()
    activity.content = _.escape(activity.content)
    activity.avatarUrl = Kandan.Helpers.Avatars.urlFor(@options.activity, {size: 30})
    if activity.action != "message"
      @compiledTemplate = JST['user_notification']({activity: activity})
    else
      modifiedMessage = Kandan.Modifiers.process(activity, @options.state)
      if modifiedMessage != false
        @compiledTemplate = modifiedMessage
      else
        @compiledTemplate = Kandan.Helpers.Activities.buildFromMessageTemplate activity

    $(@el).data("activity-id", activity.id)
    if activity.action == "message"

      user_mention_regex = new RegExp("@#{Kandan.Helpers.Users.currentUser().username}\\b")
      all_mention_regex = new RegExp("@all")

      if activity.user.id == Kandan.Helpers.Users.currentUser().id
        $(@el).addClass("current_user")

      if user_mention_regex.test(@compiledTemplate) || all_mention_regex.test(@compiledTemplate)
        $(@el).addClass("mentioned_user")

    if activity.id == undefined
      $(@el).attr("id", "activity-c#{activity.cid}")
    else
      $(@el).attr("id", "activity-#{activity.id}")
    $(@el).html(@compiledTemplate)

    #NOTE can only set the data after it's been appended to the DOM
    $(@el).find(".posted_at").data("timestamp", activity.created_at)
    @
