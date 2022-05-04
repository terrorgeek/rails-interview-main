class UserMailerJob < ApplicationJob
  queue_as :eagleforce

  def perform(*args)
    UserMailer.send_email.deliver_later
  end
end
