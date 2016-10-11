class ListingsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,      only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_listing,  except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
    @listing = Listing.new
    authorize_listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to admin_listings_path
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @listing.attributes = listing_params
    if @listing.save
      redirect_to admin_listings_path
    end
  end

  #========== READ ====================================

  def show
  end

  def index
    @listings = Listing.all
  end

  #========== DESTROY ====================================

  def destroy
    if @listing.destroy
      redirect_to admin_listings_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_listing
    authorize @listing
  end

  def assign_record
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name,
                                    :org_id,
                                    :user_id,
                                    :org_name,
                                    :title,
                                    :state,
                                    :email,
                                    :phone,
                                    :url,
                                    :description,
                                    :responsibilities,
                                    :qualifications,
                                    :instructions,
                                    :date_posted,
                                    :full_time,
                                    :upload)


  end


end