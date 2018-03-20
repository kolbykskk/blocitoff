module ApplicationHelper
  def username
    current_user.email.split('@').first
  end
end
