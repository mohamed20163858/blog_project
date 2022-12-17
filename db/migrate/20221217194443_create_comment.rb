class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.decimal :AuthorId
      t.decimal :PostId
      t.text :Text

      t.timestamps
    end
  end
end
