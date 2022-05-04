class UserMailer < ApplicationMailer
  default from: 'info@myvax.com'

  def send_email
    @name = "Yu Song"
    mail(to: "terrorgeek@gmail.com", subject: 'My name is Yu Song!')
  end
end
