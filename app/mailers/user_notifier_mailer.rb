class UserNotifierMailer < ApplicationMailer
  default :from => 'LibraryApp@example.com'

  # to send email to members to notify room booking
  def send_signup_email(email)
    mail( :to =>email,
          :subject => 'Room Booked')
  end
end
