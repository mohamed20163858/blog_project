class AddLikeRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :like, null: false, foreign_key: true
  end
end
