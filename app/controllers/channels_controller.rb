class ChannelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_channel_by_name, :only => :show
  load_and_authorize_resource

  def index
    # NOTE Eager loading doesn't respect limit
    nested_channel_data = []

    # TODO this can be shortened
    @channels.each do |channel|
      activities = []
      more_activities = (channel.activities.count > Kandan::Config.options[:per_page])
      channel.activities.order('id DESC').includes(:user).page.each do |activity|
        activities.push activity.attributes.merge({
          :user => activity.user_or_deleted_user.as_json(:only => [:id, :email, :first_name, :last_name, :gravatar_hash, :active, :locale, :username, :avatar_url])
        })
      end

      nested_channel_data.push channel.attributes.merge({:activities => activities.reverse, :more_activities => more_activities})
    end
    
    respond_to do |format|
      format.json { render :text => nested_channel_data.to_json }
    end
  end

  def create
    @channel = Channel.new(params[:channel])
    @channel.user_id = current_user.id
    respond_to do |format|
      if @channel.save
        format.json { render :json => @channel, :status => :created }
      else
        format.json { render :json => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render :json => @channel }
    end
  end

  def update
    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.json { render :json => @channel, :status => :ok }
      else
        format.json { render :json => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel.destroy
    respond_to do |format|
      format.json { render :json => nil, :status => :ok}
    end
  end

  private
  def find_channel_by_name
    @channel = Channel.where("LOWER(name) = ?", params['id'].downcase).first
  end
end
