class ContactMailer < ApplicationMailer

 def send_contact_email(user_info)
  @email = ENV.fetch('SYSTEM_EMAIL')
  @user = user_info[:user]
  @name = user_info[:name]
  @message = user_info[:message]
  date = Time.now.strftime("%B %d, %Y, %A")
  subject = "New user method #{date}"
  mail(to: @email, subject: subject) 
 end 
 
end
