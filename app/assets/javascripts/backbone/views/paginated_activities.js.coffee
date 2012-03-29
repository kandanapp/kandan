class Kandan.Views.PaginatedActivities extends Backbone.View
  
  tagName: 'div'
  className: 'paginated-activities'
  template: JST['paginated_activities']

  events:
    "click .pagination": "load_more_activities"

  setPagination: ()->
    oldestActivityId = 0
    if @channel.activities and @channel.activities.models.length > 0
      oldestActivityId = _.last(@channel.activities.models).get('id')

    $(@el).find(".pagination").data('oldest', oldestActivityId)


  render: ()->
    @channel = @options.channel
    $(@el).html @template()
    @setPagination()
    
    listActivitiesView = new Kandan.Views.ListActivities({channel: @channel})
    $(@el).append listActivitiesView.render().el
    @

    
  load_more_activities: ()->
    oldest = $(@el).find(".pagination").data('oldest')
    activities = new Kandan.Collections.Activities([], {channel_id: @channel.get('id')})
    activities.fetch({
      data: { oldest: oldest },
      success: (collection)=>
        for activity in collection.models.reverse()
          activityView = new Kandan.Views.ShowActivity({activity: activity})
          $(@el).find(".channel-activities").prepend(activityView.render().el)

        Kandan.Helpers.Channels.set_pagination_state(
          collection.channel_id,
          collection.more_activities,
          _.last(collection.models).get('id')
        )
    })
  