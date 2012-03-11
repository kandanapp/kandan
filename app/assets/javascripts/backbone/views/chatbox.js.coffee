class Kandan.Views.Chatbox extends Backbone.View

  template: JST['chatbox']
  tagName: 'div'
  className: 'chatbox-area'

  events:
    "keypress .chatbox": 'postMessage'

  postMessage: (event)->

    if event.keyCode== 13
      $chatbox = $(".chatbox")

      activity = new Kandan.Models.Activity({
        'content':    $chatbox.val(),
        'action':     'message',
        'channel_id': Kandan.Helpers.Channels.get_active_channel_id()
      })

      activity.save({},{success: ()->
        console.log "posted! enjoy your day"
      })


  render: ()->
    $(@el).html(@template())
    @
