class ActivitiesController < ApplicationController
  before_filter :authenticate_user_from_token!, :only => :create
  before_filter :authenticate_user!

  def index
    # TODO can be divided into two actions

    first_activity_id = 1
    if params[:oldest]
      activities = Channel.find(params[:channel_id]).
        activities.
        includes(:user).
        order('id DESC').
        where("id < ?", params[:oldest]).
        limit(Kandan::Config.options[:per_page])
    else
      activities = Channel.find(params[:channel_id]).
        activities.
        includes(:user).
        order('id DESC').
        limit(Kandan::Config.options[:per_page])
    end

    first_activity = Activity.order('id').where(:channel_id => params[:channel_id]).first
    first_activity_id = first_activity.id if not first_activity.nil?

    # NOTE if the action is accessed then there's definitely activities, so skip check for #first to be nil
    more_activities = first_activity_id < (activities.last.try(:id).presence || 1)

    activities.each { |a| a.user ||= User.deleted_user }

    respond_to do |format|
      format.json { render :text => {:activities => activities.reverse, :more_activities => more_activities }.to_json(:include => :user) }
    end
  end

  def create
    @activity = Channel.find(params[:channel_id]).activities.build(params[:activity])
    @activity.user_id = current_user.id if @activity.action == "message"

    respond_to do |format|
      if @activity.save
        format.json { render :json => @activity, :status => :created }
      else
        format.json { render :json => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @activity = Activity.find params[:id]
    respond_to do |format|
      format.html do
        render :inline => "<pre><%= @activity.content %></pre>", :content_type => 'text/html'
      end
      format.json { render :json => @activity }
    end
  end

end
