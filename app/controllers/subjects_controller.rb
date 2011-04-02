class SubjectsController < ApplicationController
  
  before_filter :authenticate
  before_filter :correct_user?
  
  def new
    @subject = Subject.new
    @qualification = Qualification.find(params[:qualification_id])
  end
  
  def create
    @qualification = Qualification.find(params[:qualification_id])
    @subject = @qualification.subjects.build(params[:subject])
    if @subject.save
      redirect_to( edit_experience_page_path(@subject.qualification.experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to(edit_experience_page_path(@subject.qualification.experience_page))
  end
  
  def edit
    @qualification = Qualification.find(params[:qualification_id])
    @subject = Subject.find(params[:id])
  end
  
  def update
    @qualification = Qualification.find(params[:qualification_id])
    @subject = Subject.find(params[:id])
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
end
