class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => :about

  skip_filter :force_approved_account, :only => :approval
  skip_filter :redirect_suspended_account, :only => :suspended

  def approval
  	redirect_to(root_path) && return unless current_user.registration_status.waiting_approval?
  end

  def suspended
  	redirect_to(root_path) && return unless current_user.registration_status.suspended?
  end

  def about
  end

end
