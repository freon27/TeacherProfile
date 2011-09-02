class QualificationsController < ApplicationController

  before_filter :authenticate, :common_setup
  before_filter :user_owns_experience_page
  before_filter :user_owns_qualification, :except => [:new, :create]
  
  def show 
  end

  def new 
    @qualification = Qualification.new
  end
  
  def create
    @experience_page = ExperiencePage.find(params[:experience_page_id])
    @qualification = @experience_page.qualifications.build(params[:qualification])
    @qualification.user = current_user
    if @qualification.save
      redirect_to( edit_experience_page_path(@experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end

  def edit
  end
  
  def update
    if @qualification.update_attributes(params[:qualification])
      redirect_to( edit_experience_page_path(@qualification.experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @qualification.destroy
    redirect_to( edit_experience_page_path(@qualification.experience_page), :notice => 'Deleted.')
  end
  
  private    
    def user_owns_experience_page
      redirect_to(sign_in_path) unless current_user?(ExperiencePage.find(params[:experience_page_id]).profile.user)
    end
    def user_owns_qualification
      redirect_to(sign_in_path) unless current_user?(Qualification.find(params[:id]).experience_page.profile.user)
    end

    def common_setup 
      @qualification = Qualification.find(params[:id]) if params[:id]
      @experience_page = ExperiencePage.find(params[:experience_page_id]) if params[:experience_page_id]
      @side_bar_name = 'profiles/page_links'
      @profile = @experience_page.profile    
    end
end
