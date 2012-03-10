class Kandan.Views.ChatArea extends Backbone.View

  template: JST['chatarea']
  # className: 'channels'


  render: ->
    $(@el).html(@template({channels: @options.channels}))
    for channel in @options.channels.models
      view = new Kandan.Views.ListActivities({channel: channel})
      $(@el).append(view.render().el)
    $(@el).attr('id', 'channels')
    @