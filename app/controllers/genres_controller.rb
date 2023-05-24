# app/controllers/genres_controller.rb
class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end
  
  def index
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path, notice: "ジャンルを作成しました。"
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
