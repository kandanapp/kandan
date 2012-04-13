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
    chatInput = $chatbox.val()
    return false if chatInput.trim().length==0

    activity = new Kandan.Models.Activity({
      'content':    chatInput,
      'action':     'message',
      'channel_id': @channel.get('id')
    })

    $chatbox.val("")
    Kandan.Helpers.Channels.addActivity(
      _.extend(activity.toJSON(), {cid: activity.cid, user: Kandan.Data.Users.currentUser()}, created_at: new Date()),
      Kandan.Helpers.Activities.ACTIVE_STATE,
      true
    )

    activity.save({},{success: (model, response)->
      $("#activity-c#{model.cid}").attr("id", "activity-#{model.get('id')}")
    })

  render: ()->
    @channel = @options.channel
    $(@el).html(@template())
    @
