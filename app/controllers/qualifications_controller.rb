class QualificationsController < ApplicationController

  before_filter :authenticate
  before_filter :user_owns_experience_page
  before_filter :user_owns_qualification, :except => [:new, :create]
  
  def show 
    @qualification = Qualification.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end

  def new 
    @qualification = Qualification.new
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end
  
  def create
    @experience_page = ExperiencePage.find(params[:experience_page_id])
    @qualification = @experience_page.qualifications.build(params[:qualification])
    if @qualification.save
      redirect_to( edit_experience_page_path(@experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end

  def edit
    @qualification = Qualification.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
  end
  
  def update
    @qualification = Qualification.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
      if @qualification.update_attributes(params[:qualification])
        redirect_to( edit_experience_page_path(@qualification.experience_page), :notice => 'Saved.')
      else
        render :action => "edit"
      end
  end
  
  def destroy
    @qualification = Qualification.find(params[:id])
    @experience_page = ExperiencePage.find(params[:experience_page_id])
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
end
