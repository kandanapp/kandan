class Kandan.Plugins.AdvancedNotifications

  @widget_title: "Notifications+"
  @widget_icon_url: "/assets/people_icon.png"
  @pluginNamespace: "Kandan.Plugins.AdvancedNotifications"

  @popup_notifications_template: _.template '''
    <li class="notification advanced-popup-notifications">
      <label>
        <input type="checkbox"<% if(checked){ %> checked="checked"<% } %> class="switch"> Desktop notifications
        <span></span>
      </label>
    </li>
  '''

  @sound_notifications_template: _.template '''
    <li class="notification advanced-sound-notifications">
      <label>
        <input type="checkbox" checked="checked" class="switch"> Sounds
        <span></span>
      </label>
    </li>
  '''

  @fluid_notifications_template: _.template '''
    <li class="notification advanced-fluid-notifications">
      <label>
        <input type="checkbox" checked="checked" class="switch"> Fluid notifications
        <span></span>
      </label>
    </li>
  '''

  @render: ($el)->
    $notifications = $("<ul class='advanced_notifications_list'></ul>")
    $el.next().hide()

    @initPopupsNotificationsButtons()
    @initFluidNotificationsButtons()

    $el.html($notifications)

    @initFluidNotifications($notifications)
    @initWebkitNotifications($notifications)
    @initSoundNotifications($notifications)
    @initTargetChannelList($notifications)

  @init: ()->
    Kandan.Widgets.register @pluginNamespace

  # HTML 5 Popups
  @initPopupsNotificationsButtons: ()->
    $(document).on 'change', '.advanced-popup-notifications .switch', (e) =>
      if e.target.checked
        @enablePopupNotifications()
      else
        @disablePopupNotifications()

  @initWebkitNotifications: (container)->
    if Modernizr.notification && not window.fluid
      container.append @popup_notifications_template(checked: @webkitNotificationsEnabled())

      if @webkitNotificationsEnabled()
        @enablePopupNotifications()
      else
        @disablePopupNotifications()

  @enablePopupNotifications: ()->
    if @webkitNotificationsEnabled()
      @popups_notifications_enabled = true
    else
      if @webkitNotificationsDenied()
        # If the notifications have been denied we need to let the user know because there is nothing else we can do
        alert("It looks like notifications are denied for this page.\n\nUse your browser settings to allow notifications for this page.")
      else
        $('.advanced-popup-notifications .switch').prop 'checked', false
        window.webkitNotifications.requestPermission(=> @onPopupNotificationsEnabled())

  @disablePopupNotifications: ()->
    @popups_notifications_enabled = false

  # Returns true if notifications are enabled for this page.
  @webkitNotificationsEnabled: ()->
    window.webkitNotifications.checkPermission() == 0

  @webkitNotificationsDenied: ()->
    window.webkitNotifications.checkPermission() == 2

  # Callback when notifiactions are enabled for the first time
  @onPopupNotificationsEnabled: ()->
    if @webkitNotificationsEnabled()
      $('.advanced-popup-notifications .switch').prop 'checked', true
      @enablePopupNotifications()

  # Fluid notifications -- http://fluidapp.com
  @initFluidNotificationsButtons: ()->
    $(document).on 'change', '.advanced-fluid-notifications .switch', (e) =>
      if e.target.checked
        @enableFluidNotifications()
      else
        @disableFluidNotifications()

  @initFluidNotifications: (container)->
    if window.fluid
      container.append(@fluid_notifications_template())
      @enableFluidNotifications()

  @enableFluidNotifications: ()->
    @fluid_notifications_enabled = true

  @disableFluidNotifications: ()->
    @fluid_notifications_enabled = false

  # If you are wondering why the kandan icon is not displayed on OS X this is the reason:
  # If you try notifying users on MacOS Mountain Lion, using a custom notification icon, don't be surprised that the Web browser icon overrides the icon you defined.
  # Apple locked notification icons to the app icons (for instance Chrome icon).
  @displayTimeout: ()->
    3000

  @displayNotification: (sender, message, title)->
    if @popups_notifications_enabled && @webkitNotificationsEnabled()
      notification = window.webkitNotifications.createNotification('/assets/kandanlogo.png', "#{sender} says in #{title}:", message)
      notification.ondisplay = =>
        setTimeout (->
          notification.cancel()
          console.log "cancel"
        ), @displayTimeout()

      notification.onclick = ->
        window.focus()
        @cancel()
        return

      notification.show()

    if @fluid_notifications_enabled
      window.fluid.showGrowlNotification {
        title: "Kandan",
        description: "#{sender} says:\n\n#{message}",
        priority: 1,
        sticky: true,
        identifier: "kandan",
        #onclick: callbackFunc,
        icon: '/assets/kandanlogo.png'
      }
      window.fluid.dockBadge = Kandan.Helpers.Utils.unreadActivities
      window.fluid.requestUserAttention(false) # bounce once

  @resetUnreadActivities: ()->
    if @fluid_notifications_enabled
      window.fluid.dockBadge = null

  # HTML 5 sounds
  @initSoundNotifications: ($container)->
    if Modernizr.audio
      $container.append(@sound_notifications_template())
      @enableSoundNotifications()
      @initSoundNotificationsButtons()

  @initSoundNotificationsButtons: ()->
    $(document).on 'change', '.advanced-sound-notifications .switch', (e) =>
      if e.target.checked
        @enableSoundNotifications()
      else
        @disableSoundNotifications()

      console.log e.target, e.target.checked

  @enableSoundNotifications: ()->
    @sound_notifications_enabled = true

  @disableSoundNotifications: ()->
    @sound_notifications_enabled = false

  @playAudioNotification: (type)->
    if @sound_notifications_enabled and not @isPlaying
      @isPlaying = true
      setTimeout (=> @isPlaying = false), 1000
      Kandan.Plugins.MusicPlayer.playAudioNotice(type)

  @initTargetChannelList: (container)->
    channels = Kandan.Helpers.Channels.getCollection()
    html = "<li><ul class='channel_list'><li class='caption'>Receive notifications from ...</li>"
    for channel in channels.models
      html += "<li class='channel'><label><input type='checkbox' id='notification_channel_" + channel.id + "'checked>" + channel.attributes.name + "</label></li>"
    html += "</ul></li>"
    container.append(html)

  @channelNotificationEnabled: (channel_id)->
    !!$("#notification_channel_#{channel_id}:checked").val()
