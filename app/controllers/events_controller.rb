class EventsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_event,    except: [:index, :new, :create, :show]

  #========== READ ====================================

  def show
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @event = Event.friendly.find(params[:id])
  end

end