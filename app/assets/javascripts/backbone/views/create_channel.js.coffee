class Kandan.Views.CreateChannel extends Backbone.View

  template: _.template '''
    <input class="new_channel" type="text"/>
    <button>create</button>
  '''

  events:
    "click button": "create_channel"

  render: ()->
    $(@el).html(@template())
    @

  create_channel: (event)->
    # TODO check for valid values
    channel_name = $(".new_channel").val()
    channel = new Kandan.Models.Channel({name: channel_name})
    channel.save({}, {
      success: (model)=>
        channel_area = "#channels-#{model.get('id')}"
        $("#channels").tabs('add', channel_area, model.get('name'))
        view = new Kandan.Views.ListActivities({channel: model})

        $(channel_area).html($(view.render().el).html())
        $(channel_area).data('channel_id', model.get('id'))
    })
