class UsersController < Clearance::UsersController

  before_filter :common_setup
  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :only => [:edit, :update, :show, :dashboard]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def dashboard
    @profiles = @user.profiles
    @side_bar_name = 'users/dashboard_links'
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to( dashboard_user_path(current_user ), :notice => 'Your account was saved successfully.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  

  private
    def url_after_create
      url_for :controller => 'users', :id => current_user.id, :action => 'dashboard'
    end
    
    def correct_user
      redirect_to(sign_in_path) unless current_user?(@user)
    end
    
    def common_setup
      @user = User.find(params[:id]) if params[:id]
      @side_bar_name = 'users/page_links'
    end 
end
