class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def date_base
    @comments = PostComment.all
    @posts = Post.all
    @users = User.all
  end

  def destroy_comment
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to admin_page_path, notice: 'コメントが削除されました。'
  end


def destroy_post
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to admin_page_path, notice: '投稿が削除されました。'
end

end