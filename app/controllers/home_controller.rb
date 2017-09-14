class HomeController < ApplicationController
  def index
    @author = current_author
    @templates = Template.all
  end
end
