class Position < ActiveRecord::Base
  
  attr_accessible :location, :date_from, :date_to
  
  belongs_to :experience_page
  validates_presence_of :location
  validates_presence_of :date_from
  validate :date_from_validation
  validates_presence_of :user
  belongs_to :user
  
  private
    def date_from_validation
      errors.add(:date_from, "From date must be in the past") unless date_from && date_from < Date.today
    end
end
