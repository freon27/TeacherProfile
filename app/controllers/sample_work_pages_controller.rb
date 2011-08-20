class SampleWorkPagesController < ApplicationController
  
  before_filter :authenticate
  
  def edit 
    @sample_work_page = SampleWorkPage.find(params[:id])
    @subject_areas = @sample_work_page.subject_areas
    @side_bar_name = 'profiles/page_links'
    @profile = @sample_work_page.profile 
  end
end
