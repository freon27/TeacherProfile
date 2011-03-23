class Position < ActiveRecord::Base
  belongs_to :experience_page
  validates_presence_of :location
  validates_presence_of :date_from
  validate :date_from_validation
  
  private
    def date_from_validation
      errors.add(:base, "From date must be in the past") unless date_from && date_from < Date.today
    end
end
