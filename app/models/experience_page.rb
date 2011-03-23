class ExperiencePage < ActiveRecord::Base
  belongs_to :profile
  has_many :positions
  
  validates_presence_of :profile
  validates_inclusion_of :published, :in => [true, false]
  after_initialize :default_values
  
  private
    def default_values
      self.published ||= false
    end
end
