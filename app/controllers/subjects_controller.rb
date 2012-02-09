class SubjectsController < ApplicationController
  
  before_filter :authorize
  
  def new
    @qualification = get_qualification(params[:qualification_id])
    @experience_page = @qualification.experience_page
    @profile = @experience_page.profile
    @subject = Subject.new
    @side_bar_name = get_sidebar_name
  end
  
  def create
    @qualification = get_qualification(params[:qualification_id])
    @subject = @qualification.subjects.build(params[:subject])
    @subject.user = current_user
    if @subject.save
      redirect_to( edit_experience_page_path(@subject.qualification.experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @qualification = get_qualification(params[:qualification_id])
    @subject = get_subject(params[:id])
    @subject.destroy
    redirect_to(edit_experience_page_path(@qualification.experience_page))
  end
  
  def edit
    @qualification = get_qualification(params[:qualification_id])
    @experience_page = @qualification.experience_page
    @profile = @experience_page.profile
    @subject = get_subject(params[:id])
    @side_bar_name = get_sidebar_name
  end
  
  def update
    @qualification = get_qualification(params[:qualification_id])
    @subject = get_subject(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to( edit_experience_page_path(@subject.qualification.experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  private
   
    def get_subject(id)
      current_user.subjects.find(id)
    end
    
    def get_qualification(id)
      current_user.qualifications.find(id)
    end
    
    def get_sidebar_name
      'profiles/page_links'
    end
    
    def common_setup 
      @side_bar_name = 
      @profile = @qualification.experience_page.profile
    end
end
