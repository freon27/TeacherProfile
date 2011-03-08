class SessionsController < Clearance::SessionsController
  def url_after_create
    url_for :controller => 'users', :id => current_user, :action => 'dashboard'
  end
end