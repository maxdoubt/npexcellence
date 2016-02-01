class ApplicationController < ActionController::Base

  # security settings
  protect_from_forgery with: :exception


  #-------------------------------------------------------------------------------
  # Protected instance methods
  #-------------------------------------------------------------------------------
  protected

  #==================== AUTHENTICATION ====================

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = t("user_sessions.create.flash.required")
      redirect_to(root_path_for_current_user)
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      redirect_to(root_path_for_current_user)
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def root_path_for_current_user
    root_path
  end

end
