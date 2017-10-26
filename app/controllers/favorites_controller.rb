class FavoritesController < ApplicationController
  # https://stackoverflow.com/questions/22123422/how-to-redirect-to-nothing
  # https://qiita.com/geshi/items/536956b8bed7c2126187
  def create
    @author_id = current_author.id
    @page_id = Page.find(params[:id]).id
    Favorite.create!(page_id: @page_id, author_id: @author_id)
    respond_to do |format|
      format.js
    end
  end

  def delete
    @author_id = current_author.id
    @page_id = Page.find(params[:id]).id
    @favorite = Favorite.find_by(page_id: @page_id, author_id: @author_id)
    @favorite.destroy
    render nothing: true
  end
end
