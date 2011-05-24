class Qualification < ActiveRecord::Base

  belongs_to :experience_page
  has_many :subjects
  validates_presence_of :location
  validates_presence_of :date_from
  validate :date_validation
  
  private
    def date_validation
      errors.add(:base, "From date must be in the past") unless date_from && date_from < Date.today
      if date_from && date_to && date_to <= date_from
        errors.add(:base, "To date cannot be before the from date") 
      end
    end

end
