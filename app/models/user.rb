class User < ActiveRecord::Base
  has_many :profiles
  has_many :main_pages
  has_many :experience_pages
  has_many :philosophy_pages
  has_many :sample_work_pages
  has_many :subject_areas
  has_many :positions
  has_many :qualifications
  has_many :projects 
  has_many :documents
  has_many :subjects
  
  include Clearance::User

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  password_regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{6,15}$/

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true
  validates :email,       :format => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
                          
  validates :password,    :format => { :with => password_regex },
                          :unless => Proc.new { |user| user.password.blank? }

  before_validation :set_free_subscription

  def subscribed?
    self.subscribed_until > Time.now
  end

  private
    def set_free_subscription
      self.subscribed_until = 1.week.from_now
    end
end
