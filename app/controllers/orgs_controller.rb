class OrgsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_org,     except: [:index, :new, :create, :show]

  #========== READ ====================================

  def show
    # @users = @org.users.order(:last_name)
  end

  def index
    @orgs = Org.where(spotlight: true)
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @org = Org.friendly.find(params[:id])
  end

end