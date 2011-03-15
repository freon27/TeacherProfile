class UsersController < Clearance::UsersController

  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :only => [:edit, :update, :show, :dashboard]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def dashboard
    @user = current_user
    @profiles = @user.profiles
  end

  # GET /users/new
  # GET /users/new.xml
  #def new
  #  @user = User.new
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.xml  { render :xml => @user }
  #  end
  #end

  # GET /users/1/edit
  #def edit
  #  @user = User.find(params[:id])
  #end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Your account was saved successfully.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
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
      @user = User.find(params[:id])
      redirect_to(sign_in_path) unless current_user?(@user)
    end
end
