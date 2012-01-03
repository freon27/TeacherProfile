

class Profiles::ShowPresenter
  
  def initialize(profile)
    @profile = profile
  end
  
  def introduction
    @introduction ||= RDiscount.new(@profile.main_page.introduction).to_html
  end
  
  def philosophy
    @philosophy ||= RDiscount.new(@profile.philosophy_page.philosophy).to_html
  end
  
  def qualifications
    @qualifications ||= @profile.experience_page.qualifications
  end
  
  def positions 
    @positions ||= @profile.experience_page.positions
  end
  
  def photo
    return  
    @photo ||= @profile.photo
  end
   
end
