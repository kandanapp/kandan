# The mentions plugin takes care of highlighting the @useranme and passing the users to the atwho plugin.
# The show_activities addMessage method is the responsible of changing the look of a message body when a user is mentioned
class Kandan.Plugins.Mentions
  @options:
    regex: /@\S*/g

    template: _.template '''<span class="mention"><%= mention %></span>'''

  @init: ()->
  	Kandan.Data.ActiveUsers.registerCallback "change", (data)=>
      @initUsersMentions(data.extra.active_users)

    Kandan.Modifiers.register @options.regex, (message, state) =>
      for mention in message.content.match(@options.regex)
      	replacement = @options.template({mention: mention})
      	message.content = message.content.replace(mention, replacement)

      return Kandan.Helpers.Activities.buildFromMessageTemplate(message)	
      
  @initUsersMentions: (activeUsers)->
  	users = _.map activeUsers, (user)->
  		user.username
  	users.push "all"
  	$(".chat-input").atwho("@", {data: users})
	return
