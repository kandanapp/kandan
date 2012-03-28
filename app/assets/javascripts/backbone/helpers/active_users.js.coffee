class Kandan.Helpers.ActiveUsers

  @all: (options)->
    $(document).data("active_users")

  @setFromCollection: (collection)->
    $(document).data("active_users", collection.toJSON())

  @collectionHasCurrentUser: (collection)->
    currentUser = Kandan.Helpers.Users.currentUser()
    for user in collection.models
      return true if user.get('id') == currentUser.id
    false