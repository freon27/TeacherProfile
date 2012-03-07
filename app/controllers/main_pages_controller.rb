class MainPagesController < ApplicationController

  before_filter :authorize, :except => [:show]
  
  
  def show
    @main_page = MainPage.find(params[:id])
    @profile = @main_page.profile
    @profile_presenter = Profiles::ShowPresenter.new(@profile)
    @side_bar_name = get_sidebar_name
  end

  def edit
    @main_page = get_main_page(params[:id])
    @profile = @main_page.profile
    @side_bar_name = get_sidebar_name
  end

  def update
    @main_page = get_main_page(params[:id])
    @profile = @main_page.profile
    @side_bar_name = get_sidebar_name
    
    if @main_page.update_attributes(params[:main_page])
      redirect_to( edit_main_page_path(@main_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  private 
         
    def get_main_page(id)
      current_user.main_pages.find(id, :include => :profile)
    end
    
    def get_sidebar_name 
      'profiles/page_links'
    end
end
