class Kandan.User extends Ember.Resource
  resourceUrl: '/users'

  full_name: Ember.computed(
    ()->
      "#{@get('first_name')} #{@get('last_name')}"
  )