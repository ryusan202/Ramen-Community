class AddUserIdAndPostIdToLikes < ActiveRecord::Migration[6.1]
def down
  remove_column :likes, :user_id
  remove_column :likes, :post_id
end
end
