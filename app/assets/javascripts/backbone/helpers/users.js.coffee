class Kandan.Helpers.Users
  @current_user: ()->
    $.data(document, 'current_user')