class ExperiencePagesController < ApplicationController

  before_filter :authorize, :except => [:show] 
  
  def show
    @page_name = 'Experience'
    @experience_page = ExperiencePage.find(params[:id]) if params[:id]
    @profile = @experience_page.profile
  end

  def edit
    @experience_page = get_experience_page(params[:id])
    @profile = @experience_page.profile
    @positions = @experience_page.positions
    @qualifications = @experience_page.qualifications
    @side_bar_name = get_sidebar_name
  end

  def update
    @experience_page = get_experience_page(params[:id])
    @profile = @experience_page.profile
    if @experience_page.update_attributes(params[:experience_page])
      redirect_to( edit_experience_page_path(@experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  private    
    
    def get_experience_page(id)
      current_user.experience_pages.find(id, :include => :profile)
    end
    
    def get_sidebar_name
      'profiles/page_links'
    end
    
end
