class PhotosController < ApplicationController
  before_filter :authenticate
  
  def new
    @project = get_project(params[:project_id])
    @photo = Photo.new
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
  end
  
  def create
    @project = get_project(params[:project_id])
    @photo = @project.photos.build(params[:photo])
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
    @photo.user = current_user
    if @photo.save
      redirect_to edit_subject_area_project_path(@project.subject_area, @project), :notice => 'Uploaded'
    else
      render :new
    end
  end
  
  def edit
    @project = get_project(params[:project_id])
    @photo = @project.photos.find(params[:id])
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
  end
  
  def update
    @project = get_project(params[:project_id])
    @photo = @project.photos.find(params[:id])
    @profile = @project.subject_area.sample_work_page.profile
    @side_bar_name = get_side_bar
    if @photo.update_attributes(params[:photo])
      redirect_to edit_subject_area_project_path(@project.subject_area, @project), :notice => 'Updated'
    else
      render :edit
    end
  end
  
  def destroy
    @project = get_project(params[:project_id])
    @photo = @project.photos.find(params[:id])
    @photo.destroy
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
