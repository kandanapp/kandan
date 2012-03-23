class Kandan.Views.Chatbox extends Backbone.View

  template: JST['chatbox']
  tagName: 'div'
  className: 'chatbox-area'


  events:
    "keypress    .chatbox": 'post_message_on_enter'
    "click   .post-button": 'post_message'


  post_message_on_enter: (event)->
    @post_message() if event.keyCode== 13


  post_message: (event)->
    $chatbox = $(".chatbox")
    activity = new Kandan.Models.Activity({
      'content':    $chatbox.val(),
      'action':     'message',
      'channel_id': Kandan.Helpers.Channels.get_active_channel_id()
    })

    activity.save({},{success: ()->
      $(".chatbox").val("")
    })

  render: ()->
    $(@el).html(@template())
    @
