class UserObserver < ActiveRecord::Observer

  def after_save(user)
    if defined?(ActiveUsers)
      ::ActiveUsers.update_user(user) if user.first_name_changed? or user.last_name_changed?
    end
  end
  
end
