class Kandan.Views.ShowActivity extends Backbone.View

  tagName: 'p'
  className: 'activity'

  render: ()->
    if @options.activity.get('message')
      @template = JST['activity']
    else
      @template = JST['user_notification']

    $(@el).html(@template({activity: @options.activity}))
    @