class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
	  t.references :post
    end
  end
end
