class AddCommentRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :comment, null: true, foreign_key: true
  end
end
