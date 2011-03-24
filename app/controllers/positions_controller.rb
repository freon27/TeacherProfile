class PositionsController < ApplicationController

  before_filter :authenticate
  before_filter :user_owns_experience_page
  #before_filter :user_owns_profile, :except => [:new, :create]
  
  def show 
    @position = Position.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end

  def new 
    @position = Position.new
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end
  
  def create
    @experience_page = ExperiencePage.find(params[:experience_page_id])
      @position = @experience_page.positions.build(params[:position])
      if @position.save
        redirect_to( edit_experience_page_path(@experience_page), :notice => 'Created.')
      else
        render :action => 'new'
      end
  end



  def edit
    @position = Position.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end
  
  def update
    @position = Position.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
      if @position.update_attributes(params[:position])
        redirect_to( edit_experience_page_path(@position.experience_page), :notice => 'Saved.')
      else
        render :action => "edit"
      end
  end
  
  private    
    def user_owns_experience_page
      redirect_to(sign_in_path) unless current_user?(ExperiencePage.find(params[:experience_page_id]).profile.user)
    end
    def user_owns_profile
      redirect_to(sign_in_path) unless current_user?(Position.find(params[:id])..experience_page.profile.user)
    end
end
