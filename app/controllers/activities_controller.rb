class ActivitiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @activities = Channel.find(params[:channel_id]).activities.includes(:user).all
    respond_to do |format|
      format.json { render :json => @activities, :include => :user }
    end
  end

  def create
    @activity = Channel.find(params[:channel_id]).activities.build(params[:activity])
    if @activity.save
      respond_to do |format|
        format.json { render :json => @activity, :status => :created }
      end
    else
      respond_to do |format|
        format.json { render :json => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @activity = Activity.find params[:id]
    respond_to do |format|
      format.json { render :json => @activity }
    end
  end

end
