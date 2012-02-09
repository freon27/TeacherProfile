class PasswordsController < Clearance::PasswordsController

  before_filter :common_setup

  def edit
    @user = current_user || @user = User.find_by_id_and_confirmation_token(
                   params[:user_id], params[:token])
    render :template => 'passwords/edit'
  end
  
  def update
    @user = current_user || ::User.find_by_id_and_confirmation_token(
                   params[:user_id], params[:token])

    if @user.update_password(params[:user][:password])
      sign_in(@user) unless signed_in? 
      flash_success_after_update
      redirect_to(url_after_update)
    else
      render :template => 'passwords/edit'
    end
  end

  def forbid_missing_token
    if ! signed_in? && params[:token].blank?
      flash_failure_when_forbidden
      render :template => 'passwords/new'
    end
  end
  
  def forbid_non_existent_user
    unless signed_in? || ::User.find_by_id_and_confirmation_token(
                  params[:user_id], params[:token])
      flash_failure_when_forbidden
      render :template => 'passwords/new'
    end
  end

  def flash_success_after_update
    flash[:success] = translate(:signed_in, :default => "Password updated.")
  end

  private
    def common_setup 
      @side_bar_name = '/users/page_links'
    end
    
    def url_after_update
      dashboard_user_path(current_user)
    end
end
