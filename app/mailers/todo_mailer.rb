class TodoMailer < ActionMailer::Base
  default from: 'do_not_reply@todo.com'
  def completed_todos(to_email)
    mail(to: to_email)
  end
end
