SUSPEND_ACTION = "suspend"
ACTIVATE_ACTION = "activate"
APPROVE_ACTION = "approve"

GRANT_ACTION = "grant"
REVOKE_ACTION = "revoke"

DENY_BTN_CSS = "btn-danger"
ALLOW_BTN_CSS = "btn-success"

$(document).ready ->
	$(document).on("click", ".waiting-for-approval-users .status-action.approve", {action : APPROVE_ACTION }, act_on_user)
	$(document).on("click", ".approved-users .status-action.suspend", {action : SUSPEND_ACTION }, act_on_user)
	$(document).on("click", ".approved-users .status-action.activate", {action : ACTIVATE_ACTION }, act_on_user)

	$(document).on("click", ".approved-users .admin-action.grant", { action: GRANT_ACTION }, toggleAdminOnUser)
	$(document).on("click", ".approved-users .admin-action.revoke", { action: REVOKE_ACTION }, toggleAdminOnUser)

	return

act_on_user = (obj) ->
	$el = $(this)
	$user = $el.closest("li")

	user_id = $user.data("user-id")
	action_taken = obj.data.action

	request = $.post '/admin/update_user',
		user_id: user_id
		action_taken: action_taken

	request.success (data) ->
		# We will set the new and old css actions depending on the action that was taken because this method
		# is used by 3 different buttons
		if action_taken == SUSPEND_ACTION
			old_btn_class = SUSPEND_ACTION
			old_css_class = DENY_BTN_CSS
			new_btn_class = ALLOW_BTN_CSS
			new_css_class = ACTIVATE_ACTION
		else
			# Approve and activate will be almost the same except for the original css class
			if action_taken == ACTIVATE_ACTION
				old_css_class = ACTIVATE_ACTION
			else
				old_css_class = APPROVE_ACTION

			old_btn_class = ALLOW_BTN_CSS
			new_btn_class = DENY_BTN_CSS
			new_css_class = SUSPEND_ACTION

		btn_text = _.str.titleize(new_css_class)

		badge_class = 'badge-success' if data.registration_status == 'active'

		$user.find(".registration-status")
			.text(_.str.titleize(data.registration_status))
			.removeClass('badge-success')
			.addClass(badge_class)

		# Change the look of the buttons by removing and adding classes
		$el.text(btn_text).removeClass("#{old_btn_class} #{old_css_class}").addClass("#{new_btn_class} #{new_css_class}")

		# Check if the user was an approval. If so, move the user out of the waiting for approval table and add it to the approved table
		if action_taken == APPROVE_ACTION
			$user.remove()
			$(".approved-users .users").append($user)

			checkList $(".waiting-for-approval-users")
			checkList $(".approved-users")

			# Show the admin row that is hidden on the waiting for approval users table
			$user.find(".admin-action").show()

		return

	request.error (data, textStatus, jqXHR) ->
			alert('Something went wrong while trying to get change user status')

	return

toggleAdminOnUser = (obj) ->
	$el = $(this)
	$user = $el.closest("li")

	user_id = $user.data("user-id")

	action_taken = obj.data.action
	# checked = $el.prop("checked");

	full_name = $user.data("full-name")

	# Generate the message based on the check of the user admin flag
	message = if action_taken == GRANT_ACTION
	  "make #{full_name} an administrator?"
	else
	  "remove #{full_name} from the administrators?"

	message = "Are you sure " + message

	# Return if the user didnt confirm
	return unless confirm(message)

	request = $.post '/admin/toggle_admin',
		user_id: user_id

	request.success (data) ->
		if action_taken == GRANT_ACTION
		  action_text = "Remove from administrators"
		  old_class =	[GRANT_ACTION, ALLOW_BTN_CSS].join ' '
		  new_class =	[REVOKE_ACTION, DENY_BTN_CSS].join ' '
		else
		  action_text = "Make an administrator"
		  old_class =	[REVOKE_ACTION, DENY_BTN_CSS].join ' '
		  new_class =	[GRANT_ACTION, ALLOW_BTN_CSS].join ' '

		$el.text(action_text).removeClass(old_class).addClass(new_class)

		return

	request.error (data, textStatus, jqXHR) ->
		alert("Something went wrong while trying to make #{full_name} an administrator")
	return

# Toggles a list item that says there are no users if needed
checkList = ($container) ->
	$list = $container.find(".users")
	$no_user_el = $list.find(".no-users")

	if $list.find("li").length == 0
		$list.append '<li class="no-users">There are no users. Invite others to join Kandan!</li>'
	else
		$no_user_el.remove()

	return
