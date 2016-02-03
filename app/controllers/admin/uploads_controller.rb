class Admin::UploadsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only: [:show, :edit, :update, :destroy]

  #========== CREATE ====================================

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      if params[:contentType] == 'application/json'
        render :json => {:link => @upload.upload.url}.to_json
      else
        redirect_to admin_uploads_path
      end
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @upload.attributes = upload_params
    if @upload.save
      redirect_to admin_uploads_path
    end
  end

  #========== READ ====================================

  def show
  end

  def index
    @uploads = Upload.all
  end

  #========== DESTROY ====================================

  def destroy
    if @upload.destroy
      redirect_to admin_uploads_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @upload = Upload.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:id, :upload)
  end


end