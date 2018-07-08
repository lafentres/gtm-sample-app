class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :post_id, null: false, limit: 8
      t.integer :user_id, null: false, limit: 8

      t.timestamps
    end

    add_foreign_key :likes, :users, on_delete: :cascade
    add_foreign_key :likes, :posts, on_delete: :cascade
    add_index :likes, [:user_id, :post_id], unique: true
    add_index :likes, :post_id
  end
end
