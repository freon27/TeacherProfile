class SampleWorkPagesController < ApplicationController
  
  before_filter :authorize
  
  def show
    @sample_work_page = get_sample_work_page(params[:id])
    @subject_areas = @sample_work_page.subject_areas
    @display_subject_area = @subject_areas.first
    @display_subject_area and @display_project = @display_subject_area.projects.first
    @profile = @sample_work_page.profile
    @side_bar_name = 'subject_area_list'
  end
  
  def edit 
    @sample_work_page = get_sample_work_page(params[:id])
    @subject_areas = @sample_work_page.subject_areas.includes(:projects)
    @side_bar_name = 'profiles/page_links'
    @profile = @sample_work_page.profile 
  end
  
  def update
    @sample_work_page = get_sample_work_page(params[:id])
    if @sample_work_page.update_attributes(params[:sample_work_page])
      redirect_to(edit_sample_work_page_path(@sample_work_page))
    else
      render :action => :edit
    end
  end
  
  private
    def get_sample_work_page(swp_id)
      current_user.sample_work_pages.find(swp_id)
    end
end
