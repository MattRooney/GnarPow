class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
      flash[:success] = 'Item has been added to store'
    else
      flash.now[:error] = 'Please fill in required fields'
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:deleted] = 'You have removed the item from the store.'
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :price, :category_id, :image)
  end
end
