class Kandan.Plugins.Notifications

  @widget_title: "Notifications"
  @widget_icon_url: "/assets/people_icon.png"
  @pluginNamespace: "Kandan.Plugins.Notifications"

  @popup_notifications_template: _.template '<div class="notification popup-notifications"></div>'
  @enable_popup_notifications_template = _.template '<a class="btn enable-popup-notifications" href="#"><i class="icon-check-empty"></i> Notifications</a>'
  @disable_popup_notifications_template = _.template '<a class="btn disable-popup-notifications" href="#"><i class="icon-check"></i> Notifications</a>'

  @sound_notifications_template: _.template '<div class="notification sound-notifications"></div>'
  @enable_sound_notifications_template = _.template '<a class="btn enable-sound-notifications" href="#"><i class="icon-check-empty"></i> Sounds</a>'
  @disable_sound_notifications_template = _.template '<a class="btn disable-sound-notifications" href="#"><i class="icon-check"></i> Sounds</a>'

  @render: ($el)->
    $notifications = $("<div class='notifications_list'></div>")
    $el.next().hide();

    @initPopupsNotificationsButtons()

    $el.html($notifications)

    @initWebkitNotifications($notifications)
    @initSoundNotifications($notifications)

    return


  @init: ()->
    Kandan.Widgets.register @pluginNamespace

  # HTML 5 Popups
  @initPopupsNotificationsButtons: ()->
    $(document).on 'click', '.enable-popup-notifications', => @enablePopupNotifications()
    $(document).on 'click', '.disable-popup-notifications', => @disablePopupNotifications()
    return

  @initWebkitNotifications: (container)->
    if Modernizr.notification
      container.append(@popup_notifications_template())

      if @webkitNotificationsEnabled()
        @enablePopupNotifications()
      else
        @disablePopupNotifications()

  @enablePopupNotifications: ()->
    if @webkitNotificationsEnabled()
      @popups_notifications_enabled = true
      $(".popup-notifications .enable-popup-notifications").remove()
      $(".notification.popup-notifications").append(@disable_popup_notifications_template())
    else
      if @webkitNotificationsDenied()
        # If the notifications have been denied we need to let the user know because there is nothing else we can do
        alert("It looks like notifications are denied for this page.\n\nUse your browser settings to allow notifications for this page.")
      else
        window.webkitNotifications.requestPermission(=> @onPopupNotificationsEnabled())

    return

  @disablePopupNotifications: ()->
    @popups_notifications_enabled = false

    $(".popup-notifications .disable-popup-notifications").remove()
    $(".notification.popup-notifications").append(@enable_popup_notifications_template())
    return

  # Returns true if notifications are enabled for this page.
  @webkitNotificationsEnabled: ()->
    window.webkitNotifications.checkPermission() == 0

  @webkitNotificationsDenied: ()->
    window.webkitNotifications.checkPermission() == 2

  # Callback when notifiactions are enabled for the first time
  @onPopupNotificationsEnabled: ()->
    if @webkitNotificationsEnabled()
      @enablePopupNotifications()
    
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

      notification.show();

  # HTML 5 sounds
  @initSoundNotifications: ($container)->
    if Modernizr.audio
      $container.append(@sound_notifications_template())
      @enableSoundNotifications()
      @initSoundNotificationsButtons()

  @initSoundNotificationsButtons: ()->
    $(document).on 'click', '.enable-sound-notifications', => @enableSoundNotifications()
    $(document).on 'click', '.disable-sound-notifications', => @disableSoundNotifications()
    return

  @enableSoundNotifications: ()->
    @sound_notifications_enabled = true
    $(".sound-notifications .enable-sound-notifications").remove()
    $(".notification.sound-notifications").append(@disable_sound_notifications_template())
    
    return

  @disableSoundNotifications: ()->
    @sound_notifications_enabled = false

    $(".sound-notifications .disable-sound-notifications").remove()
    $(".notification.sound-notifications").append(@enable_sound_notifications_template())
    return

  @playAudioNotification: ()->
    if @sound_notifications_enabled
      Kandan.Plugins.MusicPlayer.playAudioNotice()
    return