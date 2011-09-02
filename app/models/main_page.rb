class MainPage < ActiveRecord::Base
  validates_presence_of :introduction, :if => lambda { |profile| profile.published == true }
  validates_inclusion_of :published, :in => [true, false]
  has_one :profile
  after_initialize :set_default_values
  
  private
    def set_default_values
      self.published ||= false
    end
end
