class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @item = Item.find(params[:id])
    @order_detail = OrderDetail.find_by(order_id: @order.id, item_id: @item.id)
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order)
  end 
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
