

class Profiles::ShowPresenter
  
  extend ActiveSupport::Memoizable
  attr_accessor :profile
  
  def initialize(profile)
    profile or raise ArgumentError
    @profile = profile
  end
  
  def introduction
    @profile.main_page.introduction ? RDiscount.new(@profile.main_page.introduction).to_html : ''
  end
  
  def philosophy
    @profile.philosophy_page.philosophy ? RDiscount.new(@profile.philosophy_page.philosophy).to_html : ''
  end
  
  def qualifications
   @profile.experience_page.qualifications
  end
  
  def positions 
   @profile.experience_page.positions
  end
  
  memoize :introduction, :philosophy, :qualifications, :positions
end
