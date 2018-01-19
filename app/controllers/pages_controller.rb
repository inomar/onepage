class PagesController < ApplicationController
  before_action :authenticate_author!, only: %i[new create edit update]
  before_action :set_page, only: %i[show edit update destroy preview]
  before_action :tag_cloud, only: %i[index search tag category]
  before_action :set_category, only: %i[new edit create update]

  def index
    @pages = Page.page(params[:page])
                 .published
                 .live
                 .by_join_date
  end

  def show
    redirect_to pages_path if @page.trashed?
    if @page.draft?
      redirect_to pages_path unless @page.has_current_author?(current_author)
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_param)
    @page.author = current_author
    if @page.save_draft # || is_draft?
      is_draft? ? @page.draft! : @page.published!
      redirect_to pages_path
    else
      render :new
    end
  end

  def draft

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
    @page.draft_destruction
    # TODO: success message
    redirect_to pages_path
  end

  def search
    @pages = Page.search(params[:q])
                 .page(params[:page])
                 .published
                 .live
    render :index
  end

  def tag_cloud
    @tags = Page.tag_count
  end

  def tag
    @pages = Page.search_tag(params[:name])
                 .page(params[:page])
                 .published
                 .live
                 .by_join_date
    render 'index'
  end

  def category
    @pages = Page.search_category(params[:name])
                 .page(params[:page])
                 .published
                 .live
                 .by_join_date
    render 'index'
  end

  def search_image
    render json: search_images(params[:q])
  end

  private

  def set_page
    @page = Page.find(params[:id])
    # TODO: bookcoverの取り扱い
    @book_cover = nil #get_image(@page.image_id).dig('urls', 'regular')
  end

  def set_category
    @categories = Category.all.pluck(:name,:id)
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
