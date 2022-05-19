class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirmation
    @order = Order.new(order_params)
    @customer = current_customer
    @payment_method = @order.method_of_payment
    #会員に登録された住所
    if params[:order][:shipping_address] == "my_address"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.family_name + @customer.first_name
    #登録済み住所から選択された住所
    elsif params[:order][:shipping_address] == "registered_address"
      @address = ShippingAddress.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    @order.save
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    #@order_details = OrderDetails.new
    #@order_details.order_id = @order.id
    #cart_items = current_customer.cart_items.all

    #カート内アイテムの商品ごとにorder_detailを
    #@cart_items.each do |cart_item|
      #@order_details.item_id = cart_item.item.id
      #@order_details.price = cart_items.price
      #@order_details.quantity = cart_item.quantity
      #@order_details.save!
    #end

    #カート内アイテムを全削除
    #CartItem.destroy_all
    redirect_to completed_path
  end

  def completed
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_address, :postal_code, :address, :name)
  end


end
