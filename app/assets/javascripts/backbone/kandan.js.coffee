#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Kandan =
  Models:      {}
  Collections: {}
  Views:       {}
  Routers:     {}
  init: ->
    # new Kandan.Routers.Main()
    # Backbone.history.start({pushState: true})
    chat_area = new Kandan.Views.ChatArea()
    $('.container').html(chat_area.render().el)
    # $('.container').append(chat_box)

$(document).ready ->
  Kandan.init()
