class ApisController < ApplicationController
  before_filter :authenticate_user!
  
  def active_users
    respond_to do |format|
      format.json { render :json => ActiveUsers.all }
    end
  end

  def me
    respond_to do |format|
      format.json { render :json => current_user }
    end
  end

  def last_created_channel
    respond_to do |format|
      format.json { render :json => Channel.last }
    end
  end

  def add_user_to_channel
      if current_user.is_admin == true
        user_id = params[:user_channel].split(',')[0]
        channel_id = params[:user_channel].split(',')[1]
        user = User.find(user_id)
        if user.allowed_channels.split(',').include?(channel_id) == false
        user.active = true
        user.allowed_channels = user.allowed_channels.to_s + channel_id + ','
            if user.save
            respond_to do |format|
              format.json { render :json => user }
            end
          end
        else
          respond_to do |format|
            format.json { render :json => user }
          end
        end

      end
  end

  def remove_user_from_channel
    if current_user.is_admin == true
      user_id = params[:user_channel].split(',')[0]
      channel_id = params[:user_channel].split(',')[1]
      user = User.find(user_id)
      if user.allowed_channels.split(',').include?(channel_id) == true

        user.allowed_channels = user.allowed_channels.to_s.gsub(channel_id +',', '' )
        if user.save
          respond_to do |format|
            format.json { render :json => user }
          end
        end
      else
        respond_to do |format|
          format.json { render :json => user }
        end
      end

    end
  end


end