class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 255
      t.string :description, null: false, limit: 255
      t.string :author, null: false
      t.string :image, null: false
      t.integer :image_width, null: false
      t.integer :image_height, null: false

      t.timestamps
    end
    add_column :posts, :category, "ENUM('cats','dogs','birds', 'others')", default: 'others', null: false, after: :description
  end
end
