module Admin::AdminHelper
	def user_registration_status user
		"<div class='#{user.registration_status}'>#{user.registration_status.titlecase}</div>".html_safe
	end

	def user_action user
		action, css = if user.registration_status.waiting_approval?
			["Approve", "btn-success"]
		elsif user.registration_status.suspended?
			["Activate", "btn-success"] 
		else
			["Suspend", "btn-danger"]
		end

		"<button class='action #{action.downcase} btn #{css}'>#{action}</button>".html_safe
	end

	def inline_style_hidden(hidden)
		"style=display:none;" if hidden
	end
end