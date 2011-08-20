class Profile < ActiveRecord::Base
  
  LIMIT = 3
  
  belongs_to :user
  validates_inclusion_of :published, :in => [true, false]
  validates :user, :presence => true
  validates :name, :presence => true
  
  validates :url_suffix, :presence => true, :uniqueness => true
  validate  :validate_quota

  SUBJECTS = ['Primary', 'Design and Technology', 'English', 'Science']

  has_one :main_page
  has_one :philosophy_page
  has_one :experience_page
  has_one :sample_work_page
  
  has_many :subject_areas, :through => :sample_work_page
  
  after_save :create_pages

  def publish
    self.published = true
  end
  
  def unpublish
    self.published = false
  end

  def validate_quota
    return unless self.user
    if self.user.profiles(:reload).count >= LIMIT
      errors.add(:base, "You cannot have more than #{ LIMIT } profiles")
    end
  end
    
  private
    def create_pages
      !self.main_page       and self.create_main_page
      !self.philosophy_page and self.create_philosophy_page
      !self.experience_page and self.create_experience_page
      !self.sample_work_page and self.create_sample_work_page
    end
    
end
