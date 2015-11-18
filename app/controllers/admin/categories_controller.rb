class Admin::CategoriesController < ApplicationController
  def show
    # need to remember to downcase the title's somewhere - not sure if
    # they should be stored in db downcased?
    @category = Category.find_by_slug(params[:slug])
  end

  def index
    @categories = Category.all
  end
end
