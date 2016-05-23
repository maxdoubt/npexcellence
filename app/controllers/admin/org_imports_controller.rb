class Admin::OrgImportsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  # before_filter :authorize_org,     except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
  end

  def create
    Org.import(params[:org_import][:file])
    redirect_to admin_orgs_path, notice: "Orgs imported."
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_org
    authorize @org
  end

  def orgimport_params
    params.require(:org_import).permit(:file)
  end


end