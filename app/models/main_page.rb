class MainPage < ActiveRecord::Base
  has_one :profile
  belongs_to :user
  
  validates_presence_of :introduction, :if => lambda { |profile| profile.published == true }
  validates_inclusion_of :published, :in => [true, false]
  validates_presence_of :user
  
  after_initialize :set_default_values
  
  private
    def set_default_values
      self.published ||= false
    end
end
