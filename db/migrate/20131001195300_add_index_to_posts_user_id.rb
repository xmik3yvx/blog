class AddIndexToPostsUserId < ActiveRecord::Migration
  def change
    add_index :posts, :user_id, unique: true
  end
end
