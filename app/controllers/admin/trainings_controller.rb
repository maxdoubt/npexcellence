class Admin::TrainingsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,       only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_training,  except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
    @training = Training.new
    authorize_training
  end

  def create
    @training = Training.new(training_params)

    if @training.save
      redirect_to admin_trainings_path
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @training.attributes = training_params
    if @training.save
      redirect_to admin_trainings_path
    end
  end

  #========== READ ====================================

  def show
    @users = @training.users.order(:last_name)
  end

  def index
    @trainings = Training.all
  end

  #========== DESTROY ====================================

  def destroy
    if @training.destroy
      redirect_to admin_trainings_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_training
    authorize @training
  end

  def assign_record
    @training = Training.friendly.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:id, 
                                     :name,
                                     :location,
                                     :description,
                                     :facilitators,
                                     :begin_date,
                                     :end_date,
                                     :max_registrations,
                                     :active,
                                     :featured,
                                     :fee,
                                     :training_category_id)
  end


end