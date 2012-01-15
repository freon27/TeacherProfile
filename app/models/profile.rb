class Profile < ActiveRecord::Base
  
  MAX_PROFILES_LIMIT = 3
  SUBJECTS = ['Primary', 'Design and Technology', 'English', 'Science']
    
  has_attached_file :photo, :styles => { :medium => "200x200>"}, :convert_options => { :all => "-auto-orient" }
  validates_attachment_size :photo, :less_than=>2.megabytes
  validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  
  attr_accessible :name, :published, :url_suffix, :main_subject, :photo
  
  belongs_to :user
  validates_inclusion_of :published, :in => [true, false]
  validates_inclusion_of :main_subject, :in => SUBJECTS
  validates :user, :presence => true
  validates :name, :presence => true
  
  validates :url_suffix, :presence => true, :uniqueness => true
  validate  :validate_quota


  belongs_to :main_page, :dependent => :destroy
  belongs_to :philosophy_page, :dependent => :destroy
  belongs_to :experience_page, :dependent => :destroy
  belongs_to :sample_work_page, :dependent => :destroy  
  
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
    if self.user.profiles(:reload).count >= MAX_PROFILES_LIMIT
      errors.add(:base, "You cannot have more than #{ MAX_PROFILES_LIMIT } profiles")
    end
  end
    
  private
    def create_pages
      self.main_page or self.create_main_page
      self.main_page.user = self.user
      self.main_page.save!
      
      self.experience_page or self.create_experience_page
      self.experience_page.user = self.user
      self.experience_page.save!
      
      self.philosophy_page or self.create_philosophy_page
      self.philosophy_page.user = self.user
      self.philosophy_page.save!
      
      self.sample_work_page or self.create_sample_work_page
      self.sample_work_page.user = self.user
      self.sample_work_page.save!
    end
    
end
