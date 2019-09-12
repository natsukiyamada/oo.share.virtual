class ChangeColumnIntegerToBigintIdInUserTable < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :id, :bigint
  end

  def down
    change_column :users, :id, :integer
  end
end
