class PhilosophyPagesController < ApplicationController

  before_filter :authenticate, :except => [:show]

  def show
    @philosophy_page = PhilosophyPage.find(params[:id])
    @philosophy = RDiscount.new(@philosophy_page.philosophy).to_html
    @page_name = 'My Teaching Philosophy'
    @profile = @philosophy_page.profile
  end
  
  def edit
    @philosophy_page = get_philosophy_page(params[:id])
    @profile = @philosophy_page.profile
    @side_bar_name = get_sidebar_name
  end
  
  def update
    @philosophy_page = get_philosophy_page(params[:id])
    @profile = @philosophy_page.profile
    @side_bar_name = get_sidebar_name
      if @philosophy_page.update_attributes(params[:philosophy_page])
        redirect_to( edit_philosophy_page_path(@philosophy_page), :notice => 'Saved.')
      else
        render :action => "edit"
      end
  end
  
  private    
    
    def get_philosophy_page(id)
      current_user.philosophy_pages.find(id)
    end 
    
    def get_sidebar_name
      'profiles/page_links'   
    end
end
