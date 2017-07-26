class HomeController < ApplicationController
  def index
    @author = current_author
  end
end
