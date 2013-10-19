class Kandan.Views.ChannelNav extends Backbone.View
  template: JST['channel_nav']
  tagName: 'li'

  events:
    "click .close_channel": 'deleteChannel'
    "click  .show_channel": 'showChannel'

  render: ->
    @$el.html @template(channel: @options.channel)
    if @options.channel.isDestroyable()
      @$el.addClass 'destroyable'
      @$el.append ' <i class="icon-remove close_channel" title="Close channel"></i>'
    else
      @$el.addClass 'protected'
    @

  deleteChannel: ->
    @options.channel.destroy() if Kandan.Helpers.Channels.confirmDeletion()
    false

  showChannel: (event) ->
    $('.channels-pane, #channel_nav li').removeClass 'active'
    @$el.addClass 'active'
    @pane.$el.addClass 'active'
    $('body').removeClass('slide-right') if event

    $(document).data('active-channel-id', @options.channel.get('id'))

    #the need for the delay feels hacky to me.
    #It is there because the chat area has to render before scrollHeight can be determined.
    delay = (ms, func) -> setTimeout func, ms
    delay 1, => Kandan.Helpers.Channels.scrollToLatestMessage(@options.channel.get('id'))
    Kandan.Data.Channels.runCallbacks('change') if event
    false
