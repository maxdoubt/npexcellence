class PagesController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only: [:show, :edit, :update]


  def home
    @page = Page.find(1)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_path
    end
  end

  def edit
  end

  def update
    @page.attributes = page_params
    if @page.save
      redirect_to pages_path
    end
  end

  def show
  end

  def index
    @pages = Page.all
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