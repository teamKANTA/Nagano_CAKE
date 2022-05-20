class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新商品を登録しました"
      redirect_to admin_items_path
    else
      render "admin/items/new"
    end
  end

  def update

  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :item_image, :genre_id)
  end
end
