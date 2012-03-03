class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  include Clearance::Authentication
  protect_from_forgery
  include SessionsHelper
  
  layout :resolve_layout 
  
  private
    def resolve_layout
      if request.xhr?
        nil
      elsif
        controller_path.split('/').first == 'forem'
        'forum'
      elsif
        action_name == 'export'
        'export'
      elsif action_name == 'show' && controller_name != 'pages'
        'display_profile'
      else 
        'application'
      end
    end
    
  
end
