#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Kandan =
  Models:      {}
  Collections: {}
  Views:       {}
  Routers:     {}
  Broadcasters: {}
  init: ->
    # Backbone.history.start({pushState: true})
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: ()=>

      chat_area = new Kandan.Views.ChatArea({channels: channels})
      $('.container').html(chat_area.render().el)

      chatbox = new Kandan.Views.Chatbox()
      $('.container').append(chatbox.render().el)

      # TODO move this to a helper
      # can also be done by checking the active tab in the post event in the Chatbox view
      $('#channels').tabs({
        select: (event, ui)->
          channel_id = $("#channels .ui-tabs-panel").eq("#{ui.index}").data('channel_id')
          console.log "set channelID to", channel_id
          # TODO move setting current channel ID to a seperate helper
          $('.chatbox').data('active_channel_id', channel_id)
      })

      # TODO move broadcast subscription to a helper
      # TODO change this to use the broadcaster from the settings
      # TODO set as global to debug. remove later.
      window.broadcaster = new Kandan.Broadcasters.FayeBroadcaster()
      for channel in channels.models
        window.broadcaster.subscribe "/channels/#{channel.get('id')}"

      # TODO move this to a helper
      $('.chatbox').data('active_channel_id',
        $("#channels .ui-tabs-panel").eq($('#channels').tabs('option', 'selected')).data('channel_id'))
    })


$(document).ready ->
  Kandan.init()
