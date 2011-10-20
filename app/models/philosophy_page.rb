class PhilosophyPage < ActiveRecord::Base
  
  attr_accessible :published, :philosophy
  
  validates_presence_of :philosophy, :if => lambda { |mp| mp.published == true }
  validates_inclusion_of :published, :in => [true, false]
  has_one :profile
  belongs_to :user
  after_initialize :default_values


  private
    def default_values
      self.published ||= false
    end
end
