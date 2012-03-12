class Kandan.Broadcasters.FayeBroadcaster

  constructor: ()->
    @faye_client = new Faye.Client("/remote/faye")
    @faye_client.disable('websocket')
    auth_extension = {
      outgoing: (message, callback)->
        if message.channel == "/meta/subscribe"
          # TODO move fetching auth token to a helper
          message['ext'] = {auth_token: $.data(document, 'current_user').auth_token}
        callback(message)
    }
    @faye_client.addExtension(auth_extension)

  subscribe: (channel)->
    console.log "Subscribing to #{channel}"
    @faye_client.subscribe channel, (data)=>
      console.log data.user
      Kandan.Helpers.Channels.add_activity(data)
      console.log data.user.first_name, "says", data.content
