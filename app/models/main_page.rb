class MainPage < ActiveRecord::Base
  validates_presence_of :introduction, :if => lambda { |profile| profile.published == true }
  validates_presence_of :profile
  validates_inclusion_of :published, :in => [true, false]
  belongs_to :profile
  after_initialize :set_default_values
  
  private
    def set_default_values
      self.published ||= false
    end
end
