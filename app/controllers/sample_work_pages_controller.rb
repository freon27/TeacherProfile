class SampleWorkPagesController < ApplicationController
  
  before_filter :authenticate
  
  def show
    @sample_work_page = SampleWorkPage.find(params[:id])
    @subject_areas = @sample_work_page.subject_areas# TODO add this? .includes(:projects)
    @display_subject_area = @subject_areas.first
    @display_project = @display_subject_area.projects.first
    @profile = @sample_work_page.profile
    @side_bar_name = 'subject_area_list'
    @page_name = 'Sample Work'
  end
  
  def edit 
    @sample_work_page = SampleWorkPage.find(params[:id])
    @subject_areas = @sample_work_page.subject_areas
    @side_bar_name = 'profiles/page_links'
    @profile = @sample_work_page.profile 
  end
  
  def update
    @sample_work_page = SampleWorkPage.find(params[:id])
    if @sample_work_page.update_attributes(params[:sample_work_page])
      redirect_to(edit_sample_work_page_path(@sample_work_page))
    else
      render :action => :edit
    end
  end
end
