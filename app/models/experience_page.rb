class ExperiencePage < ActiveRecord::Base
  has_one :profile
  has_many :positions
  has_many :qualifications
  
  validates_inclusion_of :publish_positions, :in => [true, false]
  validates_inclusion_of :publish_qualifications, :in => [true, false]
  after_initialize :default_values
  
  private
    def default_values
      self.publish_positions      ||= false
      self.publish_qualifications ||= false
    end
end
