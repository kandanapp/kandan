class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'div'
  className: 'activity'

  render: ()->
    activity = @options.activity.toJSON()
    activity.content = _.escape(activity.content)
    activity.avatarUrl = Kandan.Helpers.Avatars.urlFor(@options.activity, {size: 30})

    switch activity.action
      when "message"
        activity.content =  Kandan.Modifiers.process(activity)
        @compiledTemplate = Kandan.Helpers.Activities.buildFromMessageTemplate activity
      when "upload"
        file_path = _.unescape(activity.content).split('?')[0].split('/')
        activity.filename = decodeURIComponent(file_path[file_path.length-1])
        @compiledTemplate = JST['user_notification']({activity: activity})
      else
        @compiledTemplate = JST['user_notification']({activity: activity})

    if activity.action == 'connect' or activity.action == 'disconnect'
      $(@el).addClass(activity.action)

    $(@el).data("activity-id", activity.id)
    if activity.action == "message"

      user_mention_regex = new RegExp("@#{Kandan.Helpers.Users.currentUser().username}\\b")
      all_mention_regex = new RegExp("@all")

      if activity.user.id == Kandan.Helpers.Users.currentUser().id
        $(@el).addClass("current_user")


      # Only fire mentions if we are not loading old messages
      if !@options.silence_mentions && (user_mention_regex.test(@compiledTemplate) || all_mention_regex.test(@compiledTemplate))
        $(@el).addClass("mentioned_user")
        Kandan.Plugins.Notifications?.playAudioNotification('attention')

    if activity.id == undefined
      $(@el).attr("id", "activity-c#{activity.cid}")
    else
      $(@el).attr("id", "activity-#{activity.id}")
    $(@el).html(@compiledTemplate)

    #NOTE can only set the data after it's been appended to the DOM
    $(@el).find(".posted_at").data("timestamp", activity.created_at)
    @
