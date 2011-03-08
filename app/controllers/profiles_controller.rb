class ProfilesController < ApplicationController

  #before_filter :authenticate, :except => [:new, :create]
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = current_user.profiles.build(params[:profile])
    if @profile.save
      redirect_to(profiles_path(@profile))
    else
      render :action => "new"
    end
  end
end
