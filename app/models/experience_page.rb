class ExperiencePage < ActiveRecord::Base
  
  attr_accessible :publish_positions, :publish_qualifications
  
  has_one :profile
  has_many :positions
  has_many :qualifications
  belongs_to :user
  
  validates_inclusion_of :publish_positions, :in => [true, false]
  validates_inclusion_of :publish_qualifications, :in => [true, false]
  validates_presence_of :user
  after_initialize :default_values
  
  private
    def default_values
      self.publish_positions      ||= false
      self.publish_qualifications ||= false
    end
end
