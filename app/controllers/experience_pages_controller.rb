class ExperiencePagesController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user
  
  def show
    @experience_page = ExperiencePage.find(params[:id])
  end

  def edit
    @experience_page = ExperiencePage.find(params[:id])
    @positions = @experience_page.positions
  end

  def update
    @experience_page = ExperiencePage.find(params[:id])
      if @experience_page.update_attributes(params[:experience_page])
        redirect_to( edit_experience_page_path(@experience_page), :notice => 'Saved.')
      else
        render :action => "edit"
      end
  end
  
  private    
    def correct_user
      @page = ExperiencePage.find(params[:id])
      redirect_to(sign_in_path) unless current_user?(@page.profile.user)
    end
end
