class FavoritesController < ApplicationController
  # https://stackoverflow.com/questions/22123422/how-to-redirect-to-nothing
  # https://qiita.com/geshi/items/536956b8bed7c2126187
  def create
    page = Page.find(params[:id])
    fav = Favorite.create!(page_id: page.id, author_id: current_author.id)
    @page = fav.page
  end

  def delete
    page = Page.find(params[:id])
    @favorite = Favorite.find_by(page_id: page.id, author_id: current_author.id)
    @page = @favorite.page if @favorite.destroy
  end
end
