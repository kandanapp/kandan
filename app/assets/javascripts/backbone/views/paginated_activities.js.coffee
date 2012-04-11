class Kandan.Views.PaginatedActivities extends Backbone.View

  tagName: 'div'
  className: 'paginated-activities'
  template: JST['paginated_activities']

  events:
    "click .pagination": "loadMoreActivities"

  setPagination: ()->
    oldestActivityId = 0
    if @channel.activities and @channel.activities.models.length > 0
      oldestActivityId = _.first(@channel.activities.models).get("id")

    $(@el).find(".pagination").data("oldest", oldestActivityId)


  render: ()->
    @channel = @options.channel
    $(@el).html @template()
    @setPagination()

    $(@el).find(".pagination").hide() if @channel.moreActivities != true
    listActivitiesView = new Kandan.Views.ListActivities({channel: @channel})
    $(@el).append listActivitiesView.render().el
    @


  loadMoreActivities: ()->
    oldest = $(@el).find(".pagination").data("oldest")
    activities = new Kandan.Collections.Activities([], {channel_id: @channel.get("id")})
    activities.fetch({
      data: { oldest: oldest },
      success: (collection)=>
        for activity in collection.models.reverse()
          activityView = new Kandan.Views.ShowActivity({activity: activity})
          $(@el).find(".channel-activities").prepend(activityView.render().el)

        Kandan.Helpers.Channels.setPaginationState(
          collection.channelId,
          collection.moreActivities,
          _.last(collection.models).get("id")
        )
    })
