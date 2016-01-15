class PagesController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only: [:show, :edit, :update]


  #----------------------------------------------------
  # Create
  #----------------------------------------------------

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_path
    end
  end

  #----------------------------------------------------
  # Update
  #----------------------------------------------------


  def edit
  end

  def update
    @page.attributes = page_params
    if @page.save
      redirect_to pages_path
    end
  end

  #----------------------------------------------------
  # Read
  #----------------------------------------------------

  def show
  end

  def index
    @pages = Page.all
  end

  def home
    @page = Page.find(1)
  end

  def test
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:id, :title, :body, :parent_id)
  end


end