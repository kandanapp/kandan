class MainController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @channels = Channel.all
  end
end
