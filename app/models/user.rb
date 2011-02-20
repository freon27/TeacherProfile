class User < ActiveRecord::Base
  include Clearance::User
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }
  password_regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{6,15}$/
  validates :password, :presence => true,
            :confirmation => true,
            :format => { :with => password_regex }
end
