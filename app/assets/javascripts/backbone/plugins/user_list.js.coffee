class Kandan.Plugins.UserList

  @widget_title: "People"
  @widget_icon_url: "/assets/people_icon.png"
  @pluginNamespace: "Kandan.Plugins.UserList"

  @template: _.template '''
    <div class="user clearfix">  
      <img class="avatar" src="<%= avatarUrl %>"/>
      <span class="name"><%= name %></span>
      <% if(admin){ %>
          &nbsp;<span class="badge badge-important">Admin</span>
      <% } %>  
    </div>
  '''

  @render: ($el)->
    $users = $("<div class='user_list'></div>")
    $el.next().hide();

    for user in Kandan.Data.ActiveUsers.all()
      displayName   = null
      displayName   = user.username # Defaults to username
      displayName ||= user.email # Revert to user email address if that's all we have
      isAdmin       = user.is_admin

      $users.append @template({
        name: displayName,
        admin: isAdmin,
        avatarUrl: Kandan.Helpers.Avatars.urlFor(user, {size: 25})
      })
    $el.html($users)


  @init: ()->
    Kandan.Widgets.register @pluginNamespace
    Kandan.Data.ActiveUsers.registerCallback "change", ()=>
      Kandan.Widgets.render @pluginNamespace
