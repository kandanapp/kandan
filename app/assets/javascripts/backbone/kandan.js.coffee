#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./helpers

window.Kandan =
  Models:       {}
  Collections:  {}
  Views:        {}
  Routers:      {}
  Helpers:      {}
  Broadcasters: {}
  Data:         {}
  Plugins:      {}

  init: ->
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: ()=>

      chat_area = new Kandan.Views.ChatArea({channels: channels})
      create_channel = new Kandan.Views.CreateChannel()
      # $(".create_channel").html create_channel.render().el

      # TODO move broadcast subscription to a helper
      # TODO change this to use the broadcaster from the settings
      # TODO set as global to debug. remove later.
      # TODO use wildcard channel names
      window.broadcaster = new Kandan.Broadcasters.FayeBroadcaster()
      window.broadcaster.subscribe "/channels/*" ##{channel.get('id')}

      $(document).bind 'changeData', (element, name, value)->
        if(name=="active_users")
          Kandan.Data.ActiveUsers.run_callbacks('change')

      active_users = new Kandan.Collections.ActiveUsers()
      active_users.fetch({
        success: ()=>
          # NOTE fix because the current user doesn't get the first event
          active_users.add([$(document).data('current_user')])
          $(document).data("active_users", active_users.toJSON())

          # NOTE init plugins so that modifiers are registered
          Kandan.Plugins.init_all()


          $(".main-area").html(chat_area.render().el)
          chatbox = new Kandan.Views.Chatbox()
          $(".main-area").append(chatbox.render().el)
          $('#channels').tabs({select: (event, ui)->
            $(document).data('active_channel_id',
              Kandan.Helpers.Channels.get_channel_id_from_tab_index(ui.index))
            console.log "channel changed to index", ui.index
            Kandan.Data.Channels.run_callbacks('change')
          })

          Kandan.Widgets.init_all()
      })
    })
