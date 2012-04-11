class Kandan.Helpers.Users
  @currentUser: ()->
    $.data(document, 'current-user')