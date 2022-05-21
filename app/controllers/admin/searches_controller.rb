class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "商品"
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "ジャンル"
      @genres = Genre.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "会員(姓カナ)"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
    @genre = Genre.new
  end
end
