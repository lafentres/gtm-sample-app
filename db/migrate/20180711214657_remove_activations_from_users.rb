class RemoveActivationsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :activated, :boolean, null: false, default: false
    remove_column :users, :activation_digest, :string
    remove_column :users, :activated_at, :datetime
  end
end
