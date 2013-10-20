module Admin::AdminHelper
  def user_status_badge user
    klass = 'badge-success' if user.registration_status.active?

    klass = ['registration-status', 'badge', klass].compact * ' '

    content_tag(:span, user.registration_status.titlecase, class: klass)
  end

  def user_status_button user
    action, klass = if user.registration_status.waiting_approval?
      ["Approve", "btn-success"]
    elsif user.registration_status.suspended?
      ["Activate", "btn-success"]
    else
      ["Suspend", "btn-danger"]
    end

    klass = ['status-action', 'btn', 'btn-mini', action.downcase, klass] * ' '

    content_tag(:button, action, class: klass)
  end

  def user_admin_button user
    action_text, action_class, klass = if user.is_admin?
      ["Remove from administrators", 'revoke', 'btn-danger']
    else
      ["Make an administrator", 'grant', 'btn-success']
    end

    klass = ['admin-action', 'btn', 'btn-mini', action_class, klass] * ' '

    content_tag(:button, action_text, class: klass)
  end
end
