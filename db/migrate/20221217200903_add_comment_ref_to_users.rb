class AddCommentRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :comment, null: true, foreign_key: true
  end
end
