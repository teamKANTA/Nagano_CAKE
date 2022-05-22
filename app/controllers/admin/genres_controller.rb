class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
    end 
  end 
  
  def update
  end 
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end 
end
