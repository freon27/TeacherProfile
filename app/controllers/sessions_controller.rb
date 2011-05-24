class SessionsController < Clearance::SessionsController
  before_filter :common_setup
  
  def url_after_create
    url_for :controller => 'users', :id => current_user, :action => 'dashboard'
  end

  def common_setup
    logger.debug('SETUP')
    @side_bar_name = 'users/page_links'
  end 
end