module Admin::AdminHelper
	def user_status user
		"<div class='#{user.status}'>#{user.status.titlecase}</div>".html_safe
	end

	def user_action user
		action, css = if user.status.waiting_approval?
			["Approve", "btn-success"]
		elsif user.status.suspended?
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