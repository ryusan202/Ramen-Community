class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

def index
  @posts = Post.all

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

# def search
#   @keyword = params[:keyword]
#   # orderメソッドへ代入する値を条件分岐
#   # params[:sort].nil? ? sort  = "created_at DESC" : sort = params[:sort]をリファクタリング
#   sort = params[:sort] || "created_at DESC"
#   # 入力された値をLIKE句により各カラムと一致したものを抽出する。
#   @products = Product.where('name LIKE(?) OR description LIKE(?)', "%#{@keyword}%", "%#{@keyword}%").order(sort)
#   @count = @products.count
#   # 検索結果が"0"だった場合、全ての商品を表示させる
#   if @count == 0
#     @products = Product.order(sort)
#   end
# end

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
    
    render :index
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @posts = [@post] 
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :image)
  end
end
