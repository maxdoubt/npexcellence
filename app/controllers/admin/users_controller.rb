class Admin::UsersController < Admin::ApplicationController
  
  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------

  # callbacks
  before_filter :assign_user,    except: [:index, :new, :create]
  before_filter :authorize_user, except: [:index, :new, :create]
  
  # before_filter :require_user  
  # load_and_authorize_resource
  # before_filter :assign_role_if_allowed, :only => [:create, :update]
  
  #----------------------------------------------------
  # Public methods
  #----------------------------------------------------
  
  #========== READ ====================================

  def index
    @users = User.all.order('email')
  end

  def show
  end

  #========== CREATE ==================================

  def new
    @user = User.new
  end

  
  # This method creates a record with the supplied parameters.
  #
  def create
    @user.reset_password
    
    if @user.save
      flash[:notice] = t("users.create.flash.success")
      Admin::UserMailer.account_created(@user).deliver
      redirect_to(users_path)
    else
      flash[:error] = t("scaffolds.generic.flash.error")
      render scaffold_template(:new)
    end
  end
  

  #========== UPDATE ====================================


  def edit; end

  def update
    @user.attributes = user_params

    if @user.save
      flash.keep[:success] = t('users.update.flash.success')
      redirect_to(admin_users_path)
    else
      flash.now[:danger] = t('scaffolds.generic.flash.error')
      render :edit
    end
  end

  
  # # This method updates the record so that it reports as active.
  # #
  # def activate
  #   @user.activate
  #   saved = @user.save
    
  #   if saved
  #     flash[:notice] = t("users.activate.flash.success")
  #   else
  #     flash[:error]  = t("users.activate.flash.error")
  #   end
    
  #   respond_to do |format|
  #     format.html {
  #       if saved
  #         redirect_to users_path
  #       else
  #         render scaffold_template(:edit)
  #       end
  #     }
  #     format.js
  #   end
  # end
  
  
  # # This method updates the record so that it reports as inactive.
  # #
  # def deactivate
  #   @user.deactivate
  #   saved = @user.save
    
  #   if saved
  #     flash[:notice] = t("users.deactivate.flash.success")
  #   else
  #     flash[:error]  = t("users.deactivate.flash.error")
  #   end
    
  #   respond_to do |format|
  #     format.html {
  #       if saved
  #         redirect_to users_path
  #       else
  #         render scaffold_template(:edit)
  #       end
  #     }
  #     format.js
  #   end
  # end
  
  
  # # This method resets the user's password and send him an activation
  # # email.
  # #
  # def reset    
  #   @user.reset_password
  #   saved = @user.save
    
  #   if saved
  #     flash[:notice] = t("users.reset.flash.success")
  #     Admin::UserMailer.password_reset(@user).deliver
  #   else
  #     flash[:error]  = t("users.reset.flash.error")
  #   end
    
  #   respond_to do |format|
  #     format.html {
  #       if saved
  #         redirect_to users_path
  #       else
  #         render scaffold_template(:edit)
  #       end
  #     }
  #     format.js
  #   end
  # end
  
  
  
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
      :id,
      :email,
      :role,
      :org_id,
      :first_name,
      :last_name,
      :banned,
      :phone,
      :address,
      :title,
      :bio,
      :avatar
    )
  end
  
end