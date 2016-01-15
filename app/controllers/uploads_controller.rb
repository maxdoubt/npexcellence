class UploadsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only: [:show, :edit, :update, :destroy]

  #----------------------------------------------------
  # Create
  #----------------------------------------------------

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      if params[:contentType] == 'application/json'
        render :json => {:link => @upload.upload.url}.to_json
      else
        redirect_to uploads_path
      end
    end
  end

  #----------------------------------------------------
  # Update
  #----------------------------------------------------

  def edit
  end

  def update
    @upload.attributes = upload_params
    if @upload.save
      redirect_to uploads_path
    end
  end

  #----------------------------------------------------
  # Read
  #----------------------------------------------------

  def show
  end

  def index
    @uploads = Upload.all
  end

  #----------------------------------------------------
  # Read
  #----------------------------------------------------

  def destroy
    if @upload.destroy
      redirect_to uploads_path
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