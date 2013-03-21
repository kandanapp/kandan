class Kandan.Views.PaginatedActivities extends Backbone.View

  tagName: 'div'
  className: 'paginated-activities'
  template: JST['paginated_activities']

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
