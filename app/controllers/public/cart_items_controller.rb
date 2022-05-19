class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.item_id = cart_item_params[:item_id]
    end

    if @cart_item.save
      flash[:notice] = "カートに商品が追加されました。"
      redirect_to cart_items_path
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

  def empty
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
