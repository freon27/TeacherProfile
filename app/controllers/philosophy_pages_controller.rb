class PhilosophyPagesController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user
  
  def show
    @philosophy_page = PhilosophyPage.find(params[:id])
  end
  
  def edit
    @philosophy_page = PhilosophyPage.find(params[:id])
  end
  
  def update
    @philosophy_page = PhilosophyPage.find(params[:id])
      if @philosophy_page.update_attributes(params[:philosophy_page])
        redirect_to( edit_philosophy_page_path(@philosophy_page), :notice => 'Saved.')
      else
        render :action => "edit"
      end
  end
  
  private    
    def correct_user
      @page = PhilosophyPage.find(params[:id])
      redirect_to(sign_in_path) unless current_user?(@page.profile.user)
    end
end