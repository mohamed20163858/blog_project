class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.decimal :AuthorId
      t.string :Title
      t.text :Text
      t.decimal :CommentsCounter
      t.decimal :LikesCounter
      t.timestamps
    end
  end
end
