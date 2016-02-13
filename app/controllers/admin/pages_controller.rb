class Admin::PagesController < Admin::ApplicationController

  #----------------------------------------------------
  # Configuration
  #----------------------------------------------------

  # callbacks
  before_filter :assign_record,     only:   [:show, :edit, :update]
  before_filter :authorize_page,    except: [:index, :new, :create]

  #========== CREATE ====================================

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path
    end
  end

  #========== UPDATE ====================================

  def edit
  end

  def update
    @page.attributes = page_params
    if @page.save
      redirect_to admin_pages_path
    end
  end

  # update rails tree (awesome_nested_set) from JSON array (nestedSortable)
  def reorganize
    list = params[:list]
    prev_page = nil
    list.each_with_index do |item, i|
      item_params = item[1]

      page = Page.find(item_params['id'].to_i)
 
      # if root of tree on rails side
      if item_params['parent_id'] == ''
        page.parent_id = nil
        page.save

      else
        page.parent_id = item_params['parent_id'].to_i
        page.save
                  
        # shift to the right of previous element if parent is the same
        if prev_page.parent_id == page.parent_id
          page.move_to_right_of(prev_page.id)
        else

          # iterate backwards to find last sibling
          current_index = i - 1 
          found_sibling = false
          keys = list.keys

          while found_sibling == false and current_index > 0 do
            if list[keys[current_index]]['parent_id'] == item_params['parent_id']
              page.move_to_right_of(list[keys[current_index]]['id'])
              found_sibling = true
            else
              current_index -= 1
            end
          end

        end
      end

      # set previous item
      prev_page = page

    end

    respond_to do |format|
      format.json { head :ok }    
    end
  end

  #========== READ ====================================

  def show
  end

  def index
    @pages = Page.where(parent_id: nil).order(:lft)
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

  def authorize_page
    authorize @page
  end

  def assign_record
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:id, :title, :body, :parent_id)
  end


end