class Kandan.Broadcasters.FayeBroadcaster

  constructor: ()->
    @faye_client = new Faye.Client("/remote/faye")
    @faye_client.disable('websocket')
    authExtension = {
      outgoing: (message, callback)->
        if message.channel == "/meta/subscribe"
          message['ext'] = {
            auth_token: Kandan.Helpers.Users.currentUser().auth_token
          }
        callback(message)
    }
    @faye_client.addExtension(authExtension)

    @faye_client.bind "transport:down", ()->
      console.log "Comm link to Cybertron is down!"

    @faye_client.bind "transport:up", ()->
      console.log "Comm link is up!"

    @faye_client.subscribe "/app/activities", (data)=>
      [entityName, eventName] = data.event.split("#")
      @processEventsForUser(eventName, data) if entityName == "user"
      @processEventsForChannel(eventName, data) if entityName == "channel"
      @processEventsForAttachments(eventName, data) if entityName == "attachments"

  processEventsForAttachments: (eventName, data)->
    Kandan.Helpers.Channels.add_activity(data.entity, Kandan.Helpers.Activities.ACTIVE_STATE)
    Kandan.Data.Attachments.runCallbacks("change", data)

  processEventsForUser: (eventName, data)->
    if eventName.match(/connect/)
      $(document).data('active_users', data.extra.active_users)
      Kandan.Data.ActiveUsers.runCallbacks("change", data)

  processEventsForChannel: (eventName, data)->
    Kandan.Helpers.Channels.deleteChannelById(data.entity.id) if eventName == "delete"

    # TODO this has to be implemented
    Kandan.Helpers.Channels.renameChannelById(data.entity.id, data.entity.name) if data.eventName == "update"


  subscribe: (channel)->
    subscription = @faye_client.subscribe channel, (data)=>
      Kandan.Helpers.Channels.add_activity(data)
    subscription.errback((data)->
      console.log "error", data
      alert "Oops! could not connect to the server"
    )
