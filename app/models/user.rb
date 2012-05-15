class User < ActiveRecord::Base
  
 
  
  attr_accessible :email, :first_name, :last_name, :password, :accepted_terms

  has_many :profiles, :dependent => :destroy, :order => 'name' 
  has_many :main_pages, :dependent => :destroy
  has_many :experience_pages, :dependent => :destroy
  has_many :philosophy_pages, :dependent => :destroy
  has_many :sample_work_pages, :dependent => :destroy
  has_many :subject_areas, :dependent => :destroy
  has_many :positions, :dependent => :destroy
  has_many :qualifications, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_many :subjects, :dependent => :destroy
  
  include Clearance::User
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  password_regex = /^.{6,15}$/
  
  validates_acceptance_of :accepted_terms, 
                          :on => :create, 
                          :allow_nil => false,
                          :message => 'You must accept the terms and conditions'
  validates :first_name,  :presence => true
  validates :last_name,   :presence => true
  validates :email,       :format => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
  validates_presence_of   :password, :on => :create
  validates :password,    :format => { :with => password_regex },
                          :on => :create                        
                         
  
  validates_presence_of :subscribed_until

  before_create :set_free_subscription

  def subscribed?
    self.subscribed_until > Time.now
  end
  
  def to_s
    "#{ self.first_name } #{ self.last_name }"
  end
  
  def forem_admin?
    1 #self.admin?
  end

  private
    def set_free_subscription
      self.subscribed_until = 1.week.from_now
    end
end
