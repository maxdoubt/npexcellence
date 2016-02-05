class Admin::SettingsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only: [:edit, :update, :index, :destroy]


  #========== UPDATE ====================================

  def edit
  end

  def update
    @setting.attributes = setting_params
    if @setting.save
      redirect_to admin_settings_path
    end
  end

  #========== READ ====================================

  def index
    redirect_to edit_admin_setting_path(@setting)
  end

  #========== DESTROY ====================================

  def destroy
    if @setting.destroy
      redirect_to admin_settings_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @setting = current_setting
  end

  def setting_params
    params.require(:setting).permit(:id, :title, :phone, :address, :footer, :logo)
  end


end