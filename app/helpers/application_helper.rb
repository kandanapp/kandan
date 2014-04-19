module ApplicationHelper
  def current_user_data
    current_user_data = {
      :id            => current_user.id,
      :first_name    => sanitize(current_user.first_name),
      :last_name     => sanitize(current_user.last_name),
      :email         => current_user.email,
      :username      => sanitize(current_user.username),
      :auth_token    => current_user.authentication_token,
      :gravatar_hash => current_user.gravatar_hash,
      :avatar_url    => current_user.avatar_url,
      :is_admin      => current_user.is_admin
    }
  end
end
