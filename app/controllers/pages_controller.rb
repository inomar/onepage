class PagesController < ApplicationController
  before_action :authenticate_author!, only: %i[new create edit update]
  before_action :set_page, only: %i[show edit update destroy preview]
  before_action :tag_cloud, only: %i[index tag category]

  def index
    @pages = Page.page(params[:page]).by_join_date
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

  def edit
    redirect_to root_path unless @page.has_current_author?(current_author)
  end

  def update
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

  def search_image
    render json: search_images(params[:q])
  end

  private

  def set_page
    @page = Page.find(params[:id])
    @book_cover = get_image(@page.image_id).dig('urls', 'regular')
  end

  def page_param
    params.require(:page).permit(Page::PAGE_ATTRIBUTES)
  end

  def is_draft?
    params[:draft].present?
  end

  def search_images(query)
    search_result = Unsplash::Photo.search(query)
    search_result.map do |result|
      search_params(result)
    end
  end

  def get_image(id)
    Unsplash::Photo.find(id)
  rescue => e
    puts e.message
  end

  def search_params(param)
    {
        id: param.id,
        image: param.urls.raw,
        regular_image: param.urls.regular,
        full_image: param.urls.full,
        small_image: param.urls.small,
        thumb_image: param.urls.thumb
    }
  end
end
