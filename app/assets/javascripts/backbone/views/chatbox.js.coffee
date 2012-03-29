class Kandan.Views.Chatbox extends Backbone.View

  template: JST['chatbox']
  tagName: 'div'
  className: 'chatbox'


  events:
    "keypress textarea": 'postMessageOnEnter'
    "click    button"  : 'postMessage'


  postMessageOnEnter: (event)->
    @postMessage() if event.keyCode== 13


  postMessage: (event)->
    $chatbox = $(@el).find('textarea')
    activity = new Kandan.Models.Activity({
      'content':    $chatbox.val(),
      'action':     'message',
      'channel_id': @channel.get('id')
    })

    activity.save({},{success: ()->
      $chatbox = $(@el).find('textarea')
    })

  render: ()->
    @channel = @options.channel
    $(@el).html(@template())
    @
