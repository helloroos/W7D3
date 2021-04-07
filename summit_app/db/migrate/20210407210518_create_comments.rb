class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.integer :goal_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.index :author_id
      t.index :goal_id
      t.index [:title, :author_id], unique: true
      t.timestamps
    end
  end
end
