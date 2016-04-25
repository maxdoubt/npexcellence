class Admin::OrgsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_org,     except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
    @org = Org.new
    authorize_org
  end

  def create
    @org = Org.new(org_params)

    if @org.save
      redirect_to admin_orgs_path
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @org.attributes = org_params
    if @org.save
      redirect_to admin_orgs_path
    end
  end

  #========== READ ====================================

  def show
    @users = @org.users.order(:last_name)
  end

  def index
    @orgs = Org.all
  end

  #========== DESTROY ====================================

  def destroy
    if @org.destroy
      redirect_to admin_orgs_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_org
    authorize @org
  end

  def assign_record
    @org = Org.friendly.find(params[:id])
  end

  def org_params
    params.require(:org).permit(:id, 
                                :name, 
                                :role, 
                                :active, 
                                :spotlight, 
                                :phone, 
                                :address, 
                                :contact, 
                                :email, 
                                :website, 
                                :description, 
                                :inspiration, 
                                :pride, 
                                :involvement, 
                                :alliance, 
                                :interviewee, 
                                :interviewee_title, 
                                :funding, 
                                :logo, 
                                :photo, 
                                :photo_two, 
                                :photo_three, 
                                :photo_four)
  end


end