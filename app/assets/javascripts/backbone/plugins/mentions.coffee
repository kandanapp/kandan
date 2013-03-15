# The mentions plugin takes care of highlighting the @useranme and passing the users to the atwho plugin.
# The show_activities addMessage method is the responsible of changing the look of a message body when a user is mentioned
class Kandan.Plugins.Mentions
  @options:
    regex: /@\S*/g

    template: _.template '''<span class="mention"><%= mention %></span>'''

  @init: ()->
    Kandan.Data.ActiveUsers.registerCallback "change", (data)=>
      @initUsersMentions(data.extra.active_users)

    Kandan.Modifiers.register @options.regex, (message, activity) =>
      for mention in message.match(@options.regex)
        replacement = @options.template({mention: mention})
        message = message.replace(mention, replacement)

      return message

  @initUsersMentions: (activeUsers)->
    users = _.map activeUsers, (user)->
      user.username
    users.push "all"
    $(".chat-input").atwho("(?:^|\\s)@", {data: users})
    return
