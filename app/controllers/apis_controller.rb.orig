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
end