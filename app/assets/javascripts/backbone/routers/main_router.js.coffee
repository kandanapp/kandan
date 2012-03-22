class Kandan.Routers.Main extends Backbone.Router

  routes:
    '': 'index'

  index: ()->
    view = new Kandan.Views.ChatArea()
    $('.main-area').html(view.render().el)
    $('.channels').tabs()
