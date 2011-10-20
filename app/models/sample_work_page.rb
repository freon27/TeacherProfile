class SampleWorkPage < ActiveRecord::Base
  
  attr_accessible :published
  
  has_one :profile
  has_many :subject_areas
  validates_inclusion_of :published, :in => [true, false]
  belongs_to :user
  after_initialize :default_values
  
  private
    def default_values
      self.published ||= false
    end
end
