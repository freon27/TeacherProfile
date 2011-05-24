class ProfilesController < ApplicationController

  before_filter :authenticate, :common_setup
  before_filter :correct_user, :except => [:new, :create]

  def show
    @introduction = BlueCloth::new(@profile.main_page.introduction).to_html
  end 
  
  def new
    @profile = Profile.new
    @side_bar_name = 'users/dashboard_links'
  end
  
  def create
    @profile = current_user.profiles.build(params[:profile])
    if @profile.save
      redirect_to(dashboard_user_path(current_user))
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @profile.update_attributes(params[:profile])
      redirect_to(dashboard_user_path(current_user), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def publish
    @profile.published = true
    @profile.save!
    redirect_to :back
  end 
  
  def unpublish
    @profile.published = false
    @profile.save!
    redirect_to :back
  end
  
  def destroy
    @profile.destroy
    redirect_to(dashboard_user_path(current_user), :notice => 'Deleted.')
  end
  
  private
    def correct_user
      redirect_to(sign_in_path) unless current_user?(@profile.user)
    end
    
    def common_setup 
      @profile = Profile.find(params[:id]) if params[:id]
      @side_bar_name = 'profiles/page_links'   
    end
end
