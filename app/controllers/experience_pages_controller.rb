class ExperiencePagesController < ApplicationController

  before_filter :authenticate, :common_setup, :correct_user
  
  def show
  end

  def edit
    @positions = @experience_page.positions
    @qualifications = @experience_page.qualifications
  end

  def update
    if @experience_page.update_attributes(params[:experience_page])
      redirect_to( edit_experience_page_path(@experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  private    
    def correct_user
      redirect_to(sign_in_path) unless current_user?(@experience_page.profile.user)
    end
    
    def common_setup 
      @experience_page = ExperiencePage.find(params[:id]) if params[:id]
      @side_bar_name = 'profiles/page_links'
      @profile = @experience_page.profile    
    end
    
end
