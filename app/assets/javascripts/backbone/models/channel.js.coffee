class Kandan.Models.Channel extends Backbone.Model
  urlRoot: '/channels'

  parse: (response)->
    @moreActivities = false
    if response.activities
      activities = new Kandan.Collections.Activities([], {channel_id: response.id})
      activities.add(response.activities)
      @activities = activities
      @moreActivities = response.more_activities
    response

  isDestroyable: ->
    current_user = _(Kandan.Helpers.Users.all()).find (u) ->
      u.id == Kandan.Helpers.Users.currentUser().id

    @get('id') != 1 && (current_user.is_admin || @get('user_id') == current_user.id)
