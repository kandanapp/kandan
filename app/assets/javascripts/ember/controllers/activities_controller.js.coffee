Kandan.ActivitiesController = Ember.ResourceController.create({
  resourceType: Kandan.Activity

  _resourceUrl: ()->
    "/channels/#{@get('channel').get('id')}/activities"
})