class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :authenticate_admin!, only: [:destroy]
def index
  @posts = Post.all
if params[:genre].present?
  @selected_genre = Genre.find_by(name: params[:genre])
else # ジャンルが選択されていない場合
end
end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
@post.user_id = current_user.id
if @post.save
  redirect_to @post, notice: "Post was successfully created."
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
