class Admin::ListingImportsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  # before_filter :authorize_listing,     except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
  end

  def create
    Listing.import(params[:listing_import][:file])
    redirect_to admin_listings_path, notice: "Listings imported."
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_listing
    authorize @listing
  end

  def listingimport_params
    params.require(:listing_import).permit(:file)
  end


end