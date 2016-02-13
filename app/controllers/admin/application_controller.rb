class Admin::ApplicationController < ApplicationController

  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------
  
  layout 'admin'
  
  # callbacks
  before_filter :require_user  
  

  #-------------------------------------------------
  # Protected Methods
  #-------------------------------------------------
  protected
  
  #==================== AUTHENTICATION ====================
  
  def root_path_for_current_user
    if current_user
      path = admin_root_path
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