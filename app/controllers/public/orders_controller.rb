class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirmation
    @order = Order.new(order_params)
    #送料（一律600円)
    @order.shipping_fee = 600
    #カートアイテム呼び出し
    @cart_items = current_customer.cart_items.all
    #カートアイテム内合計金額
    @cart_items_total = @cart_items.inject(0) {|sum, item| sum+item.subtotal}
    #請求金額
    @order.billing_amount = @order.shipping_fee + @cart_items_total
    #newページで選択した支払方法を呼び出す
    @payment_method = @order.method_of_payment
    #会員に登録された住所
    if params[:order][:shipping_address] == "my_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
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
    #送料（一律600円)
    @order.shipping_fee = 600
    #カートアイテム呼び出し
    @cart_items = current_customer.cart_items.all
    #カートアイテム内合計金額
    @cart_items_total = @cart_items.inject(0) {|sum, item| sum+item.subtotal}
    #請求金額
    @order.billing_amount = @order.shipping_fee + @cart_items_total
    @order.customer_id = current_customer.id
    @order.save

    #カート内アイテムの商品ごとにorder_detailを登録
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.quantity = cart_item.quantity
      @order_details.save!
    end

    #カート内アイテムを全削除
    CartItem.destroy_all
    redirect_to completed_path
  end

  def completed
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
    @order_details = OrderDetail.where(order_id: @order)
    @total = @order.order_details.inject(0) {|sum, order_detail| sum + order_detail.subtotal}
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_address, :postal_code, :address, :name)
  end


end
