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

    @faye_client.bind "transport:down", ()->
      console.log "Comm link to Cybertron is down!"

    @faye_client.bind "transport:up", ()->
      console.log "Comm link is up!"

    @faye_client.subscribe "/app/user_activities", (data)=>
      $(document).data('active_users', data.data.active_users)
      Kandan.Helpers.Channels.add_activity({
        user: data.data.user,
        action: data.event.split("#")[1]
      })

    @faye_client.subscribe "/app/channel_activities", (data)=>
      # TODO action makes way for channel rename to be added later
      console.log data
      Kandan.Helpers.Channels.deleteChannelById(data.channel.id) if data.action == "delete"


  subscribe: (channel)->
    subscription = @faye_client.subscribe channel, (data)=>
      console.log "faye", data
      Kandan.Helpers.Channels.add_activity(data)
    subscription.errback(()->
      alert "Oops! could not connect to the server"
    )
