class Kandan.Plugins.Notifications

  @widget_title: "Notifications"
  @widget_icon_url: "/assets/people_icon.png"
  @pluginNamespace: "Kandan.Plugins.Notifications"

  @popup_notifications_template: _.template '''
    <li class="notification popup-notifications">
      <label>
        <input type="checkbox"<% if(checked){ %> checked="checked"<% } %> class="switch"> Desktop notifications
        <span></span>
      </label>
    </li>
  '''

  @sound_notifications_template: _.template '''
    <li class="notification sound-notifications">
      <label>
        <input type="checkbox" checked="checked" class="switch"> Sounds
        <span></span>
      </label>
    </li>
  '''

  @fluid_notifications_template: _.template '''
    <li class="notification fluid-notifications">
      <label>
        <input type="checkbox" checked="checked" class="switch"> Fluid notifications
        <span></span>
      </label>
    </li>
  '''

  @render: ($el)->
    $notifications = $("<ul class='notifications_list'></ul>")
    $el.next().hide();

    @initPopupsNotificationsButtons()
    @initFluidNotificationsButtons()

    $el.html($notifications)

    @initFluidNotifications($notifications)
    @initWebkitNotifications($notifications)
    @initSoundNotifications($notifications)

    return


  @init: ()->
    Kandan.Widgets.register @pluginNamespace

  # HTML 5 Popups
  @initPopupsNotificationsButtons: ()->
    $(document).on 'change', '.popup-notifications .switch', (e) =>
      if e.target.checked
        @enablePopupNotifications()
      else
        @disablePopupNotifications()

    return

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
        $('.popup-notifications .switch').prop 'checked', false
        window.webkitNotifications.requestPermission(=> @onPopupNotificationsEnabled())

    return

  @disablePopupNotifications: ()->
    @popups_notifications_enabled = false

    return

  # Returns true if notifications are enabled for this page.
  @webkitNotificationsEnabled: ()->
    window.webkitNotifications.checkPermission() == 0

  @webkitNotificationsDenied: ()->
    window.webkitNotifications.checkPermission() == 2

  # Callback when notifiactions are enabled for the first time
  @onPopupNotificationsEnabled: ()->
    if @webkitNotificationsEnabled()
      $('.popup-notifications .switch').prop 'checked', true
      @enablePopupNotifications()

    return

  # Fluid notifications -- http://fluidapp.com
  @initFluidNotificationsButtons: ()->
    $(document).on 'change', '.fluid-notifications .switch', (e) =>
      if e.target.checked
        @enableFluidNotifications()
      else
        @disableFluidNotifications()

    return

  @initFluidNotifications: (container)->
    if window.fluid
      container.append(@fluid_notifications_template())
      @enableFluidNotifications()
    return

  @enableFluidNotifications: ()->
    @fluid_notifications_enabled = true
    return

  @disableFluidNotifications: ()->
    @fluid_notifications_enabled = false
    return

  # If you are wondering why the kandan icon is not displayed on OS X this is the reason:
  # If you try notifying users on MacOS Mountain Lion, using a custom notification icon, don't be surprised that the Web browser icon overrides the icon you defined.
  # Apple locked notification icons to the app icons (for instance Chrome icon).
  @displayNotification: (sender, message)->
    if @popups_notifications_enabled && @webkitNotificationsEnabled()
      notification = window.webkitNotifications.createNotification('/assets/kandanlogo.png', "#{sender} says:", message);
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
    return

  @resetUnreadActivities: ()->
    if @fluid_notifications_enabled
      window.fluid.dockBadge = null
    return

  # HTML 5 sounds
  @initSoundNotifications: ($container)->
    if Modernizr.audio
      $container.append(@sound_notifications_template())
      @enableSoundNotifications()
      @initSoundNotificationsButtons()

  @initSoundNotificationsButtons: ()->
    $(document).on 'change', '.sound-notifications .switch', (e) =>
      if e.target.checked
        @enableSoundNotifications()
      else
        @disableSoundNotifications()

      console.log e.target, e.target.checked

    return

  @enableSoundNotifications: ()->
    @sound_notifications_enabled = true

    return

  @disableSoundNotifications: ()->
    @sound_notifications_enabled = false

    return

  @playAudioNotification: (type)->
    if @sound_notifications_enabled and not @isPlaying
      @isPlaying = true
      setTimeout (=> @isPlaying = false), 1000
      Kandan.Plugins.MusicPlayer.playAudioNotice(type)
    return
