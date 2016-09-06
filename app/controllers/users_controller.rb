class UsersController < ApplicationController
  
  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------

  layout 'application'

  # callbacks
  before_filter :assign_user,    except: [:index, :new, :create]
  before_filter :authorize_user, except: [:new, :create]
    
  #----------------------------------------------------
  # Public methods
  #----------------------------------------------------
  
  #========== READ ====================================

  def show
  end

  #========== CREATE ==================================

  def new
    @user = User.new
  end

  
  # This method creates a record with the supplied parameters.
  #
  def create
    @user = User.new(user_params)

    if @user.save
      @user.reset_perishable_token
      flash[:notice] = t("users.create.flash.success")
      UserMailer.account_created(@user).deliver

      begin
        redirect_to :back
      rescue ActionController::RedirectBackError
        redirect_to root_path
      end

    else
      flash[:error] = t("scaffolds.generic.flash.error")
      redirect_to new_user_path
    end
  end 
  
  
  #-------------------------------------------------
  # Private methods
  #-------------------------------------------------
  
  private

  def assign_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :phone,
      :address,
      :title,
      :org,
      :password,
      :password_confirmation
    )
  end
  
end