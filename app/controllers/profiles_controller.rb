class ProfilesController < ApplicationController

  before_filter :authenticate, :except => [:show] 
  before_filter :common_setup, :except => [:show]

  def show
    # we may be getting an ID or a user set URL to search on
    if params[:profile_url]
      @profile = Profile.find_by_url_suffix(params[:profile_url])
    else 
      @profile = Profile.find(params[:id])
    end
    @subscribed = @profile.user.subscribed?
    if ! @subscribed && current_user != @profile.user
      @owner_name = "#{@profile.user.first_name} #{@profile.user.last_name}"
      @owner_email = @profile.user.email
      render :blocked
    end
    @introduction = @profile.main_page.html_introduction
    @page_name = 'About Me'
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
    @profile = current_user.profiles.find(params[:id])    
  end
  
  def update
    @profile = current_user.profiles.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to(:back, :notice => 'Saved.')
    else
      render :action => "edit"
    end
  end
  
  def publish
    @profile = current_user.profiles.find(params[:id])
    @profile.published = true
    @profile.save!
    redirect_to :back
  end 
  
  def unpublish
    @profile = current_user.profiles.find(params[:id])
    @profile.published = false
    @profile.save!
    redirect_to :back
  end
  
  def destroy
    profile = current_user.profiles.find(params[:id])
    profile.destroy
    redirect_to(dashboard_user_path(current_user), :notice => 'Deleted.')
  end
  
  def export
    @profile = current_user.profiles.find(params[:id], :include => [:main_page, :experience_page, :sample_work_page])
    @introduction = @profile.main_page.introduction
    @philosophy = @profile.philosophy_page.philosophy
    @positions = @profile.experience_page.positions
    @qualifications = @profile.experience_page.qualifications(:include => [:subjects])
    html = render_to_string(:export)
    kit = PDFKit.new(html)
    send_data(kit.to_pdf, :type => :pdf)
  end
  
  private
    
    def common_setup  
      @side_bar_name = 'profiles/page_links'   
    end
end
