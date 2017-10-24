class PagesController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create, :edit, :update]
  before_action :set_page, only: %i(show edit update destroy preview)
  before_action :tag_cloud, only: %i(index tag category)

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
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

  def tag_cloud
    @tags = Page.tag_count
  end

  def tag
    @pages = Page.search_tag(params[:name])
    render 'index'
  end

  def category
    @pages = Page.search_category(params[:name])
    render 'index'
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
