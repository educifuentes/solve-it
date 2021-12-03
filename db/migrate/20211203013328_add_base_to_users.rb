class AddBaseToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :status, :string
    add_column :users, :bio, :text
  end
end
