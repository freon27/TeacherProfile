class PhilosophyPage < ActiveRecord::Base
  validates_presence_of :philosophy, :if => lambda { |mp| mp.published == true }
  validates_inclusion_of :published, :in => [true, false]
  has_one :profile
  after_initialize :default_values


  private
    def default_values
      self.published ||= false
    end
end
