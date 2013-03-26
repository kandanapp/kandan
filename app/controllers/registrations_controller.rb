class RegistrationsController < Devise::RegistrationsController
  before_filter :permissions

  def permissions
  	# Redefine the list of permissible parameters
  	devise_permitted [:first_name, :last_name, :email, :username, :password, :password_confirmation, :password_current]
  end

end
