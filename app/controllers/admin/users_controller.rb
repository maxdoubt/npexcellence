class Admin::UsersController < Admin::ApplicationController
  
  #-------------------------------------------------
  # Configuration
  #-------------------------------------------------
  
  before_filter :require_user
  
  load_and_authorize_resource
  
  before_filter :assign_role_if_allowed, :only => [:create, :update]
  
  
  
  #-------------------------------------------------
  # Public methods
  #-------------------------------------------------
  
  # This method lists all the records that cancan allows the user to see.
  #
  def index
    @keywords     = params[:keywords].to_s.strip
    @type         = params[:type].to_s.strip
    @current_page = (params[:current_page] || 1).to_i
    
    keywords  = @keywords.split(/\s+/).uniq
    limit_to  = @current_page * 20
    
    relation = scaffold_class.accessible_by(current_ability, :read)
    relation = relation.for_keywords(keywords)      unless keywords.empty?
    relation = relation.send("#{@type}_only")       unless @type.blank?
    
    @has_criteria       = !([@keywords, @type].reject(&:blank?).empty?)
    @total_count        = relation.count
    instance_variable_set("@#{scaffold_collection_name}", relation.order("last_name, first_name").limit(limit_to).all)
    @current_count      = scaffold_collection.size
    
    render scaffold_template(:index)
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
  
  
  # This method updates the record so that it reports as active.
  #
  def activate
    @user.activate
    saved = @user.save
    
    if saved
      flash[:notice] = t("users.activate.flash.success")
    else
      flash[:error]  = t("users.activate.flash.error")
    end
    
    respond_to do |format|
      format.html {
        if saved
          redirect_to users_path
        else
          render scaffold_template(:edit)
        end
      }
      format.js
    end
  end
  
  
  # This method updates the record so that it reports as inactive.
  #
  def deactivate
    @user.deactivate
    saved = @user.save
    
    if saved
      flash[:notice] = t("users.deactivate.flash.success")
    else
      flash[:error]  = t("users.deactivate.flash.error")
    end
    
    respond_to do |format|
      format.html {
        if saved
          redirect_to users_path
        else
          render scaffold_template(:edit)
        end
      }
      format.js
    end
  end
  
  
  # This method resets the user's password and send him an activation
  # email.
  #
  def reset    
    @user.reset_password
    saved = @user.save
    
    if saved
      flash[:notice] = t("users.reset.flash.success")
      Admin::UserMailer.password_reset(@user).deliver
    else
      flash[:error]  = t("users.reset.flash.error")
    end
    
    respond_to do |format|
      format.html {
        if saved
          redirect_to users_path
        else
          render scaffold_template(:edit)
        end
      }
      format.js
    end
  end
  
  
  
  #-------------------------------------------------
  # Private methods
  #-------------------------------------------------
  
  # This method assigns the role_id parameter (or not)
  # depending on the current user's ability.
  #
  def assign_role_if_allowed
    if can? :assign_role, @user
      @user.role_id = params[:user][:role_id]
    end
  end
  
end