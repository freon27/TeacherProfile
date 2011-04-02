class ProfilesController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user, :except => [:new, :create]
  
  def new
    @profile = Profile.new
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
    @profile = Profile.find(params[:id])
  end
  
  private
    def correct_user
      @profile = Profile.find(params[:id])
      redirect_to(sign_in_path) unless current_user?(@profile.user)
    end
end
