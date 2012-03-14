class Kandan.Plugins.UserList

  @widget_name: "user_list"

  @render: ($el)->
    console.log "rendering user list"
    $users = $("<ul></ul>")

    for user in Kandan.Data.ActiveUsers.all()
      $users.append "<li>#{user.first_name} #{user.last_name}</li>"
    $el.html($users)

  @init: ()->
    console.log "init user plugin"
    Kandan.Widgets.register(@widget_name, "Kandan.Plugins.UserList")
    Kandan.Data.ActiveUsers.register_callback "change", ()=>
      Kandan.Widgets.render(@widget_name)

Kandan.Plugins.register "Kandan.Plugins.UserList"