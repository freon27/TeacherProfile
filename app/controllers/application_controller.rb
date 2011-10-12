class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  include SessionsHelper
  
  layout :resolve_layout 
  
  private
    def resolve_layout
      case action_name 
      when 'export'
        'export'
      when 'show'
        'display_profile'
      else 
        'application'
      end
    end
end
