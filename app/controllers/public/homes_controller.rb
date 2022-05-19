class Public::HomesController < ApplicationController
  def top
    @genre = Genre.all
    @item = Item.all
  end

  def about
  end
end
