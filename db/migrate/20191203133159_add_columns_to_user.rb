class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_reference :users, :address, foreign_key: true
    add_reference :users, :store, foreign_key: true
    
  end
end
