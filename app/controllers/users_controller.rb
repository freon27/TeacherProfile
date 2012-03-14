class UsersController < Clearance::UsersController

  before_filter :authorize, :except => [:new, :create]
  before_filter :correct_user, :only => [:edit, :update, :show, :dashboard, :destroy]
  before_filter :require_admin, :only => [:index, :edit_subscription, :update_subscription]

  
  def new
    @user = User.new
    @side_bar_name = get_side_bar
  end
  
  def create
    @side_bar_name = get_side_bar
    super
    UserMailer.registration_confirmation(@user).deliver
  end

  def index
    @users = User.all
    @side_bar_name = get_side_bar
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = get_user(params[:id])
    @side_bar_name = get_side_bar
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  
  def edit
    @user = get_user(params[:id])
    @side_bar_name = get_side_bar
  end


  def dashboard
    @user = get_user(params[:id])
    @profiles = @user.profiles
    @side_bar_name = 'users/dashboard_links'
  end

  def update
    @user = get_user(params[:id])
    @side_bar_name = get_side_bar
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
    @user = get_user(params[:id])
    @side_bar_name = get_side_bar
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def edit_subscription
    @user = get_user(params[:id])
    @side_bar_name = get_side_bar
  end
  
  def update_subscription
    @user = get_user(params[:id])
    @side_bar_name = get_side_bar
    @user.subscribed_until = params[:user][:subscribed_until]
    if @user.save!
      redirect_to(users_path)
    else
      render :edit_subscription
    end
  end
  
  
  private
    def url_after_create
      url_for :controller => 'users', :id => current_user.id, :action => 'dashboard'
    end
    
    def correct_user
      redirect_to(sign_in_path) unless current_user == User.find(params[:id])
      return
    end
    
    def get_user(user_id)
      User.find(user_id) 
    end
    
    def get_side_bar
      'users/page_links'
    end
    
    def require_admin
      if !current_user.admin?
        redirect_to(sign_in_path)
        return
      end
    end
end
