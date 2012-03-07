Kandan.ListChannelsView = Ember.View.extend({
  templateName: 'ember/templates/channels/list'
  channelsBinding: 'Kandan.ChannelsController'

  refreshList: ()->
    Kandan.ChannelsController.findAll()
})