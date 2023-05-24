class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  has_one_attached :image
  belongs_to :genre

  validates :title, presence: true
  validates :body, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end


  def liked?(user)
    user.present? && likes.where(user_id: user.id).exists?
  end
end
