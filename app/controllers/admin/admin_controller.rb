module Admin
  class AdminController < BaseController

  	def index
  		@settings = Setting.my_settings
  		@all_users = User.find(:all, :conditions => ["id != ?", current_user.id])

  		# Note that this reject! will remove users from all_users in order to show users in 2 different tables
  		@waiting_for_approval_users = @all_users.reject!{|user| user.status.waiting_approval? } || []
  	end

  	def update

  		max_rooms = params[:setting][:max_rooms].to_i
  		public_site = params[:setting][:public_site] == "1"

  		Setting.set_values(:max_rooms => max_rooms, :public_site => public_site)

  		redirect_to :admin_root
  	end

  	def update_users

  	end
    
  end
end