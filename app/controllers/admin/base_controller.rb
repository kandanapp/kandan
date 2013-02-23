module Admin
  class BaseController < ApplicationController
   before_filter :authenticate_admin!

   private

   def authenticate_admin!
   	redirect_to root_url unless current_user.try(:is_admin?)
   end

  end
end