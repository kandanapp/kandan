class Kandan.Helpers.Users
  @currentUser: ()->
    $.data(document, 'current_user')