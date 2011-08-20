class SubjectAreasController < ApplicationController
  
  before_filter :authenticate
  
  def new
    @sample_work_page = get_sample_work_page(params[:sample_work_page_id])
    @subject_area = SubjectArea.new
    @profile = @sample_work_page.profile
    @side_bar_name = get_sidebar
  end

  def create
    @sample_work_page = get_sample_work_page(params[:sample_work_page_id])
    @subject_area = @sample_work_page.subject_areas.build(params[:subject_area])
    if @subject_area.save
      redirect_to( edit_sample_work_page_path(@sample_work_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end
    
  def edit
    @sample_work_page = get_sample_work_page(params[:sample_work_page_id])
    @subject_area = get_subject_area(@sample_work_page, params[:id])
    @profile = @sample_work_page.profile
    @side_bar_name = get_sidebar
  end
  
  def update
    @sample_work_page = get_sample_work_page(params[:sample_work_page_id])
    @subject_area = get_subject_area(@sample_work_page, params[:id])
    if @subject_area.update_attributes(params[:subject_area])
      redirect_to(edit_sample_work_page_subject_area_path(@sample_work_page, @subject_area), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @sample_work_page = get_sample_work_page(params[:sample_work_page_id])
    @sample_work_page.subject_areas.find(params[:id]).destroy
    redirect_to(edit_sample_work_page_path(@sample_work_page), :notice => 'Deleted.')
  end
  
  private
    def get_sidebar
      'profiles/page_links'
    end
    
    def get_sample_work_page(id)
      current_user.sample_work_pages.find(id)
    end
    
    def get_subject_area(sample_work_page, id)
      sample_work_page.subject_areas.find(id)
    end
end
