class ConfirmationsController < ApplicationController
  
  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------

  layout 'application'

  #----------------------------------------------------
  # Public methods
  #----------------------------------------------------
  
  #========== CREATE ==================================
  
  # This method creates a record with the supplied parameters.
  #
  def create
    @user = User.where(single_access_token: params[:confirmation_code]).first

    if @user

      @user.reset_perishable_token
      @user.validated = true

      if @user.save
        flash[:notice] = t("users.create.flash.success")
        UserMailer.account_confirmed(@user).deliver

        redirect_to root_path

      else
        flash[:error] = t("scaffolds.generic.flash.error")
        render body: 'error'
      end

    else
      flash[:error] = t("scaffolds.generic.flash.error")
      render body: 'error'
    end
  end
  
end