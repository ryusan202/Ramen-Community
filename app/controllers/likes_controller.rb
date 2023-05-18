class LikesController < ApplicationController
  before_action :authenticate_user!
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

def index
  @user = current_user
  @liked_posts = @user.liked_posts.all
end
end
