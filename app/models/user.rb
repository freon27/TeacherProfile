class User < ActiveRecord::Base
  has_many :profiles
  include Clearance::User
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  password_regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{6,15}$/

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true
  validates :email,       :format => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
                          
  validates :password,    :format => { :with => password_regex },
                          :unless => Proc.new { |user| user.password.blank? }
end
