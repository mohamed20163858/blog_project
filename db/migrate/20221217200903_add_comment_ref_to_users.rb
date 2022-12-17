class AddCommentRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :comment, null: false, foreign_key: true
  end
end
