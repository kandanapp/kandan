$(document).ready ->
	$(document).on("click", ".waiting-for-approval-users .action.approve", {action : "approve"}, act_on_user)
	$(document).on("click", ".approved-users .action.suspend", {action : "suspend"}, act_on_user)
	$(document).on("click", ".approved-users .action.activate", {action : "activate"}, act_on_user)
	return

act_on_user = (obj)->
	user_id = $(this).closest("tr").data("user-id")
	action_taken = obj.data.action

	request = $.post '/admin/update_user',
		user_id: user_id
		action_taken: action_taken

	request.success (data) ->
			alert("done")
	
	request.error (data, textStatus, jqXHR) ->
			alert('error')
	
	return