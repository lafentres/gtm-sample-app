class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.boolean :admin, null: false, default: false
      t.string :username, null: false, limit: 50
      t.string :email, null: false, limit: 255
      t.string :password_digest, null: false
      t.string :remember_digest
      t.boolean :activated, null: false, default: false
      t.string :activation_digest
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :email
  end
end
