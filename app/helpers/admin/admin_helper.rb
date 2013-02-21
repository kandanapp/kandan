module Admin::AdminHelper
	def user_status user
		"<div class='#{user.status}'>#{user.status}</div>".html_safe
	end

	def user_action user
		
	end
end