class Kandan.Models.User extends Backbone.Model
  urlRoot: '/users'

  initialize: ()->
    console.log "initialized user"