class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :force_approved_account
  before_filter :redirect_suspended_account

  # Apply strong_parameters filtering before CanCan authorization
  # See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def force_approved_account
  	# We will redirect to the approval page if a user is signed in, is not an admin and is marked as waiting for approval
  	redirect = user_signed_in? && !current_user.is_admin? && current_user.registration_status.waiting_approval?

  	redirect_to approval_path if redirect
  end

  def redirect_suspended_account
  	# We will redirect to suspended if a user is signed in and its marked as suspended 
  	redirect = user_signed_in? && current_user.registration_status.suspended?
  	
  	redirect_to suspended_path if redirect
  end

end
