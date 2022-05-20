class Public::ItemsController < ApplicationController
  def index
     @items = Item.all.page(params[:page]).per(10)
     @quantity = Item.count
     @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    #binding.pry
    @items = Item.where(genre_id: params[:format]).page(params[:page]).per(8)
    @quantity = Item.where(genre_id: params[:format]).count
    @genres = Genre.all
    @genre = Genre.find(params[:format])
    render 'index'
  end
end