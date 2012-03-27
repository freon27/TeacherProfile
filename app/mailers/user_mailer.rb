class UserMailer < ActionMailer::Base
  default from: "freon27@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Teaching Profile")
  end 

end
