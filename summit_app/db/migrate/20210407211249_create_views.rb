class CreateViews < ActiveRecord::Migration[5.2]
  def change
    create_table :views do |t|
      t.integer :goal_id, null: false
      t.integer :viewer_id, null: false
      t.index :goal_id
      t.index :viewer_id
      t.timestamps
    end
  end
end
