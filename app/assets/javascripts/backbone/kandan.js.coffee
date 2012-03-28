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
  registerPlugins: ->
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
    window.broadcaster.subscribe "/channels/*"


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

  onFetchActiveUsers: (channels)=>
    return (activeUsers)=>
      if not Kandan.Helpers.ActiveUsers.collectionHasCurrentUser(activeUsers)
        activeUsers.add([Kandan.Helpers.Users.currentUser()])

      Kandan.Helpers.ActiveUsers.setFromCollection(activeUsers)
      Kandan.registerPlugins()
      Kandan.Plugins.initAll()
      Kandan.initChatArea(channels)
      Kandan.initChatbox()
      Kandan.initTabs()
      Kandan.Widgets.initAll()


  init: ->
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: (channelsCollection)=>
      @initBroadcasterAndSubscribe()
      @bindEventCallbacks()
      activeUsers = new Kandan.Collections.ActiveUsers()
      activeUsers.fetch({success: @onFetchActiveUsers(channelsCollection)})
    })
