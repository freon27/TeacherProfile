class Profile < ActiveRecord::Base
  
  LIMIT = 3
  
  belongs_to :user
  validates_inclusion_of :published, :in => [true, false]
  validates :user, :presence => true
  validates :name, :presence => true
  
  validates :url_suffix, :presence => true, :uniqueness => true
  validate  :validate_quota

  SUBJECTS = ['Primary', 'Design and Technology', 'English', 'Science']

  belongs_to :main_page
  belongs_to :philosophy_page
  belongs_to :experience_page
  belongs_to :sample_work_page
  
  has_many :subject_areas, :through => :sample_work_page
  
  before_validation :create_pages, :on => :create

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
      self.main_page or self.create_main_page
      self.experience_page or self.create_experience_page
      self.philosophy_page or self.create_philosophy_page
      self.sample_work_page or self.create_sample_work_page
    end
    
end
