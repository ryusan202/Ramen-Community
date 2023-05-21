class GenresController < ApplicationController
    def index
    @genres = Genre.all
    @new_genre = Genre.new
    end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルを登録しました。"
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
  def edit
  @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンルを更新しました。"
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      redirect_to admin_genres_path, notice: "ジャンルを削除しました。"
    else
      @genres = Genre.all
      render 'index'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
end
