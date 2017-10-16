class PagesController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create, :edit, :update]
  before_action :set_page, only: %i(show edit update destroy preview)

  def index
    @pages = Page.search_category(params[:category_id])
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # @categories = Category.all
  end

  def create
    @page = Page.new(page_param)
    @page.author = current_author
    @page.is_open = false if draft?
    @page.save
    redirect_to pages_path
  end

  def edit
  end

  def update
    if params[:preview]
      @page = Page.new page_param
      render :preview
      return
    end
    if draft?
      @page.is_open = false
    else
      @page.is_open = true
    end
    @page.update(page_param)
    render 'edit'
  end

  def destroy
    @page.delete
    # TODO: success message
    redirect_to pages_path
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_param
    params.require(:page).permit(Page::PAGE_ATTRIBUTES)
  end

  def draft?
    !params[:draft].nil?
  end
end
