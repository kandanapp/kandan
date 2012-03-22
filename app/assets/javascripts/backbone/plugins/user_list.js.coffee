class Kandan.Plugins.UserList

  @widget_title: "People"
  @widget_name: "users"
  @plugin_namespace: "Kandan.Plugins.UserList"

  @render: ($el)->
    $users = $("<ul></ul>")

    for user in Kandan.Data.ActiveUsers.all()
      $users.append "<li>#{user.first_name} #{user.last_name}</li>"
    $el.html($users)


  @init: ()->
    Kandan.Widgets.register @plugin_namespace
    Kandan.Data.ActiveUsers.register_callback "change", ()=>
      Kandan.Widgets.render @plugin_namespace

Kandan.Plugins.register "Kandan.Plugins.UserList"