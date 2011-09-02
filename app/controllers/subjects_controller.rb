class SubjectsController < ApplicationController
  
  before_filter :authenticate, :common_setup, :correct_user?
  
  def new
    @subject = Subject.new
  end
  
  def create
    @subject = @qualification.subjects.build(params[:subject])
    @subject.user = current_user
    if @subject.save
      redirect_to( edit_experience_page_path(@subject.qualification.experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @subject.destroy
    redirect_to(edit_experience_page_path(@subject.qualification.experience_page))
  end
  
  def edit
  end
  
  def update
    if @subject.update_attributes(params[:subject])
      redirect_to( edit_experience_page_path(@subject.qualification.experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  private
   
    def correct_user?
      redirect_to(sign_in_path) unless current_user?(Qualification.find(params[:qualification_id]).experience_page.profile.user)
    end
    
    def common_setup 
      @subject = Subject.find(params[:id]) if params[:id]
      @qualification = Qualification.find(params[:qualification_id]) if params[:qualification_id]
      @side_bar_name = 'profiles/page_links'
      @profile = @qualification.experience_page.profile    
    end
end
