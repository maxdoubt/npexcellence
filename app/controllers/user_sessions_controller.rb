class UserSessionsController < ApplicationController
  
  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user,    :only => :destroy
  
    
  
  #-------------------------------------------------
  # Public methods
  #-------------------------------------------------
  
  # This method loads the login form.
  #
  def new
    @user_session = UserSession.new
  end


  # This method processes login requests.
  #
  def create
    @user_session = UserSession.new(params[:user_session])
    reset_session
    if @user_session.save
      flash[:success] = t("user_sessions.create.flash.success")
      redirect_back_or_default(root_path_for_current_user)
    else
      flash[:danger] = t("user_sessions.create.flash.error")
      redirect_to(login_path)
    end
  end

  
  # This method destroys the current user session.
  #
  def destroy
    current_user_session.destroy
    
    flash[:success] = t("user_sessions.destroy.flash.success") 
    
    redirect_to(login_path)
  end
  
end