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

  # TODO this is a helper method to register plugins
  # in the order required until we come up with plugin management
  register_plugins: ->
    plugins = [
      "UserList"
      ,"YouTubeEmbed"
      ,"ImageEmbed"
      ,"LinkEmbed"
      ,"Pastie"
      ,"Attachments"
      ,"MeAnnounce"
    ]

    for plugin in plugins
      Kandan.Plugins.register "Kandan.Plugins.#{plugin}"

  initBroadcasterAndSubscribe: ()->
    window.broadcaster = new Kandan.Broadcasters.FayeBroadcaster()
    window.broadcaster.subscribe "/channels/*" ##{channel.get('id')}


  initChatbox: ()->
    chatbox = new Kandan.Views.Chatbox()
    $(".main-area").append(chatbox.render().el)


  initTabs: ()->
    $('#channels').tabs({
      select: (event, ui)->
        $(document).data('active_channel_id',
          Kandan.Helpers.Channels.getChannelIdByTabIndex(ui.index))
        Kandan.Data.Channels.runCallbacks('change')
    })

    $("#channels").tabs 'option', 'tabTemplate', '''
      <li>
        <a href="#{href}">#{label}</a>
        <span class="ui-icon ui-icon-close">x</span>
      </li>
    '''

  initChatArea: (channels)->
    chatArea = new Kandan.Views.ChatArea({channels: channels})
    $(".main-area").html(chatArea.render().el)

  bindEventCallbacks: ()->
    $(document).bind 'changeData', (element, name, value)->
      Kandan.Data.ActiveUsers.runCallbacks('change') if name=="active_users"

  init: ->
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: (channelsCollection)=>
      @initBroadcasterAndSubscribe()
      @bindEventCallbacks()

      active_users = new Kandan.Collections.ActiveUsers()
      active_users.fetch({
        success: (activeUsersCollection)=>

          if not Kandan.Helpers.ActiveUsers.collectionHasCurrentUser(activeUsersCollection)
            activeUsersCollection.add([Kandan.Helpers.Users.currentUser()])

          Kandan.Helpers.ActiveUsers.setFromCollection(activeUsersCollection)
          Kandan.register_plugins()
          Kandan.Plugins.init_all()
          @initChatArea(channelsCollection)
          @initChatbox()
          @initTabs()
          Kandan.Widgets.init_all()
      })
    })
