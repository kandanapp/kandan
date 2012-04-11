class Kandan.Helpers.ActiveUsers

  @all: (options)->
    $(document).data("active-users")

  @setFromCollection: (collection)->
    $(document).data("active-users", collection.toJSON())

  @collectionHasCurrentUser: (collection)->
    currentUser = Kandan.Helpers.Users.currentUser()
    for user in collection.models
      return true if user.get('id') == currentUser.id
    false