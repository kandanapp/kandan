# -*- coding: utf-8 -*-
class AttachmentsController < ApplicationController

  before_filter :authenticate_user!
  protect_from_forgery :except => :create

  # GET /attachments
  # GET /attachments.json
  def index
    @channel     = Channel.find(params[:channel_id])
    @attachments = @channel.attachments.order("created_at DESC")

    respond_to do |format|
      format.json { render :json => @attachments.to_json(:methods => :url) }
    end
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @channel    = Channel.find(params[:channel_id])
    @attachment = Attachment.new(params[:attachment])

    @attachment.user_id = current_user.id
    @attachment.channel_id = @channel.id
    @attachment.file = params[:file]

    respond_to do |format|
      if @attachment.save( validate: false )
        format.json { render json: @attachment, status: :created }
      else
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find_by_name(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
