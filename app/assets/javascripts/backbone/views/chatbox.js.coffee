class Kandan.Views.Chatbox extends Backbone.View

  template:  JST['chatbox']
  tagName:   'div'
  className: 'chatbox'


  events:
    "keypress .chat-input": 'postMessageOnEnter'
    "click    .post"      : 'postMessage'


  postMessageOnEnter: (event)->
    @postMessage(event) if event.keyCode== 13


  postMessage: (event)->
    $chatbox = $(event.target).parent().find(".chat-input")
    if $chatbox.val() == ""
      return false

    activity = new Kandan.Models.Activity({
      'content':    $chatbox.val(),
      'action':     'message',
      'channel_id': @channel.get('id')
    })

    activity.save({},{success: ()=>
      $chatbox.val("")
    })

  render: ()->
    @channel = @options.channel
    $(@el).html(@template())
    @
