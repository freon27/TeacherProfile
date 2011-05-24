class MainPagesController < ApplicationController

  before_filter :authenticate, :common_setup, :correct_user
  
  
  def show
  end

  def edit
  end

  def update
    if @main_page.update_attributes(params[:main_page])
      redirect_to( edit_main_page_path(@main_page), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  private    
    def correct_user
      redirect_to(sign_in_path) unless current_user?(@main_page.profile.user)
    end
    
    def common_setup 
      @main_page = MainPage.find(params[:id]) if params[:id]
      @side_bar_name = 'profiles/page_links'
      @profile = @main_page.profile    
    end
end
