

class Profiles::ShowPresenter
  
  attr_accessor :profile
  
  def initialize(profile)
    profile or raise ArgumentError
    @profile = profile
  end
  
  def introduction
    @introduction ||= @profile.main_page.introduction ? RDiscount.new(@profile.main_page.introduction).to_html : ''
  end
  
  def philosophy
    @philosophy ||= @profile.philosophy_page.philosophy ? RDiscount.new(@profile.philosophy_page.philosophy).to_html : ''
  end
  
  def qualifications
    @qualifications ||= @profile.experience_page.qualifications
  end
  
  def positions 
    @positions ||= @profile.experience_page.positions
  end
    
end
