class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
      redirect_to request.referer
    else
      render :index
    end 
  end 
  
  def update
     @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] ="ジャンル名を変更しました"
      redirect_to admin_genres_path
    else
      render :edit
    end 
  end 
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end 
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end 
end
