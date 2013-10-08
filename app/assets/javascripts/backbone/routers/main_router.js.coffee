class Kandan.Routers.Main extends Backbone.Router

  routes:
    '': 'index'

  index: ()->
    view = new Kandan.Views.ChatArea()
    $('#channels').replaceWith(view.render().el)
    $('.channels').tabs()
