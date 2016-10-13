class Admin::EventsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,       only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_event,  except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
    @event = Event.new
    authorize_event
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to admin_events_path
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @event.attributes = event_params
    if @event.save
      redirect_to admin_events_path
    end
  end

  #========== READ ====================================

  def show
    @users = @event.users.order(:last_name)
  end

  def index
    @events = Event.all
  end

  #========== DESTROY ====================================

  def destroy
    if @event.destroy
      redirect_to admin_events_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_event
    authorize @event
  end

  def assign_record
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name,
                                  :state,
                                  :url,
                                  :summary,
                                  :description,
                                  :location,
                                  :all_day,
                                  :begin_date,
                                  :end_date,
                                  :photo,
                                  :user_id,
                                  :org_id)
  end


end