class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
def index
  likes = Like.where(user_id: current_user.id).pluck(:post_id)
 like_posts = Post.where(id: likes)
  @posts = Kaminari.paginate_array(like_posts).page(params[:page]).per(3)

end

 def create
  @post = Post.find(params[:post_id])
  like = current_user.likes.new(post_id: @post.id, user_id: current_user.id)
  like.save
 end

def destroy
  @post = Post.find(params[:post_id])
  like = current_user.likes.find_by(post_id: @post.id, user_id: current_user.id)
  like.destroy
end

private
  def set_user
    @user = current_user
  end
end
