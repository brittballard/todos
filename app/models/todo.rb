class Todo < ActiveRecord::Base
  def user=(user)
    self.owner_email = user.email
  end

  def complete?
    completed_at.present?
  end
end
