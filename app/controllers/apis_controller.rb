class ApisController < ApplicationController

  before_filter :authenticate_user!
  
  def active_users
    respond_to do |format|
      format.js { render :json => ActiveUsers.all }
    end
  end
end
