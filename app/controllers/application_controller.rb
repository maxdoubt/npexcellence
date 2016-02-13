class ApplicationController < ActionController::Base

  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------

  # mixins
  include Pundit

  # security settings
  protect_from_forgery # with: :exception

  # define helper settings
  helper        :all
  helper_method :current_user_session
  helper_method :current_user
  helper_method :root_path_for_current_user

  helper_method :current_setting


  # error trapping
  rescue_from Pundit::NotAuthorizedError, with: :render_not_authorized_error

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
      flash[:danger] = t("user_sessions.create.flash.required")
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
    if current_user
      rp = (current_user.admin? or current_user.employee? or current_user.org_admin?) ? admin_root_path : root_path
    else
      rp = root_path
    end
    rp
  end

  #==================== CURRENT ITEMS ====================

  def current_setting
    @current_setting ||= Setting.instance
  end

  #========== RENDERING (HTML) ==========================

  def render_not_authorized_error
    flash.keep[:danger] = 'Access denied.'
    redirect_to(root_path_for_current_user)
  end


end
