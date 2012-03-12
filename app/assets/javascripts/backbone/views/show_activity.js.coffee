class Kandan.Views.ShowActivity extends Backbone.View
  template: JST['activity']

  tagName: 'p'
  className: 'activity'

  render: ()->
    $(@el).html(@template({activity: @options.activity}))
    @