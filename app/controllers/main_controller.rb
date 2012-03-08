class MainController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @channels = Channel.includes(:activities => :user).all
  end
end
