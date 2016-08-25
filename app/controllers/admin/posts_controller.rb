class Admin::PostsController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update, :destroy]
  before_filter :authorize_post,    except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
    @post = Post.new
  end

  def create
    @post       = Post.new(post_params)
    @post.user  = current_user

    if @post.save
      redirect_to admin_posts_path
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @post.attributes = post_params
    if @post.save
      redirect_to admin_posts_path
    end
  end

  #========== READ ====================================

  def show
  end

  def index
    @posts = Post.all
  end

  #========== DESTROY ====================================

  def destroy
    if @post.destroy
      redirect_to admin_posts_path
    end
  end

  #----------------------------------------------------
  # Private Methods
  #----------------------------------------------------
  private

  def authorize_post
    authorize @post
  end

  def assign_record
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :title, :abstract, :body, :published)
  end


end