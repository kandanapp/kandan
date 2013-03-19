class Kandan.Helpers.Users
  @all: (options)->
    $(document).data("users")

  @setFromCollection: (collection)->
    $(document).data("users", collection.toJSON())

  @currentUser: ()->
    $.data(document, 'current-user')