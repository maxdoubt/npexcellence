class TrainingsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_training,    except: [:index, :new, :create, :show]

  #========== READ ====================================

  def show
    # @users = @org.users.order(:last_name)
  end

  def index
    @trainings = Training.where(active: true)
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @training = Training.friendly.find(params[:id])
  end

end