class Public::CartItemsController < ApplicationController
  #before_action :authenticate_user!


  def create
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
    end

    if @cart_item.save
      redirect_to orders_path
    end
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(parmas[:id])
    @cart_item.destroy
  end

  def empty
    @cart_items = current_customer.cart_items
    @cart_items.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
