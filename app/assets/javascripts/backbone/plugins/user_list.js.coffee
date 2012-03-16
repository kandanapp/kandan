class Kandan.Plugins.UserList

  @widget_title: "Users"
  @widget_name: "users"

  @render: ($el)->
    $users = $("<ul></ul>")

    for user in Kandan.Data.ActiveUsers.all()
      $users.append "<li>#{user.first_name} #{user.last_name}</li>"
    $el.html($users)


  @init: ()->
    Kandan.Widgets.register(@widget_name, "Kandan.Plugins.UserList")
    Kandan.Data.ActiveUsers.register_callback "change", ()=>
      Kandan.Widgets.render(@widget_name)

Kandan.Plugins.register "Kandan.Plugins.UserList"