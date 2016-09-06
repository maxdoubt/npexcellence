class RegistrationsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_training,    except: [:index, :new, :create, :show]

  #========== CREATE ==================================

  def new
    if current_user
      training      = Training.friendly.find(:training_id)
      @registration = Registration.new
      @registration.training = training
    else
      redirect_to new_user_path
    end
  end


  #========== READ ====================================

  def show
    # @users = @org.users.order(:last_name)
  end

  def index
    @registrations = Registration.where(user_id: current_user)
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @registration = Registration.find(params[:id])
  end

end