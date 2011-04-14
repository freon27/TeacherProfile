class PhilosophyPage < ActiveRecord::Base
  validates_presence_of :philosophy, :if => lambda { |mp| mp.published == true }
  validates_presence_of :profile
  validates_inclusion_of :published, :in => [true, false]
  belongs_to :profile
  after_initialize :default_values


  private
    def default_values
      self.published ||= false
    end
end
