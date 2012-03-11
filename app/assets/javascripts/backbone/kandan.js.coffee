#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Kandan =
  Models:       {}
  Collections:  {}
  Views:        {}
  Routers:      {}
  Helpers:      {}
  Broadcasters: {}
  init: ->
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: ()=>

      chat_area = new Kandan.Views.ChatArea({channels: channels})
      $('.container').html(chat_area.render().el)

      chatbox = new Kandan.Views.Chatbox()
      $('.container').append(chatbox.render().el)
      $('#channels').tabs()

      # TODO move broadcast subscription to a helper
      # TODO change this to use the broadcaster from the settings
      # TODO set as global to debug. remove later.
      window.broadcaster = new Kandan.Broadcasters.FayeBroadcaster()
      for channel in channels.models
        window.broadcaster.subscribe "/channels/#{channel.get('id')}"

    })


$(document).ready ->
  Kandan.init()
