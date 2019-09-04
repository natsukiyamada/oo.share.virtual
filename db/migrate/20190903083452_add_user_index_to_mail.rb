class AddUserIndexToMail < ActiveRecord::Migration[5.2]
  def change
  	add_index :users, :name
    add_index :users, :mail, unique: true
  end
end
