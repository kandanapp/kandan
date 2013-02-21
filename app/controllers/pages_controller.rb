class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => :about

  skip_filter :force_approved_account, :only => :approval
  skip_filter :redirect_suspended_account, :only => :suspended

  def approval
  end

  def suspended
  end

  def about
  end

end
