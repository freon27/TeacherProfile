class QualificationsController < ApplicationController

  before_filter :authenticate

  def show
    @experience_page = get_experience_page(params[:experience_page_id])
    @qualification = get_qualification(@experience_page, params[:id])
    @side_bar_name = get_side_bar
    @profile = @experience_page.profile
  end

  def new
    @experience_page = get_experience_page(params[:experience_page_id])
    @qualification = Qualification.new
    @side_bar_name = get_side_bar
    @profile = @experience_page.profile
  end
  
  def create
    @experience_page = get_experience_page(params[:experience_page_id])
    @qualification = @experience_page.qualifications.build(params[:qualification])
    @side_bar_name = get_side_bar
    @profile = @experience_page.profile
    @qualification.user = current_user
    if @qualification.save
      redirect_to( edit_experience_page_path(@experience_page), :notice => 'Created.')
    else
      render :action => 'new'
    end
  end

  def edit
    @experience_page = get_experience_page(params[:experience_page_id])
    @qualification = get_qualification(@experience_page, params[:id])
    @side_bar_name = get_side_bar
    @profile = @experience_page.profile
  end
  
  def update
    @experience_page = get_experience_page(params[:experience_page_id])
    @qualification = get_qualification(@experience_page, params[:id])
    @side_bar_name = get_side_bar
    @profile = @experience_page.profile
    if @qualification.update_attributes(params[:qualification])
      redirect_to( edit_experience_page_path(@qualification.experience_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @experience_page = get_experience_page(params[:experience_page_id])
    @qualification = get_qualification(@experience_page, params[:id])
    @side_bar_name = get_side_bar
    @profile = @experience_page.profile
    @qualification.destroy
    redirect_to( edit_experience_page_path(@qualification.experience_page), :notice => 'Deleted.')
  end
  
  private    

    def get_experience_page(ep_id)
      current_user.experience_pages.find(ep_id)
    end
    
    def get_qualification(experience_page, id)
      experience_page.qualifications.find(id)
    end

    def get_side_bar
      'profiles/page_links'
    end
end
