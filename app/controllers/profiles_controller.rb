class ProfilesController < ApplicationController

  before_filter :authenticate
  before_filter :correct_user, :except => [:new, :create, :edit, :update]
  
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
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to( dashboard_user_path(current_user), :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to( dashboard_user_path(current_user), :notice => 'Deleted.')
  end
  
  private
    def correct_user
      @profile = Profile.find(params[:id])
      redirect_to(sign_in_path) unless current_user?(@profile.user)
    end
end
