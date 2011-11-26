class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  include SessionsHelper
  
  layout :resolve_layout 
  
  private
    def resolve_layout
      if action_name == 'export'
        'export'
      elsif action_name == 'show' && controller_name != 'pages'
        'display_profile'
      else 
        'application'
      end
    end
end
