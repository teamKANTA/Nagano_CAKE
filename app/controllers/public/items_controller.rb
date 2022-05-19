class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  def search
    @items = Item.where(genre_id: params[:format]).page(params[:page]).per(8) 
    render 'index' 
  end
end