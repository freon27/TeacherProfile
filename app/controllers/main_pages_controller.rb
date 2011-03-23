class MainPagesController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user
  
  def show
    @main_page = MainPage.find(params[:id])
  end

  def edit
    @main_page = MainPage.find(params[:id])
  end

  def update
    @main_page = MainPage.find(params[:id])
      if @main_page.update_attributes(params[:main_page])
        redirect_to( edit_main_page_path(@main_page), :notice => 'Saved.')
      else
        render :action => "edit"
      end
  end
  
  private    
    def correct_user
      @page = MainPage.find(params[:id])
      redirect_to(sign_in_path) unless current_user?(@page.profile.user)
    end
end
