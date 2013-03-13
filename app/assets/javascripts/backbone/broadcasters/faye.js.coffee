class Kandan.Broadcasters.FayeBroadcaster

  constructor: ()->
    endpoint = $('body').data('kandan-config').broadcaster.config.endpoint
    @fayeClient = new Faye.Client(endpoint)

    @fayeClient.disable('websocket')
    authExtension = {
      outgoing: (message, callback)->
        if message.channel == "/meta/subscribe"
          message['ext'] = {
            auth_token: Kandan.Helpers.Users.currentUser().auth_token
          }
        callback(message)
    }
    @fayeClient.addExtension(authExtension)

    @fayeClient.bind "transport:down", ()->
      console.log "Comm link to Cybertron is down!"

    @fayeClient.bind "transport:up", ()->
      console.log "Comm link is up!"

    @fayeClient.subscribe "/app/activities", (data)=>
      [entityName, eventName] = data.event.split("#")
      @processEventsForUser(eventName, data)        if entityName == "user"
      @processEventsForChannel(eventName, data)     if entityName == "channel"
      @processEventsForAttachments(eventName, data) if entityName == "attachments"

  processEventsForAttachments: (eventName, data)->
    Kandan.Helpers.Channels.addActivity(data.entity, Kandan.Helpers.Activities.ACTIVE_STATE)
    Kandan.Data.Attachments.runCallbacks("change", data)

  processEventsForUser: (eventName, data)->
    if eventName.match(/connect/)
      $(document).data('active-users', data.extra.active_users)
      Kandan.Data.ActiveUsers.runCallbacks("change", data)

  processEventsForChannel: (eventName, data)->
    Kandan.Helpers.Channels.deleteChannelById(data.entity.id) if eventName == "delete"
    Kandan.Helpers.Channels.createChannelIfNotExists(channel: data.entity, channel_id: data.entity.id) if eventName == "create"

    # TODO this has to be implemented
    Kandan.Helpers.Channels.renameChannelById(data.entity.id, data.entity.name) if data.eventName == "update"


  subscribe: (channel)->
    subscription = @fayeClient.subscribe channel, (data)=>
      Kandan.Helpers.Channels.addActivity(data, Kandan.Helpers.Activities.ACTIVE_STATE)
    subscription.errback((data)->
      console.log "error", data
      alert "Oops! could not connect to the server"
    )
