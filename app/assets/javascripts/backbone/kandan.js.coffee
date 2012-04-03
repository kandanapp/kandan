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

  initTabs: ()->
    $('#channels').tabs({
      create: (event, ui)->
        $('ul.ui-tabs-nav').css({top: $('.header').offset().top + "px"})
      select: (event, ui)->
        $(document).data('active_channel_id',
        Kandan.Helpers.Channels.getChannelIdByTabIndex(ui.index))
        Kandan.Data.Channels.runCallbacks('change')
    })

    $("#channels").tabs 'option', 'tabTemplate', '''
      <li>
        <span class="tab_right"></span>
        <span class="tab_left"></span>
        <span class="tab_content">
          <a href="#{href}">#{label}</a>
          <a href="#" class="ui-icon ui-icon-close">x</a>
        </span>
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
      Kandan.initTabs()
      Kandan.Widgets.initAll()

  setCurrentUser: ()->
    template = _.template '''
      <img src="http://gravatar.com/avatar/<%= gravatar_hash %>?s=25&d=http://bushi.do/images/profile.png"/> <%= name %>
    '''
    currentUser = Kandan.Helpers.Users.currentUser()
    $(".header .user").html template({
      gravatar_hash: currentUser.gravatar_hash,
      name: "#{currentUser.first_name} #{currentUser.last_name}"
    })

  init: ->
    @setCurrentUser()
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: (channelsCollection)=>
      @initBroadcasterAndSubscribe()
      @bindEventCallbacks()
      activeUsers = new Kandan.Collections.ActiveUsers()
      activeUsers.fetch({success: @onFetchActiveUsers(channelsCollection)})
    })
