class AddLikeRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :like, null: false, foreign_key: true
  end
end
