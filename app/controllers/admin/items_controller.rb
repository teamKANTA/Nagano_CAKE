class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
  end
  
  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新商品を登録しました"
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
