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

  options: ->
    @_options ?= $('body').data('kandan-config')

  # TODO this is a helper method to register plugins
  # in the order required until we come up with plugin management
  registerPlugins: ->
    plugins = [
      "UserList"
      ,"Pastie"
      ,"Mentions"
      ,"Notifications"
      ,"MusicPlayer"
      ,"YouTubeEmbed"
      ,"VimeoEmbed"
      ,"ImageEmbed"
      ,"LinkEmbed"
      ,"Attachments"
      ,"MeAnnounce"
      ,"Emoticons"
      ,"Emojis"
      ,"RgbColorEmbed"
      ,"HexColorEmbed"
    ]

    for plugin in plugins
      Kandan.Plugins.register "Kandan.Plugins.#{plugin}"

  registerAppEvents: ()->
    Kandan.Data.ActiveUsers.registerCallback "change", (data)->
      Kandan.Helpers.Channels.addActivity({
        user: data.entity,
        action: data.event.split("#")[1]
      })

    $(window).focus(->
      Kandan.Helpers.Utils.browserTabFocused = true
      Kandan.Helpers.Utils.resetUnreadActivities()
      Kandan.Plugins.Notifications?.resetUnreadActivities()
      $(document).attr('title', 'Kandan')
    )

    $(window).blur(->
      Kandan.Helpers.Utils.browserTabFocused = false
    )

  initBroadcasterAndSubscribe: ()->
    Kandan.broadcaster = eval "new Kandan.Broadcasters.#{@options().broadcaster.name}Broadcaster()"
    Kandan.broadcaster.subscribe "/channels/*"

  initTabs: ()->
    $('#kandan').tabs({
      select: (event, ui)->
        if ui.tab.id == "create_channel" then return false

        $(document).data('active-channel-id',
          Kandan.Helpers.Channels.getChannelIdByTabIndex(ui.index))

        #the need for the delay feels hacky to me.
        #It is there because the chat area has to render before scrollHeight can be determined.
        theId = Kandan.Helpers.Channels.getActiveChannelId()
        delay = (ms, func) -> setTimeout func, ms
        delay 1, -> Kandan.Helpers.Channels.scrollToLatestMessage(theId)
        Kandan.Data.Channels.runCallbacks('change')


      add: (event, ui) ->
        $('.header .ui-tabs-panel:last').detach().appendTo('#channels')
        $('#kandan').tabs('option', 'disabled', [])
        $('.header ul a').undelegate('cite.close_channel','click').
          delegate('cite.close_channel', 'click', window.tabViewGlobal.deleteChannel)
    })

    $("#kandan").tabs 'option', 'tabTemplate', '''
      <li>
        <a href="#{href}" class="show_channel">
          <span class="tab_right"></span>
          <span class="tab_left"></span>
          <span class="tab_content">
            <cite>#{label}</cite>
          </span>
        </a>
      </li>
    '''


  initChatArea: (channels)->
    chatArea = new Kandan.Views.ChatArea({channels: channels})
    $(".main-area").append(chatArea.render().el)

  onFetchChannels: (callback) ->
    (channels) ->
      Kandan.Helpers.Channels.setCollection(channels)
      callback()

  onFetchActiveUsers: (callback) ->
    (activeUsers) ->
      if not Kandan.Helpers.ActiveUsers.collectionHasCurrentUser(activeUsers)
        activeUsers.add([Kandan.Helpers.Users.currentUser()])
      Kandan.Helpers.ActiveUsers.setFromCollection(activeUsers)
      callback()

  onFetchUsers: (callback) ->
    (users) ->
      Kandan.Helpers.Users.setFromCollection(users)
      callback()

  registerUtilityEvents: ()->
    window.setInterval(=>
      for el in $(".posted_at")
        $(el).text (new Date($(el).data("timestamp"))).toRelativeTime(@options().now_threshold)
    , @options().timestamp_refresh_interval)

  init: ->
    asyncInitializers = [
      (callback) => new Kandan.Collections.Channels().fetch { success: @onFetchChannels(callback) }
      (callback) => new Kandan.Collections.ActiveUsers().fetch { success: @onFetchActiveUsers(callback) }
      (callback) => new Kandan.Collections.Users().fetch { success: @onFetchUsers(callback) }
    ]
    # The initializer callback should only be called after all
    # asynchronous initialization has been completed.
    syncInitializer = @callAfter asyncInitializers.length, =>
      @registerPlugins()
      Kandan.Plugins.initAll()
      @initChatArea(Kandan.Helpers.Channels.getCollection())
      @initTabs()
      Kandan.Widgets.initAll()
      Kandan.Helpers.Channels.scrollToLatestMessage()
      Kandan.Plugins.Mentions.initUsersMentions(Kandan.Helpers.ActiveUsers.all())
      Kandan.Plugins.Emojis.attachToChatbox()

    # Call the asynchronous initializers, passing the synchronous
    # initializer in as the callback to execute after all asynchrnous
    # initialization is complete.
    _(asyncInitializers).each (f) -> f.call(@, syncInitializer)

    # The following intiialization routines don't require deferred
    # initialization and can be executed immediately.
    @registerUtilityEvents()
    @initBroadcasterAndSubscribe()
    @registerAppEvents()

  # Create a function that is fired only after it has been attempted
  # `limit` times.
  callAfter: (limit, callback) ->
    finishedCalls = 0
    -> callback() if ++finishedCalls == limit
