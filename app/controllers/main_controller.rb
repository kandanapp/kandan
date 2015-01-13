class MainController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    # TODO this isn't being used right now. use this for faster app
    @channels = Channel.includes(:activities => :user).all
  end

  def search
    minimum_query_length = 3

    if params[:query] and params[:query].length >= minimum_query_length
      @activities = Activity.includes(:user).where("LOWER(content) LIKE ?", "%#{params[:query]}%").limit(params[:limit] || 100).all
    end

    respond_to do |format|
      format.html
      format.json { render :json => @activities.to_json(:include => :user) }
    end
  end
end
