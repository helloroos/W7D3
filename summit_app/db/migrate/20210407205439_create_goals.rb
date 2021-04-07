class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :owner_id, null: false
      t.string :task, null: false
      t.string :status, null: false
      t.index :owner_id

      t.timestamps
    end
  end
end
