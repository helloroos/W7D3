class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :password_digest, null: false
      t.integer :session_token, null: false
      t.index :username
      t.index :session_token, unique: true
      t.timestamps
    end
  end
end
