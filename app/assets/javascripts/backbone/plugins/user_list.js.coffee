class Kandan.Plugins.UserList

  @widget_title: "People"
  @widget_icon_url: "/assets/people_icon.png"
  @pluginNamespace: "Kandan.Plugins.UserList"

  @template: _.template '''
    <div class="user clearfix">
      <img class="avatar" src="http://gravatar.com/avatar/<%= gravatarHash %>?s=25&d=https://cloudfuji.com/images/profile.png"/>
      <span class="name"><%= name %></span>
    </div>
  '''

  @render: ($el)->
    $users = $("<div class='user_list'></div>")
    $el.next().hide();

    for user in Kandan.Data.ActiveUsers.all()
      displayName   = null
      displayName   = "#{user.first_name} #{user.last_name}" if user.first_name?
      displayName ||= user.email # Default to user email address if that's all we have

      $users.append @template({
        name: displayName,
        gravatarHash: user.gravatar_hash
      })
    $el.html($users)


  @init: ()->
    Kandan.Widgets.register @pluginNamespace
    Kandan.Data.ActiveUsers.registerCallback "change", ()=>
      Kandan.Widgets.render @pluginNamespace
