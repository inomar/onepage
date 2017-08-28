class PagesController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create, :edit, :update]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_param)
    @page.author = current_author
    @page.is_open = false if draft?
    @page.save
    redirect_to new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if draft?
      @page.is_open = false
    else
      @page.is_open = true
    end
    @page.update(page_param)
    render 'edit'
  end


  private

  def page_param
    params.require(:page).permit(:title, :summary, :story, :cover)
  end

  def draft?
    !params[:draft].nil?
  end
end
