module Admin::AdminHelper
	def user_status user
		"<div class='#{user.status}'>#{user.status}</div>".html_safe
	end

	def user_action user
		action = if user.status.waiting_approval?
			"Approve"
		elsif user.status.suspended?
			"Activate"
		else
			"Suspend"
		end

		"<button class='action #{action.downcase}'>#{action}</button>".html_safe
	end
end