class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.decimal :AuthorId
      t.decimal :PostId

      t.timestamps
    end
  end
end
