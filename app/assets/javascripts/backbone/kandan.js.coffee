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

  registerAppEvents: ()->
    Kandan.Data.ActiveUsers.registerCallback "change", (data)->
      Kandan.Helpers.Channels.add_activity({
        user: data.entity,
        action: data.event.split("#")[1]
      })

    $(window).focus(->
      Kandan.Helpers.Utils.browserTabFocused = true
      Kandan.Helpers.Utils.resetUnreadActivities()
      $(document).attr('title', 'Kandan')
    )

    $(window).blur(->
      Kandan.Helpers.Utils.browserTabFocused = false
    )


  initBroadcasterAndSubscribe: ()->
    Kandan.broadcaster = new Kandan.Broadcasters.FayeBroadcaster()
    Kandan.broadcaster.subscribe "/channels/*"
    @registerAppEvents()

  initTabs: ()->
    $('#kandan').tabs({
      select: (event, ui)->
        $(document).data('active_channel_id',
        Kandan.Helpers.Channels.getChannelIdByTabIndex(ui.index))
        Kandan.Data.Channels.runCallbacks('change')
      add: (event, ui) ->
        $('.header .ui-tabs-panel:last').detach().appendTo('#channels')
        $('#kandan').tabs('option', 'disabled', [])
    })

    $("#kandan").tabs 'option', 'tabTemplate', '''
    <li>
    <a href="#{href}" class="show_channel">
      <span class="tab_right"></span>
      <span class="tab_left"></span>
      <span class="tab_content">
        <cite>#{label}</cite>
        <cite class="close_channel" title="close channel">x</cite>
      </span>
    </a>
    </li>
    '''

  initChatArea: (channels)->
    chatArea = new Kandan.Views.ChatArea({channels: channels})
    $(".main-area").html(chatArea.render().el)
    $(document).scrollTop($(document).height()+9000)


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
      <img src="http://gravatar.com/avatar/<%= gravatar_hash %>?s=25&d=http://bushi.do/images/profile.png"/><span><%= name %></span>
    '''
    currentUser = Kandan.Helpers.Users.currentUser()
    displayName =   "#{currentUser.first_name} #{currentUser.last_name}" if currentUser.first_name?
    displayName ||= currentUser.email
    $(".header .user").html template({
      gravatar_hash: currentUser.gravatar_hash,
      name: displayName
    })

  init: ->
    @setCurrentUser()
    channels = new Kandan.Collections.Channels()
    channels.fetch({success: (channelsCollection)=>
      @initBroadcasterAndSubscribe()
      activeUsers = new Kandan.Collections.ActiveUsers()
      activeUsers.fetch({success: @onFetchActiveUsers(channelsCollection)})
    })
