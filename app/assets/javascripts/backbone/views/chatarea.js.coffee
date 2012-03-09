class Kandan.Views.ChatArea extends Backbone.View

  template: JST['chatarea']
  # className: 'channels'

  initialize: ()->
    @channels = new Kandan.Collections.Channels()

  render: ->
    @channels.fetch({success: ()=>
      $(@el).html(@template({channels: @channels}))
      for channel in @channels.models
        view = new Kandan.Views.ListActivities({channel: channel})
        $(@el).append(view.render().el)
      $('#channels').tabs()
    })
    $(@el).attr('id', 'channels')
    @