# -*- coding: utf-8 -*-
class AttachmentsController < ApplicationController

  before_filter :authenticate_user!

  # GET /attachments
  # GET /attachments.json
  def index
    @channel    = Channel.find_by_name(params[:channel_id])
    @attachments = @channel.attachments.order("created_at DESC")

    respond_to do |format|
      format.json { render :json => @attachments.to_json(:methods => :url) }
    end
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @channel    = Channel.find_by_name(params[:channel_id])
    @attachment = Attachment.new(params[:attachment])

    @attachment.user = current_user
    @attachment.channel = Channel.find_by_name(params[:channel_id])
    @attachment.file = params[:file]

    respond_to do |format|
      if @attachment.save
        format.html { }
        format.js
        format.json { render json: @attachment, status: :created }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find_by_name(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to attachments_url }
      format.json { head :ok }
    end
  end
end
