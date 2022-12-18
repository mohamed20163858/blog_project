class AddPostsRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :post, null: true, foreign_key: true
  end
end
