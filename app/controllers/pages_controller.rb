class PagesController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only: [:show, :edit, :update]


  #----------------------------------------------------
  # Read
  #----------------------------------------------------

  def show
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