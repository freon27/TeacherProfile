class ProjectsController < ApplicationController
  
  before_filter :authenticate
  
  def new
    @subject_area = get_subject_area(params[:subject_area_id])
    @project = Project.new
    @side_bar_name = get_sidebar
    @profile = get_profile(@subject_area)
  end
  
  def create
    @subject_area = get_subject_area(params[:subject_area_id])
    @project = @subject_area.projects.build(params[:project])
    @project.user = current_user
    if @project.save
      redirect_to edit_subject_area_project_path(@subject_area, @project), :notice => 'Created'
    else
      render :new
    end
  end
  
  def edit
    @subject_area = get_subject_area(params[:subject_area_id])
    @project = get_project(@subject_area, params[:id])
    @side_bar_name = get_sidebar
    @profile = get_profile(@subject_area)    
  end
  
  def update
    @subject_area = get_subject_area(params[:subject_area_id])
    @project = get_project(@subject_area, params[:id])
    @side_bar_name = get_sidebar
    @profile = get_profile(@subject_area)
    if @project.update_attributes(params[:project])
      redirect_to edit_subject_area_project_path(@subject_area.id, @project.id), :notice => 'Saved.'
    else
      render :action => :edit
    end
  end
  
  def destroy
    @subject_area = get_subject_area(params[:subject_area_id])
    @project = get_project(@subject_area, params[:id])
    @side_bar_name = get_sidebar
    @profile = get_profile(@subject_area)
    @project.destroy
    redirect_to edit_sample_work_page_subject_area_path(@subject_area.sample_work_page.id, @subject_area.id)
  end
  
  private
    def get_sidebar
      'profiles/page_links'
    end
    
    def get_subject_area(subject_area_id)
      current_user.subject_areas.find(subject_area_id)
    end
    
    def get_project(subject_area, project_id)
       subject_area.projects.find(project_id)
    end
    
    def get_profile(subject_area)
      subject_area.sample_work_page.profile
    end
      
end
