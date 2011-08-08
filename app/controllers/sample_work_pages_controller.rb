class SampleWorkPagesController < ApplicationController
  
  before_filter :authenticate
  
  def edit 
    @sample_work_page = SampleWorkPage.find(params[:id])
    @side_bar_name = 'profiles/page_links'
    @profile = @sample_work_page.profile 
  end
end
