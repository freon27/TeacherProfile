class UserMailer < ActionMailer::Base
  default from: "freon27@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Thank you for Registering")
  end 

end
