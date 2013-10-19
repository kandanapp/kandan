class Kandan.Views.ChatArea extends Backbone.View

  panes: []

  render: ->
    for channel in @options.channels.models
      pane = new Kandan.Views.ChannelPane(channel: channel)
      $(@el).append(pane.render().el)
      @panes.push(pane)
      pane.nav.showChannel() if @options.channels.models.indexOf(channel) == 0

    @$el.attr 'id', 'channels'
    @
