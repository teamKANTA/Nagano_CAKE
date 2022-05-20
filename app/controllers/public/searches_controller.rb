class Public::SearchesController < ApplicationController
  def search
    @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(10)
    @quantity = Item.looks(params[:search], params[:word]).count
    @genres = Genre.all
  end
end
