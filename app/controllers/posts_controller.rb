class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :authenticate_admin!, only: [:destroy]

def index
  if params[:genre].present?
    @posts = Post.includes(:genre).where(genres: { id: params[:genre] })
  else
    @posts = Post.all
  end
  @genres = Genre.all
end


  def new
    @post = Post.new
  end

def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  @post.genre_id = params[:post][:genre_id] # ジャンルの選択値を設定する

  if @post.save
    redirect_to @post, notice: "投稿が作成されました。"
  else
    render :new
  end
end




  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @posts = [@post] 
  end
  
def destroy
  @post = Post.find(params[:post_id])
  @post.destroy
  redirect_to posts_path, notice: '投稿が削除されました。'
end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :image)
  end

end
