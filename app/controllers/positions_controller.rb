class PositionsController < ApplicationController

  before_filter :authorize
  before_filter :common_setup
  before_filter :user_owns_experience_page
  before_filter :user_owns_position, :except => [:new, :create]
  
  def show 
    @position = Position.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end

  def new 
    @position = Position.new
  end
  
  def create
    @position = @experience_page.positions.build(params[:position])
    @position.user = current_user
    if @position.save
      redirect_to( edit_experience_page_path(@experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end

  def edit
  end
  
  def update
    if @position.update_attributes(params[:position])
      redirect_to( edit_experience_page_path(@position.experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @position.destroy
    redirect_to( edit_experience_page_path(@position.experience_page), :notice => 'Deleted.')
  end
  
  private    
    def user_owns_experience_page
      redirect_to(sign_in_path) unless current_user?(ExperiencePage.find(params[:experience_page_id]).profile.user)
    end
    def user_owns_position
      redirect_to(sign_in_path) unless current_user?(Position.find(params[:id]).experience_page.profile.user)
    end
    
    def common_setup 
      @position = Position.find(params[:id]) if params[:id]
      @experience_page = ExperiencePage.find(params[:experience_page_id]) if params[:experience_page_id]
      @side_bar_name = 'profiles/page_links'
      @profile = @experience_page.profile    
    end
end
