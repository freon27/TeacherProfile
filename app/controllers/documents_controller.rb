class DocumentsController < ApplicationController
  before_filter :authenticate
  
  def new
    @project = get_project(params[:project_id])
    @document = Document.new
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
  end
  
  def create
    @project = get_project(params[:project_id])
    @document = @project.documents.build(params[:document])
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
    @document.user = current_user
    if @document.save
      redirect_to edit_subject_area_project_path(@project.subject_area, @project), :notice => 'Uploaded'
    else
      render :new
    end
  end
  
  def edit
    @project = get_project(params[:project_id])
    @document = @project.documents.find(params[:id])
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
  end
  
  def update
    @project = get_project(params[:project_id])
    @document = @project.documents.find(params[:id])
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
    if @document.update_attributes(params[:document])
      redirect_to edit_subject_area_project_path(@project.subject_area, @project), :notice => 'Updated'
    else
      render :edit
    end
  end
  
  def destroy
    @project = get_project(params[:project_id])
    @document = @project.documents.find(params[:id])
    @document.destroy
    redirect_to edit_subject_area_project_path(@project.subject_area, @project), :notice => 'Deleted'
  end
  
  private
    def get_side_bar
      'profiles/page_links'
    end
    
    def get_project(project_id)
      current_user.projects.find(params[:project_id])
    end
end