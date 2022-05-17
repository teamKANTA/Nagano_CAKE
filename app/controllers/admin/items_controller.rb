class Admin::ItemsController < ApplicationController
  def index
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
  end 
  
  def update
  end 
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :item_image, :genre)
  end 
end
