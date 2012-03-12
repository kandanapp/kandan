class Kandan.Plugins.UserList
  @active_users: ()->
    console.log "active users", $(document).data("active_users")
    $(document).data("active_users") || []


  @render: ()->
    users = []
    for user in @active_users()
      users.push user.first_name
    $(".user_list").html(users.join ", ")

  @init: ()->
    console.log "user list plugin started"
    $('body').prepend($("<div class='user_list'></div>"))
    @render()
    $(document).bind 'changeData', (event, name, value)=>
      @render() if name == "active_users"


Kandan.Plugins.register "Kandan.Plugins.UserList"