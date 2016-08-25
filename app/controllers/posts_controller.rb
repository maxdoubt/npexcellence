class PostsController < ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_post,    except: [:index, :new, :create, :show]

  #========== READ ====================================

  def show
    # @users = @org.users.order(:last_name)
  end

  def index
    @posts = Post.where(spotlight: true)
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def assign_record
    @post = Post.friendly.find(params[:id])
  end

end