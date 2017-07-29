class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_param)
    @page.save
    render 'index'
  end


  private

  def page_param
    params.require(:page).permit(:title, :summary, :story)
  end
end
