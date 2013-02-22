$(document).ready ->
	$(document).on("click", ".waiting-for-approval-users .action.approve", {action : "approve" }, act_on_user)
	$(document).on("click", ".approved-users .action.suspend", {action : "suspend" }, act_on_user)
	$(document).on("click", ".approved-users .action.activate", {action : "activate" }, act_on_user)
	$(document).on("click", ".admin input[type='checkbox']", {}, toggelAdminOnUser)
	return

act_on_user = (obj)->
	$el = $(this)
	$row = $el.closest("tr")
	
	user_id = $row.data("user-id")
	action_taken = obj.data.action
	
	request = $.post '/admin/update_user',
		user_id: user_id
		action_taken: action_taken

	request.success (data) ->
		# We will set the new and old css actions depending on the action that was taken because this method
		# is used by 3 different buttons
		if action_taken == "suspend"
			old_btn_class = "suspend"
			old_css_class = "btn-danger"
			new_btn_class = "btn-success"
			new_css_class = "activate"
		else
			# Approve and activate will be almost the same except for the original css class 
			if action_taken == "activate"
				old_css_class = "activate"	
			else
				old_css_class = "approve"
			
			old_btn_class = "btn-success"
			new_btn_class = "btn-danger"
			new_css_class = "suspend"

		btn_text = _.str.titleize(new_css_class)

		$row.find("td.status").text(_.str.titleize(data.status))

		# Change the look of the buttons by removing and adding classes
		$el.text(btn_text).removeClass("#{old_btn_class} #{old_css_class}").addClass("#{new_btn_class} #{new_css_class}")

		# Check if the user was an approval. If so, move the user out of the waiting for approval table and add it to the approved table
		if action_taken == "approve"
			$row.remove()
			$(".approved-users table").show().append($row)

			toggleTableIfNeeded $(".waiting-for-approval-users")
			toggleTableIfNeeded $(".approved-users")

			# Show the admin row that is hidden on the waiting for approval users table
			$row.find("td.admin").show()

		return
	
	request.error (data, textStatus, jqXHR) ->
			alert('Something went wrong while trying to get change user status')
	
	return

toggelAdminOnUser = ()->
	$el = $(this)
	$row = $el.closest("tr")

	user_id = $row.data("user-id")

	checked = $el.prop("checked");

	full_name = $row.data("full-name")

	# Generate the message based on the check of the user admin flag
	message = if checked then "make #{full_name} an administrator?" else "remove #{full_name} from the administrators?"
	message = "Are you sure " + message

	# If the user didnt confirm then put the check back and return
	if(confirm(message) != true)
		$el.prop("checked", !checked);
		return

	request = $.post '/admin/toggle_admin',
		user_id: user_id

	request.success (data) ->
		alert("#{full_name} is now an administrator")
		return

	request.error (data, textStatus, jqXHR) ->
			alert("Something went wrong while trying to make #{full_name} an administrator")
			$el.prop("checked", !checked);
	return

# Toggles a table and the container that says there are no users if needed
toggleTableIfNeeded = ($container)->
	$table = $container.find("table")
	$no_user_el = $container.find(".js-no-users")

	if $table.find("tbody tr").length == 0
		$table.hide()
		$no_user_el.show()
	else
		$table.show()
		$no_user_el.hide()
	
	return
