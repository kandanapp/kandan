class ChannelsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # NOTE Eager loading doesn't respect limit
    @channels = Channel.find(:all)
    nested_channel_data = []

    # TODO this can be shortened
    @channels.each do |channel|
      activities = []
      more_activities = (channel.activities.count > Kandan::Config.options[:per_page])
      channel.activities.order('id DESC').includes(:user).page.each do |activity|
        activities.push activity.attributes.merge({
          :user => activity.user.as_json(:only => [:id, :ido_id, :email, :first_name, :last_name, :gravatar_hash, :active, :locale])
        })
      end

      nested_channel_data.push channel.attributes.merge({:activities => activities.reverse, :more_activities => more_activities})
    end
    
    respond_to do |format|
      format.json do
        render :text => nested_channel_data.to_json
      end
    end
  end

  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      respond_to do |format|
        format.json { render :json => @channel, :status => :created }
      end
    else
      respond_to do |format|
        format.json { render :json => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @channel = Channel.find params[:id]
    respond_to do |format|
      format.json { render :json => @channel }
    end
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(params[:channel])
      respond_to do |format|
        format.json { render :json => @channel, :status => :ok }
      end
    else
      respond_to do |format|
        format.json { render :json => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel = Channel.find params[:id]
    @channel.destroy if not @channel.id == 1
    respond_to do |format|
      format.json { render :json => nil, :status => :ok}
    end
  end
end
