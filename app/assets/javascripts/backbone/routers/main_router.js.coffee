class Kandan.Routers.Main extends Backbone.Router

  routes:
    '': 'index'

  index: ()->
    view = new Kandan.Views.ChatArea()
    $('.container').html(view.render().el)
    $('.channels').tabs()
