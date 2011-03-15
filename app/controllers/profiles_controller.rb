class ProfilesController < ApplicationController

  before_filter :authenticate, :except => [:new, :create, :edit]
  
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
end
