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
      ,"Mentions"
      ,"Notifications"
      ,"MusicPlayer"
      ,"YouTubeEmbed"
      ,"VimeoEmbed"
      ,"ImageEmbed"
      ,"LinkEmbed"
      ,"Pastie"
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
    @registerAppEvents()

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


  onFetchUsers: (callback) ->
    (users) =>
      Kandan.Helpers.Users.setFromCollection(users)
      callback()

  onFetchActiveUsers: (callback) ->
    (activeUsers) =>
      if not Kandan.Helpers.ActiveUsers.collectionHasCurrentUser(activeUsers)
        activeUsers.add([Kandan.Helpers.Users.currentUser()])
      Kandan.Helpers.ActiveUsers.setFromCollection(activeUsers)
      callback()

  registerUtilityEvents: ()->
    window.setInterval(=>
      for el in $(".posted_at")
        $(el).text (new Date($(el).data("timestamp"))).toRelativeTime(@options().now_threshold)
    , @options().timestamp_refresh_interval)

  init: ->
    initializer = @createCallback 3, =>
      Kandan.registerPlugins()
      Kandan.Plugins.initAll()
      Kandan.initChatArea(Kandan.Helpers.Channels.getCollection())
      Kandan.initTabs()
      Kandan.Widgets.initAll()
      Kandan.Helpers.Channels.scrollToLatestMessage()
      Kandan.Plugins.Mentions.initUsersMentions(Kandan.Helpers.ActiveUsers.all())
      Kandan.Plugins.Emojis.attachToChatbox()
      return

    new Kandan.Collections.Channels().fetch {
      success: @onFetchChannels(initializer)
    }
    new Kandan.Collections.ActiveUsers().fetch {
      success: @onFetchActiveUsers(initializer)
    }
    new Kandan.Collections.Users().fetch {
      success: @onFetchUsers(initializer)
    }
    @registerUtilityEvents()
    @initBroadcasterAndSubscribe()

  createCallback: (limit, callback)->
    finishedCalls = 0
    -> callback() if ++finishedCalls == limit

  onFetchChannels: (callback) ->
    (channels) =>
      Kandan.Helpers.Channels.setCollection(channels)
      callback()
