class PagesController < ApplicationController
  before_action :authenticate_author!, only: %i[new create edit update]
  before_action :set_page, only: %i[show edit update destroy preview]
  before_action :tag_cloud, only: %i[index tag category]

  def index
    @pages = Page.page(params[:page])
  end

  def show; end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_param)
    @page.author = current_author
    @page.draft! if is_draft?
    @page.save
    redirect_to pages_path
  end

  def edit; end

  def update
    if params[:preview]
      @page = Page.new page_param
      return render :preview
    end
    is_draft? ? @page.draft! : @page.published!
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
    @pages = Page.search_tag(params[:name]).page(params[:page])
    render 'index'
  end

  def category
    @pages = Page.search_category(params[:name]).page(params[:page])
    render 'index'
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_param
    params.require(:page).permit(Page::PAGE_ATTRIBUTES)
  end

  def is_draft?
    params[:draft].present?
  end
end
