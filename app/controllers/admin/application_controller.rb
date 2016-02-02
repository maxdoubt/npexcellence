class Admin::ApplicationController < ApplicationController

  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------
  
  layout 'admin'
  
  

  #-------------------------------------------------
  # Protected Methods
  #-------------------------------------------------
  protected
  
  #==================== AUTHENTICATION ====================
  
  def root_path_for_current_user
    if current_user
      if current_user.role == Role.api_consumer
        path = edit_profile_path
      else
        path = dashboards_path
      end
    else
      path = login_path
    end
    path
  end
  
  
  #==================== ROUTING ====================
  
  # This method returns the routing scope for this controller set.
  #
  def routing_scope
    "admin"
  end
  
end