class ChannelsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @channels = Channel.includes(:activities => :user).all
    respond_to do |format|
      format.json do
        render :json => @channels, :include => {:activities => {:include=>:user}}
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
