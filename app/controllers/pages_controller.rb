class PagesController < ApplicationController
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
    @page.save
    if params[:draft]
      @page.is_open = false
      @page.save
    end
    redirect_to new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_param)
    render 'edit'
  end


  private

  def page_param
    params.require(:page).permit(:title, :summary, :story, :cover)
  end
end
