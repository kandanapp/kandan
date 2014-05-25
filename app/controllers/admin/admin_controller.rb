module Admin
  class AdminController < BaseController

  	def index
  		@settings = Setting.my_settings
  		@all_users = User.find(:all, :conditions => ["id != ?", current_user.id])

  		@waiting_for_approval_users = []
  		@approved_users = []

  		# Iterate over the array to get approved and non-approved users
  		@all_users.each{|user| user.registration_status.waiting_approval? ? @waiting_for_approval_users.push(user) : @approved_users.push(user) }
  	end

  	def update

  		max_rooms = params[:setting][:max_rooms].to_i
      public_site = params[:setting][:public_site] == "1"
  		disable_conn_disconn_activity = params[:setting][:disable_conn_disconn_activity] == "1"

  		Setting.set_values(:max_rooms => max_rooms, :public_site => public_site, :disable_conn_disconn_activity => disable_conn_disconn_activity)

  		redirect_to :admin_root
  	end

  	def update_user
  		user_id = params[:user_id]
  		action = params[:action_taken].to_s

  		user = User.find(user_id)

  		case action
  		when "activate", "approve"
  			user.activate!
  		when "suspend"
  			user.suspend!
  		end

  		render :json => user, :status => 200
  	end

  	def toggle_admin
  		user_id = params[:user_id]

  		user = User.find(user_id)

  		user.is_admin = !user.is_admin?

  		user.save!

  		render :json => user, :status => 200
  	end

  end
end
