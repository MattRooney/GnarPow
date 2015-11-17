class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
      flash[:success] = "Item has been added to store"
    else
      flash.now[:error] = 'Please fill in required fields'
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :brand, :price, :category_id, :image)
  end
end
