class AddGenreIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :genre, foreign_key: true
  end
end
