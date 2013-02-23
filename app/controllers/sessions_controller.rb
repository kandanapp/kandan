class SessionsController < Devise::SessionsController
  skip_filter :force_approved_account
  skip_filter :redirect_suspended_account
end
