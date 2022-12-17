class AddPostsRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :post, null: false, foreign_key: true
  end
end
