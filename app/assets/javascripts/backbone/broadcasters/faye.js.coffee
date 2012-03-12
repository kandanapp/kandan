class Kandan.Broadcasters.FayeBroadcaster

  constructor: ()->
    @faye_client = new Faye.Client("/remote/faye")
    @faye_client.disable('websocket')
    auth_extension = {
      outgoing: (message, callback)->
        if message.channel == "/meta/subscribe"
          message['ext'] = {
            auth_token: Kandan.Helpers.Users.current_user().auth_token
          }
        callback(message)
    }
    @faye_client.addExtension(auth_extension)
    @faye_client.subscribe "/app/activities", (data)=>
      console.log "activities", data
      Kandan.Helpers.Channels.add_activity({
        user: data.data.user,
        action: data.event.split("#")[1]
      })


  subscribe: (channel)->
    console.log "Subscribing to #{channel}"
    subscription = @faye_client.subscribe channel, (data)=>
      Kandan.Helpers.Channels.add_activity(data)
    subscription.errback ()->
      console.log "Oops! could not connect to the server"
