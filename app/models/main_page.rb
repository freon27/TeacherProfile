class MainPage < ActiveRecord::Base
  
  attr_accessible :published, :introduction
  
  has_one :profile, :dependent => :destroy
  belongs_to :user
  
  validates_presence_of :introduction, :if => lambda { |profile| profile.published == true }
  validates_inclusion_of :published, :in => [true, false]
  validates_presence_of :user
  
  after_initialize :set_default_values
  
  def html_introduction
    self.introduction ? BlueCloth::new(self.introduction).to_html : ''
  end
  
  private
    def set_default_values
      self.published ||= false
    end
end
