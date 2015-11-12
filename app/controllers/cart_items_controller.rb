class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.name)} in your cart."

    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:id].to_i)
    if @cart.contents.delete_if { |item_id, quantity| item_id == params[:id] }
      flash[:remove] = "You have removed the item #{view_context.link_to(item.name, item_path(item))} from your cart."
    end
    redirect_to cart_path
  end

end
