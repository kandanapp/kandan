class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :force_approved_account
  before_filter :redirect_suspended_account

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def force_approved_account
    # We will redirect to the approval page if a user is signed in, is not an admin and is marked as waiting for approval
    redirect = user_signed_in? && !current_user.is_admin? && current_user.registration_status.waiting_approval?
    if redirect
      flash[:notice] = "Your account needs to be approved by an administrator before you can start using the Kandan app."
      sign_out current_user
      new_user_session_path
    end
  end

  def redirect_suspended_account
    # We will redirect to suspended if a user is signed in and its marked as suspended 
    redirect = user_signed_in? && current_user.registration_status.suspended?
    if redirect
      flash[:notice] = "Sorry, the administrator of this site has suspended your account."
      sign_out current_user
      new_user_session_path
    end
  end

  private

  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.
  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
    end
  end
end
