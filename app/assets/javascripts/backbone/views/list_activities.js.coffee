class Kandan.Views.ListActivities extends Backbone.View
  tagName: 'div'
  # className: 'activities'

  events: {
    "click .pagination": "load_more_activities"
  }

  render: ()->
    @channel = @options.channel
    $activities_list = $("<div class='channel-activities'></div>").attr('id', "channel-activities-#{@channel.get('id')}")
    for activity in @channel.activities.models
      activity_view = new Kandan.Views.ShowActivity({activity: activity, state: Kandan.Helpers.Activities.HISTORY_STATE})
      $activities_list.append(activity_view.render().el)

    $pagination = $("<div class='pagination'>previous messages</div>")
    oldest = 0
    oldest = @channel.activities.toJSON()[0].id if @channel.activities.toJSON()[0]

    $pagination.data('oldest', oldest)
    $(@el).append($pagination)
    $(@el).find(".pagination").hide() if @channel.more_activities == false
    $(@el).append($activities_list)
    $(@el).attr('id', "channels-#{@channel.get('id')}")
    $(@el).data('channel_id', @channel.get('id'))
    @

  load_more_activities: ()->
    oldest = $(@el).find(".pagination").data('oldest')
    activities = new Kandan.Collections.Activities([], {channel_id: @channel.get('id')})
    activities.fetch({
      data: { oldest: oldest },
      success: (collection)=>
        _.each collection.models.reverse(), (activity)=>
          activity_view = new Kandan.Views.ShowActivity({activity: activity})
          $(@el).find(".channel-activities").prepend(activity_view.render().el)
        Kandan.Helpers.Channels.set_pagination_state(
          collection.channel_id,
          collection.more_activities,
          _.last(collection.models).get('id')
        )
    })