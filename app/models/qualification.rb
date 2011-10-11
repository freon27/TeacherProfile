class Qualification < ActiveRecord::Base

  belongs_to :user
  belongs_to :experience_page
  has_many :subjects
  
  
  validates_presence_of :location
  validates_presence_of :date_from
  validates_presence_of :user
  validate :date_validation
  
  default_scope order('date_to DESC')
  
  private
    def date_validation
      errors.add(:date_from, "From date must be in the past") unless date_from && date_from < Date.today
      if date_from && date_to && date_to <= date_from
        errors.add(:date_to, "To date cannot be before the from date") 
      end
    end

end
