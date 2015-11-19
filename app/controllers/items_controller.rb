class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def deal
    @featured_item = Item.find_by(name: "gnar possum")
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :price, :category_id, :image)
  end
end
